package  com.csm.ORSAC.adminconsole.webportal.config;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.validation.beanvalidation.LocalValidatorFactoryBean;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.csm.ORSAC.adminconsole.webportal.bean.PrimaryLinkVo;
import com.csm.ORSAC.adminconsole.webportal.util.OrsacPortalConstant;
import com.csm.ORSAC.webportal.util.OrsacPortalURLs;



@Configuration
@PropertySource("classpath:application.properties")
public class AppConfig implements WebMvcConfigurer{
	
	  private final Map<String,String> mapUrls = new HashMap();
      AppConfig(){
		
		mapUrls.put(OrsacPortalURLs.Dashboard, "Home");
		
		mapUrls.put(OrsacPortalURLs.RECOMMENDATION, "addadvisory");
		mapUrls.put(OrsacPortalURLs.RECOMMENDATION1, "addadvisory");
		mapUrls.put(OrsacPortalURLs.RECOMMENDATION1A, "addadvisory");
		
		mapUrls.put(OrsacPortalURLs.RECOMMENDATION2, "recommendation");
		mapUrls.put(OrsacPortalURLs.RECOMMENDATION2A, "recommendation");
		mapUrls.put(OrsacPortalURLs.RECOMMENDATION3, "recommendation");
		mapUrls.put(OrsacPortalURLs.RECOMMENDATION3A, "recommendation");
		mapUrls.put(OrsacPortalURLs.RECOMMENDATION4, "recommendation");
		mapUrls.put(OrsacPortalURLs.RECOMMENDATION5, "moarecommendation");
		mapUrls.put(OrsacPortalURLs.RECOMMENDATION5A, "moarecommendation");
		
		mapUrls.put(OrsacPortalURLs.RECOMMENDATION11, "addadvisory");
		mapUrls.put(OrsacPortalURLs.RECOMMENDATION12, "viewRecommendationByBoa");
		mapUrls.put(OrsacPortalURLs.RECOMMENDATION13, "viewRecommendationByBoa");
		mapUrls.put(OrsacPortalURLs.RECOMMENDATION14, "viewRecommendationByBoa"); 
		mapUrls.put(OrsacPortalURLs.RECOMMENDATION15, "woredarecommendation");
		mapUrls.put(OrsacPortalURLs.RECOMMENDATION16, "moaRecommendationStatus");
		mapUrls.put(OrsacPortalURLs.RECOMMENDATION17, "moaRecommendationStatus");
		mapUrls.put(OrsacPortalURLs.RECOMMENDATION18, "viewPublishedAdvisory");
		mapUrls.put(OrsacPortalURLs.RECOMMENDATION19, "viewPublishedRecommendation");
		
		
		mapUrls.put(OrsacPortalURLs.RECOMMENDATION6, "woredarecommendation");
		mapUrls.put(OrsacPortalURLs.RECOMMENDATION7, "woredarecommendation");
		
		mapUrls.put(OrsacPortalURLs.RECOMMENDATION8, "viewImplementationDetails");
		
		mapUrls.put(OrsacPortalURLs.RECOMMENDATION9, "addadvisory");
		mapUrls.put(OrsacPortalURLs.RECOMMENDATION10, "addadvisory");
		mapUrls.put(OrsacPortalURLs.RECOMMENDATION20, "woredaExpertRecommendation");
		
		mapUrls.put(OrsacPortalURLs.RECOMMENDATION21, "advisorypending");
		mapUrls.put(OrsacPortalURLs.RECOMMENDATION21A, "advisorypending");
		mapUrls.put(OrsacPortalURLs.RECOMMENDATION21B, "advisorypending");
		mapUrls.put(OrsacPortalURLs.RECOMMENDATION21C, "advisorypending");
		mapUrls.put(OrsacPortalURLs.RECOMMENDATION21D, "advisorypending");
		
		
		mapUrls.put(OrsacPortalURLs.RECOMMENDATION22, "pendingrecommendation");
		mapUrls.put(OrsacPortalURLs.RECOMMENDATION22A, "pendingrecommendation");
		mapUrls.put(OrsacPortalURLs.RECOMMENDATION22B, "pendingrecommendation");
		mapUrls.put(OrsacPortalURLs.RECOMMENDATION22C, "pendingrecommendation");
		mapUrls.put(OrsacPortalURLs.RECOMMENDATION22D, "pendingrecommendation");
		
		
		
		
		mapUrls.put(OrsacPortalURLs.Implementation2, "woredaExpertImplementation");
		mapUrls.put(OrsacPortalURLs.Implementation3, "woredaExpertImplementation");
		mapUrls.put(OrsacPortalURLs.Implementation3A, "woredaExpertImplementation");
		mapUrls.put(OrsacPortalURLs.Implementation4, "woredaExpertImplementation");
		mapUrls.put(OrsacPortalURLs.Implementation5, "woredaExpertImplementation");
		mapUrls.put(OrsacPortalURLs.Implementation6, "woredaExpertImplementation");
		
		
		mapUrls.put(OrsacPortalURLs.Implementation7, "viewMonitorImplementation");
		mapUrls.put(OrsacPortalURLs.Implementation8, "viewMonitorImplementation");
		mapUrls.put(OrsacPortalURLs.Implementation9, "viewMonitorImplementation");
		mapUrls.put(OrsacPortalURLs.Implementation10, "viewMonitorImplementation");
		mapUrls.put(OrsacPortalURLs.Implementation11, "viewMonitorImplementation");
		mapUrls.put(OrsacPortalURLs.Implementation12, "viewMonitorImplementation");
		mapUrls.put(OrsacPortalURLs.Implementation13, "viewMonitorImplementation");
		mapUrls.put(OrsacPortalURLs.Implementation14, "viewMonitorImplementation");
		mapUrls.put(OrsacPortalURLs.Implementation15, "viewMonitorImplementation");
		mapUrls.put(OrsacPortalURLs.Implementation16, "viewMonitorImplementation");
		
		mapUrls.put(OrsacPortalURLs.Implementation17, "viewRecommendationResult");
		mapUrls.put(OrsacPortalURLs.Implementation18, "viewPublishedRecommendationSurveyData");
		mapUrls.put(OrsacPortalURLs.Implementation19, "viewPublishedRecommendationSurveyData");
		
		

		mapUrls.put(OrsacPortalURLs.MIS_REPORT, "prevalenceReport");
		mapUrls.put(OrsacPortalURLs.MIS_REPORTA, "prevalenceReport");
		
		mapUrls.put(OrsacPortalURLs.MIS_REPORT1, "incidence-Severity-RustReport");
		mapUrls.put(OrsacPortalURLs.MIS_REPORT1A, "incidence-Severity-RustReport");
		
		mapUrls.put(OrsacPortalURLs.MIS_REPORT2, "reaction-ToRustReport");
		mapUrls.put(OrsacPortalURLs.MIS_REPORT2A, "reaction-ToRustReport");
		
		mapUrls.put(OrsacPortalURLs.MIS_REPORT3, "wheatRustReport");
		
		mapUrls.put(OrsacPortalURLs.MIS_REPORT4, "implementationSummaryReport");
		mapUrls.put(OrsacPortalURLs.MIS_REPORT4A, "implementationSummaryReport");
		
		mapUrls.put(OrsacPortalURLs.MIS_REPORT24, "implementationReport");
		mapUrls.put(OrsacPortalURLs.MIS_REPORT24A, "implementationReport");
		
		
		mapUrls.put(OrsacPortalURLs.MIS_REPORT5, "stemRustRaces-DetectedCropping");
		mapUrls.put(OrsacPortalURLs.MIS_REPORT5A, "stemRustRaces-DetectedCropping");
		
		mapUrls.put(OrsacPortalURLs.MIS_REPORT6, "stemRustRaces-IdentifiedCropping");
		mapUrls.put(OrsacPortalURLs.MIS_REPORT6A, "stemRustRaces-IdentifiedCropping");
		mapUrls.put(OrsacPortalURLs.MIS_REPORT6B, "stemRustRaces-IdentifiedCropping");
		
		
		mapUrls.put(OrsacPortalURLs.MIS_REPORT7, "virulence-SpectrumPgtRaces");
		mapUrls.put(OrsacPortalURLs.MIS_REPORT7A, "virulence-SpectrumPgtRaces");
		mapUrls.put(OrsacPortalURLs.MIS_REPORT8, "regionAndRustTypeReport");
		mapUrls.put(OrsacPortalURLs.MIS_REPORT9, "surveyAndIvrReport"); 
		mapUrls.put(OrsacPortalURLs.MIS_REPORT10, "rustTypeChartReport");
		
		mapUrls.put(OrsacPortalURLs.MIS_REPORT11, "surveyPublishedReport");
		mapUrls.put(OrsacPortalURLs.MIS_REPORT11A, "surveyPublishedReport");
		mapUrls.put(OrsacPortalURLs.MIS_REPORT12, "surveyPublishedReport");
		mapUrls.put(OrsacPortalURLs.MIS_REPORT12A, "surveyPublishedReport");
		mapUrls.put(OrsacPortalURLs.MIS_REPORT12B, "surveyPublishedReport");
		mapUrls.put(OrsacPortalURLs.MIS_REPORT12C, "surveyPublishedReport");
		mapUrls.put(OrsacPortalURLs.MIS_REPORT12D, "surveyPublishedReport");
		mapUrls.put(OrsacPortalURLs.MIS_REPORT12E, "surveyPublishedReport");
		
		mapUrls.put(OrsacPortalURLs.MIS_REPORT13, "viewPublishedAdvisory");
		mapUrls.put(OrsacPortalURLs.MIS_REPORT14, "viewPublishedRecommendation");
		mapUrls.put(OrsacPortalURLs.MIS_REPORT15, "addadvisory");
		mapUrls.put(OrsacPortalURLs.MIS_REPORT16, "reportSurveyReportByGlobalRust");
		mapUrls.put(OrsacPortalURLs.MIS_REPORT17, "addadvisory");
		mapUrls.put(OrsacPortalURLs.MIS_REPORT18, "addadvisory");
		mapUrls.put(OrsacPortalURLs.MIS_REPORT19, "raceAnalysisReport");
		mapUrls.put(OrsacPortalURLs.MIS_REPORT23, "reportSurveyReportByGlobalRust");
		mapUrls.put(OrsacPortalURLs.MIS_REPORT23A, "reportSurveyReportByGlobalRust");
		
		mapUrls.put(OrsacPortalURLs.MIS_REPORT20, "mapdetails");
		mapUrls.put(OrsacPortalURLs.MIS_REPORT21, "IVRMapDetails");
		mapUrls.put(OrsacPortalURLs.MIS_REPORT22, "IncidentMapDetails");
		mapUrls.put(OrsacPortalURLs.MIS_REPORT22A, "viewForecastingMap");
		
		mapUrls.put(OrsacPortalURLs.MIS_REPORT25, "rustSurveyAndRecommentationSurveyChart");
		mapUrls.put(OrsacPortalURLs.MIS_REPORT26, "rustSurveyOtherDisease");
		mapUrls.put(OrsacPortalURLs.MIS_REPORT26A, "rustSurveyOtherDisease");
		
		mapUrls.put(OrsacPortalURLs.Race_Analysis, "stem-rust-race-analysis");
		mapUrls.put(OrsacPortalURLs.Race_AnalysisA, "stem-rust-race-analysis");
		mapUrls.put(OrsacPortalURLs.Race_AnalysisB, "stem-rust-race-analysis");
		
		mapUrls.put(OrsacPortalURLs.Race_Analysis1, "stem-rust-race-analysis");
		mapUrls.put(OrsacPortalURLs.Race_Analysis2, "stem-rust-race-analysis");
		mapUrls.put(OrsacPortalURLs.Race_Analysis2A, "stem-rust-race-analysis");
		
		mapUrls.put(OrsacPortalURLs.Race_Analysis3, "stem-rust-race-analysis");
		mapUrls.put(OrsacPortalURLs.Race_Analysis3A, "stem-rust-race-analysis");
		
		mapUrls.put(OrsacPortalURLs.Race_Analysis4, "stem-rust-race-analysis");
		mapUrls.put(OrsacPortalURLs.Race_Analysis4A, "stem-rust-race-analysis");
		
		
		mapUrls.put(OrsacPortalURLs.Race_Analysis5, "stem-rust-race-analysis");
		mapUrls.put(OrsacPortalURLs.Race_Analysis5A, "stem-rust-race-analysis");
		mapUrls.put(OrsacPortalURLs.Race_Analysis5B, "stem-rust-race-analysis");
		
		mapUrls.put(OrsacPortalURLs.Race_Analysis6, "dumpedExternalSamples");
		mapUrls.put(OrsacPortalURLs.Race_Analysis6A, "dumpedExternalSamples");
		
		
		mapUrls.put(OrsacPortalURLs.Race_Analysis29, "allocationforrestanalysis");
		mapUrls.put(OrsacPortalURLs.Race_Analysis30, "viewRaceAnalysisStatus");
		mapUrls.put(OrsacPortalURLs.Race_Analysis30A, "viewRaceAnalysisStatus");
		
		mapUrls.put(OrsacPortalURLs.Race_Analysis31, "allocationforrestanalysis");
		mapUrls.put(OrsacPortalURLs.Race_Analysis31A, "allocationforrestanalysis");
		mapUrls.put(OrsacPortalURLs.Race_Analysis32, "allocationforrestanalysis");
		
		
		mapUrls.put(OrsacPortalURLs.Race_Analysis33, "externalTaggedSamples");
		mapUrls.put(OrsacPortalURLs.Race_Analysis33A, "externalTaggedSamples");
		mapUrls.put(OrsacPortalURLs.Race_Analysis34, "externalTaggedSamples");
		mapUrls.put(OrsacPortalURLs.Race_Analysis35, "externalTaggedSamples");
		
		
		//Race_Analysis33
		
		
		mapUrls.put(OrsacPortalURLs.MANAGE_MASTER, "addTypeofRust");
		mapUrls.put(OrsacPortalURLs.MANAGE_MASTER1, "addTypeofRust");
		mapUrls.put(OrsacPortalURLs.MANAGE_MASTER2, "addTypeofRust");
		
		mapUrls.put(OrsacPortalURLs.MANAGE_MASTER3, "addgrowthstage");
		mapUrls.put(OrsacPortalURLs.MANAGE_MASTER4, "addgrowthstage");
		mapUrls.put(OrsacPortalURLs.MANAGE_MASTER5, "addgrowthstage");
		
		mapUrls.put(OrsacPortalURLs.MANAGE_MASTER6, "addSampleType");
		mapUrls.put(OrsacPortalURLs.MANAGE_MASTER7, "addSampleType");
		mapUrls.put(OrsacPortalURLs.MANAGE_MASTER8, "addSampleType");
		
		mapUrls.put(OrsacPortalURLs.MANAGE_MASTER9, "addtypeoffungicide");
		mapUrls.put(OrsacPortalURLs.MANAGE_MASTER10, "addtypeoffungicide");
		mapUrls.put(OrsacPortalURLs.MANAGE_MASTER11, "addtypeoffungicide");
		
		mapUrls.put(OrsacPortalURLs.MANAGE_MASTER12, "addregion");
		mapUrls.put(OrsacPortalURLs.MANAGE_MASTER13, "addregion");
		mapUrls.put(OrsacPortalURLs.MANAGE_MASTER14, "addregion");
		
		mapUrls.put(OrsacPortalURLs.MANAGE_MASTER15, "addzone");
		mapUrls.put(OrsacPortalURLs.MANAGE_MASTER16, "addzone");
		mapUrls.put(OrsacPortalURLs.MANAGE_MASTER17, "addzone");
		
		mapUrls.put(OrsacPortalURLs.MANAGE_MASTER18, "addworeda");
		mapUrls.put(OrsacPortalURLs.MANAGE_MASTER19, "addworeda");
		mapUrls.put(OrsacPortalURLs.MANAGE_MASTER20, "addworeda");
		
		mapUrls.put(OrsacPortalURLs.MANAGE_MASTER21, "addkebele");
		mapUrls.put(OrsacPortalURLs.MANAGE_MASTER22, "addkebele");
		mapUrls.put(OrsacPortalURLs.MANAGE_MASTER23, "addkebele");
		
		mapUrls.put(OrsacPortalURLs.MANAGE_MASTER24, "wheatMaster");
		mapUrls.put(OrsacPortalURLs.MANAGE_MASTER25, "wheatMaster");
		mapUrls.put(OrsacPortalURLs.MANAGE_MASTER26, "wheatMaster");
		
		mapUrls.put(OrsacPortalURLs.MANAGE_MASTER27, "wheatDifferentialLineMaster");
		mapUrls.put(OrsacPortalURLs.MANAGE_MASTER28, "wheatDifferentialLineMaster");
		mapUrls.put(OrsacPortalURLs.MANAGE_MASTER29, "wheatDifferentialLineMaster");

		mapUrls.put(OrsacPortalURLs.MANAGE_MASTER30, "raceIdentificationChart");
		mapUrls.put(OrsacPortalURLs.MANAGE_MASTER31, "raceIdentificationChart");
		mapUrls.put(OrsacPortalURLs.MANAGE_MASTER32, "raceIdentificationChart");
		
		mapUrls.put(OrsacPortalURLs.MANAGE_MASTER33, "configureResearchCenterMaster");
		mapUrls.put(OrsacPortalURLs.MANAGE_MASTER34, "configureResearchCenterMaster");
		mapUrls.put(OrsacPortalURLs.MANAGE_MASTER35, "configureResearchCenterMaster");
		
		mapUrls.put(OrsacPortalURLs.MANAGE_MASTER36, "seasonMaster");
		mapUrls.put(OrsacPortalURLs.MANAGE_MASTER37, "seasonMaster");
		mapUrls.put(OrsacPortalURLs.MANAGE_MASTER38, "seasonMaster");
		
		mapUrls.put(OrsacPortalURLs.MANAGE_MASTER39, "deseaseMaster");
		mapUrls.put(OrsacPortalURLs.MANAGE_MASTER40, "deseaseMaster");
		mapUrls.put(OrsacPortalURLs.MANAGE_MASTER41, "deseaseMaster");
		
		mapUrls.put(OrsacPortalURLs.MANAGE_MASTER42, "questionnaireMaster");
		mapUrls.put(OrsacPortalURLs.MANAGE_MASTER43, "questionnaireMaster");
		mapUrls.put(OrsacPortalURLs.MANAGE_MASTER44, "questionnaireMaster");
		
		mapUrls.put(OrsacPortalURLs.MANAGE_MASTER45, "addUserUserMaster");
		mapUrls.put(OrsacPortalURLs.MANAGE_MASTER46, "addUserUserMaster");
		mapUrls.put(OrsacPortalURLs.MANAGE_MASTER47, "addUserUserMaster");
		
		mapUrls.put(OrsacPortalURLs.MANAGE_MASTER48, "adddesignation");
		mapUrls.put(OrsacPortalURLs.MANAGE_MASTER49, "adddesignation");
		mapUrls.put(OrsacPortalURLs.MANAGE_MASTER50, "adddesignation");
		
		mapUrls.put(OrsacPortalURLs.MANAGE_MASTER52, "addOrganization");
		mapUrls.put(OrsacPortalURLs.MANAGE_MASTER53, "addOrganization");
		mapUrls.put(OrsacPortalURLs.MANAGE_MASTER54, "addOrganization");
		
		mapUrls.put(OrsacPortalURLs.MANAGE_MASTER55, "addCommittee");
		mapUrls.put(OrsacPortalURLs.MANAGE_MASTER56, "addCommittee");
		mapUrls.put(OrsacPortalURLs.MANAGE_MASTER57, "addCommittee");
		
		mapUrls.put(OrsacPortalURLs.MANAGE_MASTER58, "demographicTagging");
		mapUrls.put(OrsacPortalURLs.MANAGE_MASTER59, "demographicTagging");
		mapUrls.put(OrsacPortalURLs.MANAGE_MASTER72, "demographicTagging");
		
		mapUrls.put(OrsacPortalURLs.MANAGE_MASTER60, "addApprovalMaster");
		mapUrls.put(OrsacPortalURLs.MANAGE_MASTER61, "addApprovalMaster");
		mapUrls.put(OrsacPortalURLs.MANAGE_MASTER62, "addApprovalMaster");
		
		mapUrls.put(OrsacPortalURLs.MANAGE_MASTER63, "addApprovalAuthority");
		
		mapUrls.put(OrsacPortalURLs.MANAGE_MASTER64, "addJobDeligation");
		mapUrls.put(OrsacPortalURLs.MANAGE_MASTER65, "addJobDeligation");
		mapUrls.put(OrsacPortalURLs.MANAGE_MASTER66, "addJobDeligation");
		
		
		//Not mapped-->
		 mapUrls.put(OrsacPortalURLs.MANAGE_MASTER67, "addVariety");
		 mapUrls.put(OrsacPortalURLs.MANAGE_MASTER68, "addVariety");
		 mapUrls.put(OrsacPortalURLs.MANAGE_MASTER69, "addVariety");
		 mapUrls.put(OrsacPortalURLs.MANAGE_MASTER70, "changePassword");
		 
		 mapUrls.put(OrsacPortalURLs.MANAGE_MASTER71, "userProfile");
		 

		 
		mapUrls.put(OrsacPortalURLs.MANAGE_MASTER73, "raceScoringMaster");
		mapUrls.put(OrsacPortalURLs.MANAGE_MASTER74, "raceScoringMaster");
		mapUrls.put(OrsacPortalURLs.MANAGE_MASTER75, "raceScoringMaster");
		
		mapUrls.put(OrsacPortalURLs.MANAGE_MASTER76, "addYellowRacePhenotype");
		mapUrls.put(OrsacPortalURLs.MANAGE_MASTER77, "addYellowRacePhenotype");
		mapUrls.put(OrsacPortalURLs.MANAGE_MASTER78, "addYellowRacePhenotype");
		
		
			
		//addVariety
		
		
		//Not mapped-->
		
		mapUrls.put(OrsacPortalURLs.MANAGE_SURVEY, "addSurveyDetails");
		mapUrls.put(OrsacPortalURLs.MANAGE_SURVEY1, "addSurveyDetails");
		mapUrls.put(OrsacPortalURLs.MANAGE_SURVEY2, "addSurveyDetails");
		mapUrls.put(OrsacPortalURLs.MANAGE_SURVEY2A, "addSurveyDetails");
		mapUrls.put(OrsacPortalURLs.MANAGE_SURVEY3, "addSurveyDetails");
		mapUrls.put(OrsacPortalURLs.MANAGE_SURVEY3A, "addSurveyDetails");
		mapUrls.put(OrsacPortalURLs.MANAGE_SURVEY21, "addSurveyDetails");
		mapUrls.put(OrsacPortalURLs.MANAGE_SURVEY22, "addSurveyDetails");
		
		
		
		mapUrls.put(OrsacPortalURLs.MANAGE_SURVEY4, "uploadSurveyDataXcel");
		mapUrls.put(OrsacPortalURLs.MANAGE_SURVEY23, "uploadSurveyDataXcel");
		mapUrls.put(OrsacPortalURLs.MANAGE_SURVEY24, "uploadSurveyDataXcel");
		mapUrls.put(OrsacPortalURLs.MANAGE_SURVEY7, "uploadSurveyDataXcel");
		mapUrls.put(OrsacPortalURLs.MANAGE_SURVEY4A, "uploadSurveyDataXcel");
		
		mapUrls.put(OrsacPortalURLs.MANAGE_SURVEY25, "rustSurveyData");
		mapUrls.put(OrsacPortalURLs.MANAGE_SURVEY25A, "rustSurveyData");
		mapUrls.put(OrsacPortalURLs.MANAGE_SURVEY26, "rustSurveyData");
		
		
		mapUrls.put(OrsacPortalURLs.MANAGE_SURVEY6, "pendingsurvey");
		mapUrls.put(OrsacPortalURLs.MANAGE_SURVEY6A, "pendingsurvey");
		mapUrls.put(OrsacPortalURLs.MANAGE_SURVEY6B, "pendingsurvey");
		mapUrls.put(OrsacPortalURLs.MANAGE_SURVEY6C, "pendingsurvey");
		mapUrls.put(OrsacPortalURLs.MANAGE_SURVEY8, "pendingsurvey");
		mapUrls.put(OrsacPortalURLs.MANAGE_SURVEY9, "pendingsurvey");
		
		
		
		mapUrls.put(OrsacPortalURLs.MANAGE_SURVEY12, "uploadIvrData");
		mapUrls.put(OrsacPortalURLs.MANAGE_SURVEY13, "uploadIvrData");
		mapUrls.put(OrsacPortalURLs.MANAGE_SURVEY14, "uploadIvrData");
		mapUrls.put(OrsacPortalURLs.MANAGE_SURVEY14A, "uploadIvrData");
		
		mapUrls.put(OrsacPortalURLs.MANAGE_SURVEY5, "wrSurveySummaryReports");
		mapUrls.put(OrsacPortalURLs.MANAGE_SURVEY5A, "wrSurveySummaryReports");
		
		mapUrls.put(OrsacPortalURLs.MANAGE_SURVEY15, "rustIncidentView");
		mapUrls.put(OrsacPortalURLs.MANAGE_SURVEY16, "rustIncidentView");
		
		mapUrls.put(OrsacPortalURLs.MANAGE_SURVEY17, "rustSurveyData");

		mapUrls.put(OrsacPortalURLs.MANAGE_SURVEY11, "addSurveyDetails");
		
		mapUrls.put(OrsacPortalURLs.MANAGE_SURVEY19, "viewRustIncident");
		
		mapUrls.put(OrsacPortalURLs.MANAGE_SURVEY20, "uploadIvrData");
		
		mapUrls.put(OrsacPortalURLs.MANAGE_SURVEY27, "addNotification");
		mapUrls.put(OrsacPortalURLs.MANAGE_SURVEY27A, "addNotification");
		mapUrls.put(OrsacPortalURLs.MANAGE_SURVEY27B, "addNotification");
		mapUrls.put(OrsacPortalURLs.MANAGE_SURVEY27C, "addNotification");
		mapUrls.put(OrsacPortalURLs.MANAGE_SURVEY27D, "addNotification");
		
		mapUrls.put(OrsacPortalURLs.MANAGE_SURVEY14B, "ivrSurveyAPIData");
		
		
		mapUrls.put(OrsacPortalURLs.MANAGE_LINK, "addGlobalLink");
		mapUrls.put(OrsacPortalURLs.MANAGE_LINK1, "addGlobalLink");
		mapUrls.put(OrsacPortalURLs.MANAGE_LINK2, "addGlobalLink");
		mapUrls.put(OrsacPortalURLs.MANAGE_LINK3, "addPrimaryLink");
		mapUrls.put(OrsacPortalURLs.MANAGE_LINK4, "addPrimaryLink");
		mapUrls.put(OrsacPortalURLs.MANAGE_LINK5, "addPrimaryLink");
		mapUrls.put(OrsacPortalURLs.MANAGE_LINK6, "addFunctionMaster");
		mapUrls.put(OrsacPortalURLs.MANAGE_LINK7, "addFunctionMaster");
		mapUrls.put(OrsacPortalURLs.MANAGE_LINK8, "addFunctionMaster");
		mapUrls.put(OrsacPortalURLs.MANAGE_LINK9, "addRoleMaster");
		mapUrls.put(OrsacPortalURLs.MANAGE_LINK10, "addRoleMaster");
		mapUrls.put(OrsacPortalURLs.MANAGE_LINK11, "addRoleMaster");
		
	    mapUrls.put(OrsacPortalURLs.MANAGE_LINK12, "addUserPermission");
	    mapUrls.put(OrsacPortalURLs.MANAGE_LINK13, "addUserPermission");
	    mapUrls.put(OrsacPortalURLs.MANAGE_LINK14, "addUserPermission");
	    
	    mapUrls.put(OrsacPortalURLs.LOG_REPORTS, "viewSucessWebLoginDetails");
	    mapUrls.put(OrsacPortalURLs.LOG_REPORTS1, "viewSucessWebLoginDetails");
	    mapUrls.put(OrsacPortalURLs.LOG_REPORTS2, "viewMobileLogDetails");
	    
	    mapUrls.put(OrsacPortalURLs.LOG_REPORTS3, "viewGisFileLog");
	    mapUrls.put(OrsacPortalURLs.LOG_REPORTS3A, "viewGisFileLog");
	
	    mapUrls.put(OrsacPortalURLs.LOG_REPORTS4, "viewQueryBuilderLog");
	    mapUrls.put(OrsacPortalURLs.LOG_REPORTS5, "viewIvrApiLogData");
	    mapUrls.put(OrsacPortalURLs.LOG_REPORTS6, "gisForcastingFile");
		 
	}
	
	
	@Bean
	public static PropertySourcesPlaceholderConfigurer propertyConfigInDev() {
		return new PropertySourcesPlaceholderConfigurer();
	}
    
	@Bean
	public MessageSource messageSource() {
		ReloadableResourceBundleMessageSource messageSource = new ReloadableResourceBundleMessageSource();
		messageSource.addBasenames("classpath:messages");
		messageSource.setDefaultEncoding("UTF-8");
		return messageSource;
	}
	
	    @Bean
	    public LocalValidatorFactoryBean validator() {
	        LocalValidatorFactoryBean bean = new LocalValidatorFactoryBean();
	        bean.setValidationMessageSource(messageSource());
	        return bean;
	    }

	 @Override
	public void addInterceptors(InterceptorRegistry registry) {
		
		registry.addInterceptor(handlerInterceptor()).excludePathPatterns("/","/login","/home","/forgotPassword","/signUpPacsInspector","/savePacsInspectorData","/saveOtp","/validateOtp","/MobileAPI/**","/fetchBlockDetailsByDistId","/fetchPacsDetailsByBlockId","/firstTimeLogin","/viewProfilePhoto","/firstTimeChangePassword","/passwordReset",
				"getUserByRoleAndOrgId/","/logout","/getMinistryList","/getFungicideDetails", "/privacy","/aboutus","/surveymap","/downLoadLatestApk","/viewSurveyReport","/getUnreadNtfsByUserId","/getDesktopNotificationsByUserId","/LoadLandImage","/viewRegisterPacsInspector","/viewRegisterPacsInspectorApprove",
				"/viewRegisterPacsInspectorReject","/actionOnPacsInspector","/fetchtahasilListByDistCode","/fetchvillageListByTahasilCode","/fetchPlotDetailsByPlotCode","/actionOnSurveyDetails",
				"/webapp/**", "/WEB-INF/**", "/resources/**","/templates/**", "/jsp/**", "/tiles/**", "/updateGroupPermission","/changePassword",
	    		"/styles/**", "/images/**", "/scripts/**", "/fonts/**", "/pdf/**", "/WRSISGIS/**","/plotSearchReport","/tahasilSummaryReport","/mapViewerReport","/villageSummaryFarmerWiseReport","/villageSummaryPlotWiseReport",
	    		"/wrsis/**","/icons/**","/justifiedGallery/**","/Portal/**","/css/**","/img/**","/script/**","/api/**","/mobile/**","/pagejs/**","/gisapi/**","/external/**","D:/LAND-IMAGE/**","/queryBuilder","/viewSuspectedPlot","/fetchPacsListByDistCode");
		WebMvcConfigurer.super.addInterceptors(registry);
	}
	
	 
	 
	@Bean
	public HandlerInterceptor handlerInterceptor() {
		
		return new HandlerInterceptor() {
			
			
			
			
			@Override
			public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
					throws Exception {
				
				
				String userPermission = null;
				HttpSession session = request.getSession();
				
				List<String> userPermissions=new ArrayList<>();
				Object obj =session.getAttribute(OrsacPortalConstant.USER_PERMISSIONS);
				if(obj!=null)
					userPermissions=(List)obj;
				if(userPermissions!=null || !userPermissions.isEmpty()) {
					userPermissions.add("Home");
					userPermissions.add("userProfile");
					userPermissions.add("changePassword");
					userPermissions.add("raceAnalysisReport");
					
					
				}
				
				String userAction = request.getRequestURI();
				
				if(userAction.contains("/ORSACWeb")) {
					userAction=userAction.replace("/ORSACWeb", "");
				}
					
				

		        Iterator iter = mapUrls.entrySet().iterator();
				while (iter.hasNext()) {
					Map.Entry mEntry = (Map.Entry) iter.next();
					String key=(String)mEntry.getKey();
					if(userAction.equals(key)){
						userPermission=(String)mEntry.getValue();
						session.setAttribute("viewUrl", userAction.replace("/",""));
						session.setAttribute("surl", userPermission);
						
						
						if(!userPermissions.contains(userPermission)) {

							session.invalidate();
							response.sendRedirect("/ORSACWeb");
							return false;
						}
						
						break;
					}
				}
				
				
				
				try {
				
					
					if(session.getAttribute(OrsacPortalConstant.LEFT_MENU_PERMISSION) == null ||
							session.getAttribute(OrsacPortalConstant.USER_ID) == null || session.getAttribute(OrsacPortalConstant.USER_ID).toString().isEmpty()) {
					response.sendRedirect("/ORSACWeb");
					return false;
					}
					
					
							
					if(session.getAttribute(OrsacPortalConstant.LEFT_MENU_PERMISSION) instanceof  Map<? , ?> ){
						@SuppressWarnings("unchecked")
						Map<String, List<PrimaryLinkVo>> leftmenu = (Map<String, List<PrimaryLinkVo>>)session.getAttribute(OrsacPortalConstant.LEFT_MENU_PERMISSION);
						 if(leftmenu.size()==0) {
						 response.sendRedirect("/ORSACWeb");
								return false;
						 }
					 }
					

					
				} catch (Exception e) {
					
				}
				return HandlerInterceptor.super.preHandle(request, response, handler);

			}
		};
	}
	
	
	
	
}
