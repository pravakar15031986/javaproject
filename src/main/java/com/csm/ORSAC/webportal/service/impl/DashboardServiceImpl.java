package com.csm.ORSAC.webportal.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.csm.ORSAC.webportal.bean.DashBoardBean;
import com.csm.ORSAC.webportal.entity.PacsInspectorDto;
import com.csm.ORSAC.webportal.repository.LevelDetailsRepository;
import com.csm.ORSAC.webportal.repository.PacsInspectorRepository;
import com.csm.ORSAC.webportal.repository.SurveyRepository;
import com.csm.ORSAC.webportal.service.DashboardService;

@Service
public class DashboardServiceImpl implements DashboardService {
	
	@Autowired
	LevelDetailsRepository levelrepo;
	
	@Autowired
	PacsInspectorRepository pacsRepo;
	
	@Autowired
	SurveyRepository surveyRepo;

	@Override
	public long totalDistricts() {
		long count = 0;
		try {
			List<Object[]> objList = levelrepo.getDistrictList();
			count = objList.size();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	@Override
	public List<DashBoardBean> getdistrictWiseSurveyList() {
		DashBoardBean districtDashboardBean=null;
		List<DashBoardBean> dataList=new ArrayList<DashBoardBean>();
		try {
			List<Object[]> objList=levelrepo.getDistrictList();
			for(Object[] obj:objList) {
				districtDashboardBean = new DashBoardBean();
				districtDashboardBean.setDistName(String.valueOf(obj[1]));
				String distCode = String.valueOf(obj[0]);
				List<PacsInspectorDto> surveyorDto = pacsRepo.findByDistrictId(distCode);
				long totalSurveyors = surveyorDto.stream().filter(data->data.getStatus()==3).count();
				districtDashboardBean.setTotalSurveyors(totalSurveyors);
				long completedSurvey = Long
						.parseLong(String.valueOf(surveyRepo.fetchDistrictcompletedSurveyCount(distCode)));
				districtDashboardBean.setCompletedSurvey(completedSurvey);

				long totalSurvey = Long.parseLong(String.valueOf(surveyRepo.fetchDistTotalSurveyCount(distCode)));
				districtDashboardBean.setTotalSurvey(totalSurvey);

				long pendingSurvey = totalSurvey - completedSurvey;
				districtDashboardBean.setPendingSurvey(pendingSurvey);

				dataList.add(districtDashboardBean);
				
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dataList;
	}

	@Override
	public DashBoardBean getSurveyStatus() {
		DashBoardBean dashboardBean = null;
		
		try {

			long CompletedSurvey = Long.parseLong(String.valueOf(surveyRepo.fetchCompletedSurveyCount()));
			long totalSurvey = Long.parseLong(String.valueOf(surveyRepo.fetchTotalSurveyCount()));
			long pendingSurvey = totalSurvey - CompletedSurvey;
			dashboardBean = new DashBoardBean();
			dashboardBean.setTotalSurvey(totalSurvey);
			dashboardBean.setCompletedSurvey(CompletedSurvey);
			dashboardBean.setPendingSurvey(pendingSurvey);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dashboardBean;
	}

	@Override
	public long getTotalSurveyors() {
		long totalSurveyors = 0;
		try {
			totalSurveyors = pacsRepo.findAll()
							.stream()
							.filter((data) -> data.getStatus() == 3) // Approved Field
							.count();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return totalSurveyors;
	}

	@Override
	public long getTotalSurveyors(int i) {
		long newSurveyors = 0;
		try {
			newSurveyors = pacsRepo.findByStatus(i)
						   .size();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return newSurveyors;
	}

	@Override
	public long getApprovedSurvey() {
		long approvedSurvey = 0;
		try {
			approvedSurvey = surveyRepo.findAll()
							.stream()
							.filter((data) -> data.getStatus() == 2) // Approved Plots
							.count();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return approvedSurvey;
	}

	@Override
	public long fetchPacsCount(String distCode) {
		long pacsCount=0;
		try {
			pacsCount=Long.parseLong(String.valueOf(levelrepo.fetchPacsCount(distCode)));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pacsCount;
	}

	@Override
	public List<DashBoardBean> getPacsWiseSurveyList(String distcode) {
		DashBoardBean districtDashboardBean=null;
		List<DashBoardBean> dataList=new ArrayList<DashBoardBean>();
		try {
			List<Object[]> objList=levelrepo.getPacsWiseSurveyList(distcode);
			for(Object[] obj:objList) {
				districtDashboardBean=new DashBoardBean();
				districtDashboardBean.setPacsName(String.valueOf(obj[1])+"("+String.valueOf(obj[0])+")");
				long totalSurveyors = pacsRepo.findByPacsId(String.valueOf(obj[0])).size();
				districtDashboardBean.setTotalSurveyors(totalSurveyors);
				long completedSurvey = Long
						.parseLong(String.valueOf(surveyRepo.fetchPacscompletedSurveyCount(String.valueOf(obj[0]))));
				districtDashboardBean.setCompletedSurvey(completedSurvey);
				long totalSurvey = Long.parseLong(String.valueOf(surveyRepo.fetchPacsTotalSurveyCount(String.valueOf(obj[0]))));
				districtDashboardBean.setTotalSurvey(totalSurvey);
				long pendingSurvey = totalSurvey - completedSurvey;
				districtDashboardBean.setPendingSurvey(pendingSurvey);
				
				
				dataList.add(districtDashboardBean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dataList;
	}

	@Override
	public DashBoardBean getPacsSurveyStatus(String distCode) {
		DashBoardBean dashboardBean = null;
		try {

			long CompletedSurvey = Long.parseLong(String.valueOf(surveyRepo.fetchCompletedSurveyCount(distCode)));
			long totalSurvey = Long.parseLong(String.valueOf(surveyRepo.fetchTotalSurveyCount(distCode)));
			long pendingSurvey = totalSurvey - CompletedSurvey;
			dashboardBean = new DashBoardBean();
			dashboardBean.setTotalSurvey(totalSurvey);
			dashboardBean.setCompletedSurvey(CompletedSurvey);
			dashboardBean.setPendingSurvey(pendingSurvey);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dashboardBean;
	}

	@Override
	public long getTotalSurveyors(String distcode) {
		long totalSurveyors = 0;
		try {
			totalSurveyors = pacsRepo.findByDistrictId(distcode)
							.stream()
							.filter((data) -> data.getStatus() == 3) // Approved Field  Surveyor
							.count();
					
		} catch (Exception e) {
			e.printStackTrace();
		}
		return totalSurveyors;
	}

	@Override
	public long getTotalSurveyors(String distCode, int i) {
		long totalSurveyors = 0;
		try {
			totalSurveyors = pacsRepo.findByDistrictId(distCode)
							.stream()
							.filter((data) -> data.getStatus() == i) // Approved Field  Surveyor
							.count();
					
		} catch (Exception e) {
			e.printStackTrace();
		}
		return totalSurveyors;
	}

	@Override
	public long getApprovedSurvey(String distCode) {
		long approvedSurvey = 0;
		try {
			approvedSurvey = Long.parseLong(String.valueOf(surveyRepo.fetchApprovePlotCount(distCode)));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return approvedSurvey;
	}

	@Override
	public long getdistYetToComplete() {
		long distYetToComplete = 0;
		try {
			distYetToComplete = Long.parseLong(String.valueOf(surveyRepo.fetchdistYetToCompleteCount()));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return distYetToComplete;
	}

	@Override
	public long getPacsYetToComplete(String distId) {
		long totalpacsCount=0;
		long pacscomplete=0;
		long pacsYetToComplete = 0;
		try {
			totalpacsCount=Long.parseLong(String.valueOf(surveyRepo.fetchTotalPacsCount(distId)));
			pacscomplete = Long.parseLong(String.valueOf(surveyRepo.fetchPacsYetToCompleteCount(distId)));
			pacsYetToComplete=totalpacsCount-pacscomplete;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pacsYetToComplete;
	}
	

}
