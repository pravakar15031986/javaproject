package com.csm.ORSAC.adminconsole.webportal.serviceImpl;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.csm.ORSAC.adminconsole.webportal.bean.PrimaryLinkReqDto;
import com.csm.ORSAC.adminconsole.webportal.bean.SetPermissionReqDto;
import com.csm.ORSAC.adminconsole.webportal.entity.AdminRole;
import com.csm.ORSAC.adminconsole.webportal.entity.GlobalLinkAccess;
import com.csm.ORSAC.adminconsole.webportal.entity.PrimaryLink;
import com.csm.ORSAC.adminconsole.webportal.repository.GroupLinkAccessRepository;
import com.csm.ORSAC.adminconsole.webportal.service.GroupLinkAccessService;

@Service("groupLinkAccessService")
public class GroupLinkAccessServiceImpl implements GroupLinkAccessService {

	public static final Logger LOG = LoggerFactory.getLogger(GroupLinkAccessServiceImpl.class);

	@Autowired
	@Qualifier("groupLinkAccessRepository")
	GroupLinkAccessRepository groupLinkAccessRepository;

	@Override
	public boolean updateGroupLinkAccess(SetPermissionReqDto setPermissionDto) {
		boolean isUpdated = false;

		try {
			int groupId = setPermissionDto.getUid();
			List<PrimaryLinkReqDto> primaryLinksdto = setPermissionDto.getPrimaryLink();
			List<GlobalLinkAccess> globalLinks = new ArrayList<>();
			globalLinks = groupLinkAccessRepository.getGroupLinkAccessListByGroupId(groupId);
			LOG.info("globalLinks"+globalLinks);									
			List<GlobalLinkAccess> newGlinks = new ArrayList<>();

			for (PrimaryLinkReqDto plinkdto : primaryLinksdto) {
				int plinkId = plinkdto.getpLinkId();
				String action = plinkdto.getAction() + "";
				GlobalLinkAccess linkAcc = new GlobalLinkAccess();
				AdminRole grp = new AdminRole();
				grp.setRoleId(groupId);
				linkAcc.setAdm_role(grp);
				PrimaryLink plnk = new PrimaryLink();
				plnk.setPrimaryLinkId(plinkId);
				linkAcc.setPrimaryLink(plnk);

				checkGlobalLink(globalLinks, linkAcc);
				int index = checkGlobalLink(globalLinks, linkAcc);
				if (index >= 0) {
					globalLinks.get(index).setAction(action);
					globalLinks.get(index).setUpdatedBy(1); // putting default admin user id.
					globalLinks.get(index).setUpdatedOn(new Timestamp(new java.util.Date().getTime()));
					globalLinks.get(index).setStatus(false);
					isUpdated = true;
				} else {
					linkAcc.setCreatedBy(8); // putting default admin user id.
					linkAcc.setCreateOn(new Timestamp(new java.util.Date().getTime()));
					linkAcc.setAction(action);
					linkAcc.setUpdatedBy(8); // putting default admin user id.
					linkAcc.setUpdatedOn(new Timestamp(new java.util.Date().getTime()));
					linkAcc.setStatus(false);
					newGlinks.add(linkAcc);
				}
			}
			if (!newGlinks.isEmpty()) {
				List<GlobalLinkAccess> newRec = groupLinkAccessRepository.saveAll(newGlinks);
				if (!newRec.isEmpty() && newRec.size() > 0)
					isUpdated = true;
			}
			groupLinkAccessRepository.flush();
			/* filter unchecked primary link ids to change status */
			List<Integer> plinkIds = globalLinks.stream().map(p -> p.getPrimaryLink().getPrimaryLinkId())
					.collect(Collectors.toList()); // Existing primary links id.
			List<Integer> plinkIdsDto = primaryLinksdto.stream().map(pdto -> pdto.getpLinkId())
					.collect(Collectors.toList()); // requested primary links id.

			plinkIds.removeAll(plinkIdsDto);

			/* deactive unchecked primary links */
			globalLinks = globalLinks.stream().filter(p -> plinkIds.contains(p.getPrimaryLink().getPrimaryLinkId()))
					.collect(Collectors.toList());
			for (GlobalLinkAccess userLink : globalLinks) {
				userLink.setStatus(true);
			}
			groupLinkAccessRepository.flush();

			return isUpdated;

			

		} catch (Exception e) {
			LOG.error("GroupLinkAccessServiceImpl::updateGroupLinkAccess():" + e);
		}
		return isUpdated;
	}

	int checkGlobalLink(List<GlobalLinkAccess> list, GlobalLinkAccess glnkacc) {
		int index = -1;
		int count = 0;
		for (GlobalLinkAccess glnk : list) {
			if (glnk.getPrimaryLink().getPrimaryLinkId() == glnkacc.getPrimaryLink().getPrimaryLinkId()) {
				index = count;
				return index;
			}
			count = count + 1;
		}
		return index;
	}
	

}
