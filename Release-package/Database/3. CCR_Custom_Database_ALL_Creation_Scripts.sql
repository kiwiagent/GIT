USE [OH_CM_Custom]
GO
/****** Object:  View [dbo].[vw_ccr_referralTasks_listServices]    Script Date: 06/17/2015 14:58:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_ccr_referralTasks_listServices]'))
DROP VIEW [dbo].[vw_ccr_referralTasks_listServices]
GO
/****** Object:  View [dbo].[vw_ccr_actionListDataIdFromTasks]    Script Date: 06/17/2015 14:58:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_ccr_actionListDataIdFromTasks]'))
DROP VIEW [dbo].[vw_ccr_actionListDataIdFromTasks]
GO
/****** Object:  View [dbo].[vw_pathwayEnrollment]    Script Date: 06/17/2015 14:58:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_pathwayEnrollment]'))
DROP VIEW [dbo].[vw_pathwayEnrollment]
GO
/****** Object:  View [dbo].[vw_wic_get_DMA_results]    Script Date: 06/17/2015 14:58:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_wic_get_DMA_results]'))
DROP VIEW [dbo].[vw_wic_get_DMA_results]
GO
/****** Object:  View [dbo].[vw_wic_WICDMALIST]    Script Date: 06/17/2015 14:58:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_wic_WICDMALIST]'))
DROP VIEW [dbo].[vw_wic_WICDMALIST]
GO
/****** Object:  View [dbo].[ACTPAS_Password_UserAttributes]    Script Date: 06/17/2015 14:58:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[ACTPAS_Password_UserAttributes]'))
DROP VIEW [dbo].[ACTPAS_Password_UserAttributes]
GO
/****** Object:  View [dbo].[vw_ccr_adhoc_tasks]    Script Date: 06/17/2015 14:58:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_ccr_adhoc_tasks]'))
DROP VIEW [dbo].[vw_ccr_adhoc_tasks]
GO
/****** Object:  View [dbo].[vw_ccr_adhoc_tasks_home]    Script Date: 06/17/2015 14:58:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_ccr_adhoc_tasks_home]'))
DROP VIEW [dbo].[vw_ccr_adhoc_tasks_home]
GO
/****** Object:  View [dbo].[vw_ccr_adhoc_tasks_waterlow]    Script Date: 06/17/2015 14:58:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_ccr_adhoc_tasks_waterlow]'))
DROP VIEW [dbo].[vw_ccr_adhoc_tasks_waterlow]
GO
/****** Object:  View [dbo].[vw_ccr_event_summary]    Script Date: 06/17/2015 14:58:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_ccr_event_summary]'))
DROP VIEW [dbo].[vw_ccr_event_summary]
GO
/****** Object:  View [dbo].[vw_ccr_nursingAssesmentDataIdFromTasks]    Script Date: 06/17/2015 14:58:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_ccr_nursingAssesmentDataIdFromTasks]'))
DROP VIEW [dbo].[vw_ccr_nursingAssesmentDataIdFromTasks]
GO
/****** Object:  View [dbo].[v_WhiteboardReferrals]    Script Date: 06/17/2015 14:58:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_WhiteboardReferrals]'))
DROP VIEW [dbo].[v_WhiteboardReferrals]
GO
/****** Object:  View [dbo].[vw_ccr_adhoc_tasks_hacc]    Script Date: 06/17/2015 14:58:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_ccr_adhoc_tasks_hacc]'))
DROP VIEW [dbo].[vw_ccr_adhoc_tasks_hacc]
GO
/****** Object:  View [dbo].[vw_ccr_nursingAssesmentTasks_formContent]    Script Date: 06/17/2015 14:58:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_ccr_nursingAssesmentTasks_formContent]'))
DROP VIEW [dbo].[vw_ccr_nursingAssesmentTasks_formContent]
GO
/****** Object:  View [dbo].[vw_ccr_NursingAssessmentCatheterPlan]    Script Date: 06/17/2015 14:58:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_ccr_NursingAssessmentCatheterPlan]'))
DROP VIEW [dbo].[vw_ccr_NursingAssessmentCatheterPlan]
GO
/****** Object:  View [dbo].[vw_ccr_NursingAssessmentWounds]    Script Date: 06/17/2015 14:58:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_ccr_NursingAssessmentWounds]'))
DROP VIEW [dbo].[vw_ccr_NursingAssessmentWounds]
GO
/****** Object:  View [dbo].[vw_ccr_actionListTask_formContent]    Script Date: 06/17/2015 14:58:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_ccr_actionListTask_formContent]'))
DROP VIEW [dbo].[vw_ccr_actionListTask_formContent]
GO
/****** Object:  View [dbo].[vw_documentlinkbyAssessment]    Script Date: 06/17/2015 14:58:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_documentlinkbyAssessment]'))
DROP VIEW [dbo].[vw_documentlinkbyAssessment]
GO
/****** Object:  View [dbo].[vw_eventsummary_referralReasons]    Script Date: 06/17/2015 14:58:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_eventsummary_referralReasons]'))
DROP VIEW [dbo].[vw_eventsummary_referralReasons]
GO
/****** Object:  Table [dbo].[TBL_CWS_Goals_Interventions_Treatment]    Script Date: 06/17/2015 14:58:12 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_CWS_Goals_Interventions_Treatment]') AND type in (N'U'))
DROP TABLE [dbo].[TBL_CWS_Goals_Interventions_Treatment]
GO
/****** Object:  Table [dbo].[EventStatus_Mappings]    Script Date: 06/17/2015 14:58:12 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EventStatus_Mappings]') AND type in (N'U'))
DROP TABLE [dbo].[EventStatus_Mappings]
GO
/****** Object:  Table [dbo].[PathwayToSubpathway_Mapping]    Script Date: 06/17/2015 14:58:12 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PathwayToSubpathway_Mapping]') AND type in (N'U'))
DROP TABLE [dbo].[PathwayToSubpathway_Mapping]
GO
/****** Object:  Table [dbo].[PathwayToSubpathwayMappingHistory]    Script Date: 06/17/2015 14:58:12 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PathwayToSubpathwayMappingHistory]') AND type in (N'U'))
DROP TABLE [dbo].[PathwayToSubpathwayMappingHistory]
GO
/****** Object:  Table [dbo].[ReferralToPathwayMappingHistory]    Script Date: 06/17/2015 14:58:12 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ReferralToPathwayMappingHistory]') AND type in (N'U'))
DROP TABLE [dbo].[ReferralToPathwayMappingHistory]
GO
/****** Object:  Table [dbo].[WICDispositions]    Script Date: 06/17/2015 14:58:12 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WICDispositions]') AND type in (N'U'))
DROP TABLE [dbo].[WICDispositions]
GO
/****** Object:  Table [dbo].[WICFinalClinicalImpression]    Script Date: 06/17/2015 14:58:13 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WICFinalClinicalImpression]') AND type in (N'U'))
DROP TABLE [dbo].[WICFinalClinicalImpression]
GO
/****** Object:  Table [dbo].[WICFinalDisposition]    Script Date: 06/17/2015 14:58:13 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WICFinalDisposition]') AND type in (N'U'))
DROP TABLE [dbo].[WICFinalDisposition]
GO
/****** Object:  Table [dbo].[WICInformationSheets]    Script Date: 06/17/2015 14:58:13 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WICInformationSheets]') AND type in (N'U'))
DROP TABLE [dbo].[WICInformationSheets]
GO
/****** Object:  StoredProcedure [dbo].[sp_ccr_findAllAdhoc]    Script Date: 06/17/2015 14:58:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ccr_findAllAdhoc]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_ccr_findAllAdhoc]
GO
/****** Object:  StoredProcedure [dbo].[sp_ccr_adhoc_tasks]    Script Date: 06/17/2015 14:58:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ccr_adhoc_tasks]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_ccr_adhoc_tasks]
GO
/****** Object:  View [dbo].[vw_ccr_referral_content]    Script Date: 06/17/2015 14:58:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_ccr_referral_content]'))
DROP VIEW [dbo].[vw_ccr_referral_content]
GO
/****** Object:  View [dbo].[vw_ccr_referral_content_internal]    Script Date: 06/17/2015 14:58:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_ccr_referral_content_internal]'))
DROP VIEW [dbo].[vw_ccr_referral_content_internal]
GO
/****** Object:  View [dbo].[vw_ccr_referral_content_fax]    Script Date: 06/17/2015 14:58:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_ccr_referral_content_fax]'))
DROP VIEW [dbo].[vw_ccr_referral_content_fax]
GO
/****** Object:  Table [dbo].[ReferralToPathwayMapping]    Script Date: 06/17/2015 14:58:12 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ReferralToPathwayMapping]') AND type in (N'U'))
DROP TABLE [dbo].[ReferralToPathwayMapping]
GO
/****** Object:  Table [dbo].[ReferralToPathwayMapping]    Script Date: 06/17/2015 14:58:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ReferralToPathwayMapping]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ReferralToPathwayMapping](
	[uniqueId] [int] IDENTITY(1,1) NOT NULL,
	[version] [int] NOT NULL,
	[referral_identifier] [nvarchar](50) NOT NULL,
	[referral_version] [int] NOT NULL,
	[pathway_enrollmentIdentifier] [varchar](255) NOT NULL,
	[pathway_enrollmentStatus] [varchar](255) NOT NULL,
	[messageId] [varchar](255) NOT NULL,
	[ACTPASID] [int] NULL,
	[ACTPAS_ReferralStatus] [varchar](10) NULL,
	[dischargeSummaryId] [int] NULL,
 CONSTRAINT [PK_ReferralToPathwayMapping] PRIMARY KEY CLUSTERED 
(
	[uniqueId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UC_ReferralToPathwayMapping] UNIQUE NONCLUSTERED 
(
	[referral_identifier] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[vw_ccr_referral_content_fax]    Script Date: 06/17/2015 14:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_ccr_referral_content_fax]'))
EXEC dbo.sp_executesql @statement = N'



 
CREATE VIEW [dbo].[vw_ccr_referral_content_fax] AS 
/*
View [dbo].[vw_ccr_referral_content_fax]
[Description] View to show all fax referral forms. This view is designed to have requirements for the ACTPAS webservices and pulls the data from the FAX referral. Rhapsody will lookup this information by the referral Id and send the information to ACTPAS to create update or close the Referral.
 
@author: Orion Health [Tim Panoho]
@created: 2015-05-01
@reference:  
 
 !!!  Important Notes  !!! 
 Used by the vw_ccr_referral_content view as a UNION
*/ 
 SELECT 
/*Fax Referral VIEW*/
   
   /*META DATA*/
   base.DOCUMENTID,
   r.id as extEventId,
   r.patientIdentifier,  
  /* (CASE WHEN ISNULL(base.g_ConsenttoGP_W1R8O,0)=0 THEN ''N'' ELSE ''Y'' END)as consentToGP, */
(CASE WHEN ISNULL(base.g_AdmtNtfctnUslGP_2WP6F_cde,''ns'')=''ni'' THEN ''N'' ELSE ''Y'' END) as consentToGP,
(CASE WHEN ISNULL(base.g_AdmtNtfctnUslGP_2WP6F_cde,''ns'')=''ni'' THEN ''N'' ELSE ''Y'' END) as consentToCC,
ISNULL(ISNULL(patgp.pcpclinicianid,base.g_clinicianId_OTDEQ),''UNK'')as referredToGP, 
ISNULL(ISNULL(patgp.pcpclinicianid,base.g_clinicianId_OTDEQ),''UNK'') as referredToCC,  
  
ISNULL(base.ACTPASR_RFT_oHO_16SL1_cde,''ACTCC'') as  ownerHealth
,ISNULL(base.ACTPASR_RFT_RfRs_9Z6G9_cde,''NSP'') as ReferralReason  /*Assessible on Referral Form. */
,''EXTRL'' as ReferralType  /*Assessible on Referral Form. */
,ISNULL(REPLACE(UPPER(base.ACTPASR_RFT_src_DGYRJ_cde),''&'',''&amp;''),''NSP'') as ReferralSource   /*Assessible on Referral Form. */
,ISNULL(base.ACTPASR_RFT_SS_StaffCode_8XBN0,''NSP'') as ReferralStaffTeam  /*Assessible on Referral Form. */
,base.ACTPASR_RFT_CT_sT_Code_07AZW as ReferralFacility  /*Assessible on Referral Form. */
,ISNULL(base.ACTPASR_RFT_SS_StaffCode_8XBN0 , rlk.code) as ReferralReceiver /*Assessible on Referral Form. */
,a.documentIdentifier as documentIdentifier /* Hidden Requirement */
,base.ACTPASR_eligibility_6DQ4J as patientEligible /* Hidden Requirement */
,base.ACTPASR_HACC_2NELK as haccEligible,  /* Hidden Requirement */
r.identifier as referralId,   /* Hidden Requirement */
CAST(rtpm.ACTPASID as bigint) as ACTPASID,
ISNULL(REPLACE(base.referralReason_WN792,''&'',''&amp;''),'''')  as Comments,

--CONVERT(CHAR(23), r.lastModifiedDate, 126)  as RecvdDttm, /*Current Sumbitted date*/  /*Assessible on Referral Form. */
CONVERT(varchar(23), DATEADD(minute, meta.dateSigned_OK9EW_Ofst,meta.dateSigned_OK9EW), 126)as RecvdDttm, 


''NSP'' as ACCApprovalStatus,   /* ??? *//*Not available on Clinical Referral Form*/
''NSP'' as ACCType,   /* ??? *//*Not available on Clinical Referral Form*/
''NSP'' as AccClaimNumber,  /* ??? *//*Not available on Clinical Referral Form*/
''NSP'' as AccNumber,  /* ??? *//*Not available on Clinical Referral Form*/
''NSP'' as AccidentRelatedStatus,   /* ??? *//*Not available on Clinical Referral Form*/
''NSP'' as ActivityType,    /* ??? *//*Not available on Clinical Referral Form*/

CASE WHEN base.ACTPASR_HACC_2NELK = 1 THEN ''HACC'' ELSE ''NSP'' END as AdministrativeCategory,   /*Only HACC requirement*/  /*Assessible on Referral Form. */

''NSP'' as Authorisation,   /*Only NSP Avialable in ws*/
''NSP'' as AuthorisedByClinician,   /* ??? */
null as AuthrDttm,  /* ??? */
CONVERT(CHAR(23), GETDATE(), 126)  as CancdDttm,  /*Available in Referral Workflow and Event Summaries*/
CONVERT(CHAR(23), GETDATE(), 126) as ClosrDate, /*Only Closure requirement*/
null as ExpiryDttm,  /* ??? */
''NSP'' as FundingArrangement,   /* ??? */ 
null as OrdtaDttm,   /* ??? */
''NSP'' as FundingProgram,   /* ??? */
''NSP'' as FundingSubprogram,    /* ??? */
null as SentDttm,  /* ??? */

/*Possible Requirements*/
ISNULL(reference.MAIN_CODE,''NSP'') as Priority,    /* ??? */
ISNULL(refMeta.statusReasonCode,''NSP'') as ReferralCancellationReason,     /*Available in Referral Workflow ONLY*/
''CAREC'' as ReferralClosureReason,      /*Available in Referral Workflow and Event Summaries*/
''NSP'' as ReferralOutcome,            /*Available in Referral Workflow and Event Summaries*/
''AUTHR'' as ReferralStatus,   /*Authorised*//* ??? */
 

/*REFERRED BY*/ 
ISNULL(ISNULL(patgp.pcpclinicianid,base.g_clinicianId_OTDEQ),''UNK'') as ReferredByClinician,   /*Internal Referral*//* ??? */
ISNULL(patgp.pcpclinicid,''ACTCC'')  as ReferredByHealthOrganisation,    /*Internal Referral*/  
''NSP'' as ReferredByReference,    /*Internal Referral*//* ??? */
''UNK'' as ReferredBySpecialty,    /*Internal Referral*//* ??? */
ISNULL(base.ACTPASR_RFT_CT_sT_StffTm_7C$92,''NSP'') as ReferredByStaffTeam,    /*Internal Referral*//* ??? */
 
/*REFERRED TO*/
CASE WHEN base.ACTPASR_RFT_CT_RfrrrCd_L7K0C != '''' THEN base.ACTPASR_RFT_CT_RfrrrCd_L7K0C ElSE ISNULL(base.ACTPASR_RFT_CT_RfrrrCd_L7K0C,''NSP'') END as ReferredToClinician, /*Missing Field on Clinical Referral Form*/
ISNULL(base.ACTPASR_RFT_oHO_16SL1_cde,''ACTCC'')  as ReferredToHealthOrganisation, /*Hidden on Referral Form. ACTCC ONLY*/
''NSP'' as ReferredToReference, /* ??? */


CASE WHEN base.ACTPASR_RFT_CT_SpcltyCd_VQDYM != '''' THEN base.ACTPASR_RFT_CT_SpcltyCd_VQDYM ElSE ISNULL(base.ACTPASR_RFT_SS_SpcltyCd_Q2#DG,''UNK'') END  as ReferredToSpecialty,  /*Assessible on Referral Form. */

 
CASE WHEN base.ACTPASR_RFT_CT_sT_Code_07AZW != '''' THEN base.ACTPASR_RFT_CT_sT_Code_07AZW ElSE ISNULL(base.ACTPASR_RFT_SS_StaffCode_8XBN0,''UNK'') END   as ReferredToStaffTeam,  /*Assessible on Referral Form. */

ISNULL(REPLACE(base.ACTPASR_RFT_src_DGYRJ_cde,''&'',''&amp;''),''NSP'')  as SourceofReferral,   /*Assessible on Referral Form. */
''NSP'' as Urgency   /* ??? */


,''FAX'' as cwsReferralType
FROM OH_CM_cRepository.dbo.v2_SOAP#Referral#Request_NYIIB base 
INNER JOIN OH_CM_cRepository.dbo.v_AllDocumentIdentifier a ON a.documentId = base.DOCUMENTID
LEFT OUTER JOIN OH_CM_cRepository.dbo.v2_DocumentMetaData_0Z14K meta ON meta.documentId = base.DOCUMENTID
LEFT OUTER JOIN [OH_CM_clinical].[RefRequest].[ERF_ReferralRequest] rv ON rv.dataId = a.documentIdentifier 
LEFT OUTER JOIN [OH_CM_clinical].[Referral].[ERF_Referral] r ON r.referralRequestId = rv.id
INNER JOIN [OH_CM_clinical].[Referral].[ERF_ReferralMetaData] refMeta ON refMeta.id = r.metaDataId
LEFT OUTER JOIN [OH_CM_clinical].Refrequest.ERF_LK_RequestReceiver rlk ON rlk.ID = rv.ReferralRequestReceiverId
LEFT OUTER JOIN [OH_CM_custom].dbo.ReferralToPathwayMapping rtpm ON rtpm.referral_identifier = r.identifier
LEFT OUTER JOIN OH_CP_ClinicalPortal.[dbo].[cUser] cUser ON meta.sD_userId_7FQIQ = cUser.name 
LEFT OUTER JOIN ACTPAS_CDR_VIEWS.dbo.orion_CWSPatientGP patgp  ON patgp.patientID = r.patientIdentifier
LEFT OUTER JOIN [OH_CM_clinical].[Referral].ERF_LK_Priority p ON p.id = refMeta.priorityId
LEFT OUTER JOIN [ACTPAS_CDR_VIEWS].[dbo].[Orion_CWSReferenceValues] reference ON (reference.RFVDM_CODE = ''PRITY'' AND MAIN_CODE like ''CAT%'') AND REPLACE(reference.MAIN_CODE, ''CAT'', '''') = p.code 

'
GO
/****** Object:  View [dbo].[vw_ccr_referral_content_internal]    Script Date: 06/17/2015 14:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_ccr_referral_content_internal]'))
EXEC dbo.sp_executesql @statement = N'





CREATE VIEW [dbo].[vw_ccr_referral_content_internal] AS 
/*
View [dbo].[vw_ccr_referral_content_internal]
[Description] View to show all internal referral forms. This view is designed to have requirements for the ACTPAS webservices and pulls the data from the internal referral. Rhapsody will lookup this information by the referral Id and send the information to ACTPAS to create update or close the Referral.
 
@author: Orion Health [Tim Panoho]
@created: 2015-05-01
@reference:  
 
 !!!  Important Notes  !!! 
 Used by the vw_ccr_referral_content view as a UNION
*/ 
SELECT 
/*INTERNAL Referral VIEW*/
   
/*META DATA*/
base.DOCUMENTID,
r.id as extEventId,
r.patientIdentifier,  
(CASE WHEN ISNULL(base.g_AdmtNtfctnUslGP_ZP159_cde,''ns'')=''ni'' THEN ''N'' ELSE ''Y'' END) as consentToGP,
(CASE WHEN ISNULL(base.g_AdmtNtfctnUslGP_ZP159_cde,''ns'')=''ni'' THEN ''N'' ELSE ''Y'' END) as consentToCC,
ISNULL(ISNULL(patgp.pcpclinicianid,base.g_clinicianId_3TAJ5),''UNK'')  as referredToGP, 
ISNULL(ISNULL(patgp.pcpclinicianid,base.g_clinicianId_3TAJ5),''UNK'')  as referredToCC, 
   
ISNULL(base.RT_ownrHlthOrgnst_UALHS_cde,''ACTCC'') as  ownerHealth
,ISNULL(RT_ReferralReason_P8VHY_cde,''NSP'') as ReferralReason  /*Assessible on Referral Form. */
, ''EXTRL'' as ReferralType  /*Assessible on Referral Form. */
,ISNULL(REPLACE(UPPER(base.RT_source_RAZFB_cde),''&'',''&amp;''),''NS'') as ReferralSource   /*Assessible on Referral Form. */
,ISNULL(RT_SS_StaffCode_9NXA$,''NSP'') as ReferralStaffTeam  /*Assessible on Referral Form. */
,base.RT_CT_sT_Facility_M848U as ReferralFacility  /*Assessible on Referral Form. */
,ISNULL(RT_CT_sT_Code_TZORM,RT_SS_StaffCode_9NXA$) as ReferralReceiver /*Assessible on Referral Form. */
,a.documentIdentifier as documentIdentifier /* Hidden Requirement */
,base.eligibility_JU3DR as patientEligible /* Hidden Requirement */
,HACC_8B#JE as haccEligible,  /* Hidden Requirement */
r.identifier as referralId,   /* Hidden Requirement */ 
CAST(r.sourceReferralId as bigInt) as ACTPASID,
ISNULL(REPLACE(base.referralReason_3388R,''&'',''&amp;''),'''')  as Comments, 
CONVERT(varchar(23), DATEADD(minute, meta.dateSigned_OK9EW_Ofst,meta.dateSigned_OK9EW), 126)as RecvdDttm, 

/*Optional Information not yet scoped*/
''NSP'' as ACCApprovalStatus,   /* ??? *//*Not available on Clinical Referral Form*/
''NSP'' as ACCType,   /* ??? *//*Not available on Clinical Referral Form*/
''NSP'' as AccClaimNumber,  /* ??? *//*Not available on Clinical Referral Form*/
''NSP'' as AccNumber,  /* ??? *//*Not available on Clinical Referral Form*/
''NSP'' as AccidentRelatedStatus,   /* ??? *//*Not available on Clinical Referral Form*/
''NSP'' as ActivityType,    /* ??? *//*Not available on Clinical Referral Form*/

/*HACC Reporting Requirement*/
CASE WHEN HACC_8B#JE = 1 THEN ''HACC'' ELSE ''NSP'' END as AdministrativeCategory,   /*Only HACC requirement*/  /*Assessible on Referral Form. */
''NSP'' as Authorisation,   /*Only NSP Avialable in ws*/
''NSP'' as AuthorisedByClinician,   /* ??? */
null as AuthrDttm,  /* ??? */
CONVERT(CHAR(23),GETDATE(), 126)  as CancdDttm,  /*Available in Referral Workflow and Event Summaries*/
CONVERT(CHAR(23),GETDATE(), 126)  as ClosrDate, /*Only Closure requirement*/
null as ExpiryDttm,  /* ??? */
''NSP'' as FundingArrangement,   /* ??? */ 
null as OrdtaDttm,   /* ??? */
''NSP'' as FundingProgram,   /* ??? */
''NSP'' as FundingSubprogram,    /* ??? */
null as SentDttm,  /* ??? */

/*Possible Requirements*/
ISNULL(reference.MAIN_CODE,''NSP'') as Priority,    /* ??? */
ISNULL(refMeta.statusReasonCode,''NSP'') as ReferralCancellationReason,     /*Available in Referral Workflow ONLY*/
''CAREC'' as ReferralClosureReason,      /*Available in Referral Workflow and Event Summaries*/
''NSP'' as ReferralOutcome,			 /*Available in Referral Workflow and Event Summaries*/
''AUTHR'' as ReferralStatus,   /*Authorised*//* ??? */ 

/*REFERRED BY*/
ISNULL(ISNULL(patgp.pcpclinicianid,base.g_clinicianId_3TAJ5),''UNK'') as ReferredByClinician,   /*Internal Referral*//* ??? */
ISNULL(patgp.pcpclinicid,''ACTCC'')  as ReferredByHealthOrganisation,    /*Internal Referral*/ 
''NSP'' as ReferredByReference,    /*Internal Referral*//* ??? */
''UNK'' as ReferredBySpecialty,    /*Internal Referral*//* ??? */
ISNULL(base.RT_CT_sT_Code_TZORM,''NSP'') as ReferredByStaffTeam,    /*Internal Referral*//* ??? */


/*REFERRED TO*/
CASE WHEN base.RT_CT_ReferrerCode_GOFE2 != '''' THEN base.RT_CT_ReferrerCode_GOFE2 ElSE ISNULL(base.RT_CT_ReferrerCode_GOFE2,''NSP'') END as ReferredToClinician, /*Missing Field on Clinical Referral Form*/
ISNULL(base.RT_ownrHlthOrgnst_UALHS_cde,''ACTCC'')  as ReferredToHealthOrganisation, /*Hidden on Referral Form. ACTCC ONLY*/
''NSP'' as ReferredToReference, /* ??? */
CASE WHEN base.RT_CT_SpecialtyCode_2E#CR != '''' THEN base.RT_CT_SpecialtyCode_2E#CR ElSE ISNULL(base.RT_SS_SpecialtyCode_0FIQL,''UNK'') END  as ReferredToSpecialty,  /*Assessible on Referral Form. */
CASE WHEN base.RT_CT_sT_Code_TZORM != '''' THEN base.RT_CT_sT_Code_TZORM ElSE ISNULL(base.RT_SS_StaffCode_9NXA$,''UNK'') END   as ReferredToStaffTeam,  /*Assessible on Referral Form. */


/*SOURCE OF REFERRAL*/
ISNULL(REPLACE(base.RT_source_RAZFB_cde,''&'',''&amp;''),''UNK'')  as SourceofReferral,   /*Assessible on Referral Form. */
''NSP'' as Urgency   /* ??? */

/*INTERNAL VIEW IDENTIFICATION*/
,''INTERNAL'' as cwsReferralType 
FROM OH_CM_cRepository.dbo.[v2_INT#CR#Base_DDKVM] base 
INNER JOIN OH_CM_cRepository.dbo.v_AllDocumentIdentifier a ON a.documentId = base.DOCUMENTID
INNER JOIN OH_CM_cRepository.dbo.v2_DocumentMetaData_0Z14K meta ON meta.documentId = base.DOCUMENTID
INNER JOIN [OH_CM_clinical].[RefRequest].[ERF_ReferralRequest] rv ON rv.dataId = a.documentIdentifier 
INNER JOIN [OH_CM_clinical].[Referral].[ERF_Referral] r ON r.referralRequestId = rv.id
INNER JOIN [OH_CM_clinical].[Referral].[ERF_ReferralMetaData] refMeta ON refMeta.id = r.metaDataId
LEFT OUTER JOIN [OH_CM_custom].dbo.ReferralToPathwayMapping rtpm ON rtpm.referral_identifier = r.identifier 
LEFT OUTER JOIN ACTPAS_CDR_VIEWS.dbo.orion_CWSPatientGP patgp  ON patgp.patientID = r.patientIdentifier 
LEFT OUTER JOIN [OH_CM_clinical].[Referral].ERF_LK_Priority p ON p.id = refMeta.priorityId
LEFT OUTER JOIN [ACTPAS_CDR_VIEWS].[dbo].[Orion_CWSReferenceValues] reference ON (reference.RFVDM_CODE = ''PRITY'' AND MAIN_CODE like ''CAT%'') AND REPLACE(reference.MAIN_CODE, ''CAT'', '''') = p.code 

'
GO
/****** Object:  View [dbo].[vw_ccr_referral_content]    Script Date: 06/17/2015 14:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_ccr_referral_content]'))
EXEC dbo.sp_executesql @statement = N'



















CREATE VIEW [dbo].[vw_ccr_referral_content] AS 
/*
View [dbo].[vw_ccr_referral_content]
[Description] View to show all internal referral forms. This view is designed to have requirements for the ACTPAS webservices and pulls the data from the internal referral. Rhapsody will lookup this information by the referral Id and send the information to ACTPAS to create update or close the Referral.
 
@author: Orion Health [Tim Panoho]
@created: 2015-05-01
@reference:  
 
 !!!  Important Notes  !!! 
 This view is used by a Rhapsody Lookup before the referral is sent to ACTPAS. 
*/ 
   SELECT * FROM [vw_ccr_referral_content_internal]
   UNION ALL 
   SELECT * FROM [vw_ccr_referral_content_fax]




















'
GO
/****** Object:  StoredProcedure [dbo].[sp_ccr_adhoc_tasks]    Script Date: 06/17/2015 14:58:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ccr_adhoc_tasks]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[sp_ccr_adhoc_tasks] @patientId nvarchar(30), @form nvarchar(50) AS  
    
/* 
StoredProcedure [dbo].[[sp_ccr_adhoc_tasks]]
[Description] Retreives values populated in the Global forms windowlet in the Patient Profile in Clinical Portal. This stored procedure finds the tasks from the dbo.sp_ccr_findAllAdhoc stored procedure and returns these to Clinical Portal as a result set.
 
@author: Orion Health [Tim Panoho]
@created: 2015-05-01
@reference:  
 
 !!!  Important Notes  !!!   
*/ 
    BEGIN
        SELECT TOP 1 ADHOC.* FROM ( 
        
        SELECT pt.taskIdentifier as taskId, pt.dataId as dataId, TaskStatus.identifyingName as status , TaskType.identifyingName , pt.modificationTime modDate,
    ISNULL(meta.cD_userId_PLU2# ,meta.sD_userId_7FQIQ) as resolvedBy, '''' as NoticeFlag  
        FROM OH_CM_task.dbo.PersistentTask pt
        INNER JOIN OH_CM_task.dbo.SchedulableTaskGroup stg ON pt.owner = stg.uniqueId
        INNER JOIN OH_CM_task.dbo.PatientId patient ON stg.patient = patient.uniqueId
        INNER JOIN OH_CM_task.dbo.TaskType on pt.taskType = TaskType.uniqueId
        INNER JOIN OH_CM_task.dbo.TaskStatus on pt.taskStatus = TaskStatus.uniqueId
        LEFT OUTER JOIN [OH_CM_task].[dbo].[ProviderRef] pr on pr.uniqueId = pt.resolvedBy
         
        LEFT OUTER JOIN OH_CM_cRepository.dbo.DocumentIdentifier di ON pt.[dataId] = di.documentIdentifier 
        LEFT OUTER JOIN OH_CM_cRepository.dbo.v2_DocumentMetaData_0Z14K meta ON meta.DOCUMENTID = di.DOCUMENTID
        WHERE TaskType.identifyingName = @form
        AND patient.id = @patientId 
         
        
        UNION ALL
        
        SELECT '''' as taskId, '''' AS dataId, ''false'' as status, @form as identifyingName, '''' as modDate, '''' as resolvedBy,'''' as NoticeFlag
        ) ADHOC
        ORDER BY ADHOC.modDate desc
    END




' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ccr_findAllAdhoc]    Script Date: 06/17/2015 14:58:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ccr_findAllAdhoc]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[sp_ccr_findAllAdhoc] @patientId nvarchar(30) AS  

/* 
StoredProcedure [dbo].[[sp_ccr_adhoc_tasks]]
[Description] Retreives all tasks that are required to be displayed on the Global Forms windowlet in Clinical Portal under the Patient Profile. 
 
@author: Orion Health [Tim Panoho]
@created: 2015-05-01
@reference:  
 
 !!!  Important Notes  !!!   
*/ 
declare @myRetTab table (idx int identity(1,1), taskId nvarchar(40), dataId nvarchar(40), taskStatus nvarchar(30), identifyingName nvarchar(50), modDate dateTime, resolvedBy nvarchar(50),  noticeFlag nvarchar(40))
insert @myRetTab
     exec sp_ccr_adhoc_tasks @patientId, ''Off Campus / Home Visit Pre-Assessment'' 
--insert @myRetTab
     --exec sp_ccr_adhoc_tasks @patientId, ''HACC Assessment''
     --Removed as per CCR-465
  
insert @myRetTab
     exec sp_ccr_adhoc_tasks @patientId, ''Waterlow Assessment''
insert @myRetTab
     exec sp_ccr_adhoc_tasks @patientId, ''Manual Handling Assessment''
insert @myRetTab
     exec sp_ccr_adhoc_tasks @patientId, ''Non Response to a Scheduled Visit''
/*
Removed as per CCR-363
insert @myRetTab
     exec sp_ccr_adhoc_tasks @patientId, ''Social History''
insert @myRetTab
     exec sp_ccr_adhoc_tasks @patientId, ''Lifestyle Factors'' 
 */
 
begin
     select taskId, dataId, identifyingName, taskStatus, ISNULL(modDate, getdate()), resolvedBy, noticeFlag from @myRetTab order by modDate DESC     
end


' 
END
GO
/****** Object:  Table [dbo].[WICInformationSheets]    Script Date: 06/17/2015 14:58:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WICInformationSheets]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WICInformationSheets](
	[ItemNo] [uniqueidentifier] NOT NULL,
	[InfoSheet] [varchar](100) NOT NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[WICFinalDisposition]    Script Date: 06/17/2015 14:58:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WICFinalDisposition]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WICFinalDisposition](
	[ItemNo] [uniqueidentifier] NOT NULL,
	[Disposition] [varchar](100) NOT NULL,
	[Ordering] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[WICFinalClinicalImpression]    Script Date: 06/17/2015 14:58:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WICFinalClinicalImpression]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WICFinalClinicalImpression](
	[ItemNo] [uniqueidentifier] NOT NULL,
	[MainItem] [varchar](100) NOT NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[WICDispositions]    Script Date: 06/17/2015 14:58:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WICDispositions]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WICDispositions](
	[ItemNo] [uniqueidentifier] NOT NULL,
	[Disposition] [varchar](50) NOT NULL,
	[Priority] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ReferralToPathwayMappingHistory]    Script Date: 06/17/2015 14:58:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ReferralToPathwayMappingHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ReferralToPathwayMappingHistory](
	[uniqueId] [int] IDENTITY(1,1) NOT NULL,
	[ReferralToPathwayMapping_uniqueId] [int] NOT NULL,
	[ReferralToPathwayMapping_version] [int] NOT NULL,
	[referral_identifier] [nvarchar](50) NOT NULL,
	[referral_version] [int] NOT NULL,
	[pathway_enrollmentIdentifier] [varchar](255) NOT NULL,
	[pathway_enrollmentStatus] [varchar](255) NOT NULL,
	[messageId] [varchar](255) NOT NULL,
	[ACTPASID] [int] NULL,
 CONSTRAINT [PK_ReferralToPathwayMappingHistory] PRIMARY KEY CLUSTERED 
(
	[uniqueId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UC_ReferralToPathwayMappingHistory] UNIQUE NONCLUSTERED 
(
	[ReferralToPathwayMapping_uniqueId] ASC,
	[ReferralToPathwayMapping_version] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PathwayToSubpathwayMappingHistory]    Script Date: 06/17/2015 14:58:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PathwayToSubpathwayMappingHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PathwayToSubpathwayMappingHistory](
	[uniqueId] [int] IDENTITY(1,1) NOT NULL,
	[PathwayToSubMapping_uniqueId] [int] NOT NULL,
	[PathwayToSubMapping_version] [int] NOT NULL,
	[SubPathwayEnrolmentId] [nvarchar](50) NULL,
	[SubPathwayEnrolment_version] [int] NOT NULL,
	[PathwayEnrolmentId] [nvarchar](50) NULL,
	[SubEnrolmentStatus] [nchar](20) NULL,
	[messageId] [varchar](255) NOT NULL,
 CONSTRAINT [PK_PathwayToSubMappingHistory] PRIMARY KEY CLUSTERED 
(
	[uniqueId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UC_PathwayToSubMappingHistory] UNIQUE NONCLUSTERED 
(
	[PathwayToSubMapping_uniqueId] ASC,
	[PathwayToSubMapping_version] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PathwayToSubpathway_Mapping]    Script Date: 06/17/2015 14:58:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PathwayToSubpathway_Mapping]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PathwayToSubpathway_Mapping](
	[uniqueId] [int] IDENTITY(1,1) NOT NULL,
	[version] [int] NOT NULL,
	[PathwayName] [nvarchar](50) NULL,
	[PathwayEnrolmentId] [nvarchar](50) NULL,
	[SubPathwayName] [nvarchar](50) NULL,
	[SubPathwayEnrolmentId] [nvarchar](50) NULL,
	[SubPathwayEnrolment_version] [int] NOT NULL,
	[SubEnrolmentStatus] [nchar](20) NULL,
	[messageId] [varchar](255) NOT NULL
) ON [PRIMARY]
SET ANSI_PADDING ON
ALTER TABLE [dbo].[PathwayToSubpathway_Mapping] ADD [typeCode] [varchar](255) NULL
ALTER TABLE [dbo].[PathwayToSubpathway_Mapping] ADD [dischargeStatusId] [int] NULL
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[PathwayToSubpathway_Mapping]') AND name = N'PK_PathwayToSubpathwayMapping')
ALTER TABLE [dbo].[PathwayToSubpathway_Mapping] ADD  CONSTRAINT [PK_PathwayToSubpathwayMapping] PRIMARY KEY CLUSTERED 
(
	[uniqueId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[PathwayToSubpathway_Mapping]') AND name = N'UC_PathwayToSubpathwayMapping')
ALTER TABLE [dbo].[PathwayToSubpathway_Mapping] ADD  CONSTRAINT [UC_PathwayToSubpathwayMapping] UNIQUE NONCLUSTERED 
(
	[SubPathwayEnrolmentId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EventStatus_Mappings]    Script Date: 06/17/2015 14:58:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EventStatus_Mappings]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EventStatus_Mappings](
	[uniqueId] [int] IDENTITY(1,1) NOT NULL,
	[PathwayEnrollmentId] [nvarchar](50) NULL,
	[PathwayType] [nvarchar](50) NULL,
	[dischargeStatusId] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[TBL_CWS_Goals_Interventions_Treatment]    Script Date: 06/17/2015 14:58:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_CWS_Goals_Interventions_Treatment]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TBL_CWS_Goals_Interventions_Treatment](
	[ItemCode] [int] NOT NULL,
	[Item] [varchar](50) NULL,
	[ItemType] [varchar](10) NULL,
	[ItemService] [varchar](30) NULL,
	[Form] [varchar](30) NULL,
 CONSTRAINT [PK_TBL_CWS_Goals_Interventions_Treatment] PRIMARY KEY CLUSTERED 
(
	[ItemCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[vw_eventsummary_referralReasons]    Script Date: 06/17/2015 14:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_eventsummary_referralReasons]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vw_eventsummary_referralReasons] AS 
/*
View [dbo].[vw_eventsummary_referralReasons]
[Description] In the event summaries when closing an episode of care this view looks at retrieving the pathway identifiers for MAIN pathways or SUB pathways. This is used in the Rhapsody lookups and the SMT Referral Reason section for the CCR WIC and referral solution.
 
@author: Orion Health [Tim Panoho]
@created: 2015-05-01
@reference:  
 
 !!!  Important Notes  !!!  
*/ 
SELECT DISTINCT referralReasonLink.referralReason, r.identifier as ReferralId, results.dischargeSummaryId, r.referralViewId AS externalEventId
FROM (
    SELECT DISTINCT rtpm.pathway_enrollmentIdentifier as PathwayEnrolmentId, rtpm.referral_identifier,rtpm.pathway_enrollmentStatus as pathway_status, ''MAIN'' as PathwayType, psm.typeCode as typeCode, rtpm.dischargeSummaryId as dischargeSummaryId  FROM OH_CM_Custom.dbo.ReferralToPathwayMapping rtpm  LEFT OUTER JOIN OH_CM_Custom.dbo.PathwayToSubpathway_Mapping psm ON psm.PathwayEnrolmentId = rtpm.pathway_enrollmentIdentifier WHERE  
 rtpm.pathway_enrollmentIdentifier  IS NOT NULL  
 ) as results 
 INNER JOIN OH_CM_clinical.Referral.ERF_ReferralView r ON r.identifier = results.referral_identifier
LEFT OUTER JOIN OH_CM_clinical.Referral.ERF_Referral mr  ON mr.id = r.referralViewId 
LEFT OUTER JOIN OH_CM_clinical.[Referral].[ERF_ReferralMetaData] refMeta WITH(NOLOCK) ON mr.metaDataId = refMeta.id  
LEFT OUTER JOIN OH_CM_cRepository.dbo.v_AllDocumentIdentifier a WITH(NOLOCK) ON a.documentIdentifier = refMeta.dataId 
LEFT OUTER JOIN (
	SELECT soap.referralReason_WN792 as referralReason, soap.DOCUMENTID as DOCUMENTID FROM OH_CM_cRepository.dbo.v2_SOAP#Referral#Request_NYIIB soap WITH(NOLOCK) 
UNION ALL	
  SELECT base.referralReason_3388R as referralReason, base.DOCUMENTID as DOCUMENTID FROM OH_CM_cRepository.dbo.v2_INT#CR#Base_DDKVM base WITH(NOLOCK) 
  ) as referralReasonLink ON referralReasonLink.DOCUMENTID = a.documentId
'
GO
/****** Object:  View [dbo].[vw_documentlinkbyAssessment]    Script Date: 06/17/2015 14:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_documentlinkbyAssessment]'))
EXEC dbo.sp_executesql @statement = N'

CREATE VIEW [dbo].[vw_documentlinkbyAssessment] as
/*
View [dbo].[vw_documentlinkbyAssessment]
[Description] Retreives all Progress Notes and Care Plans from different Assessment forms. This is used by Rhapsody from the DAS database lookup. 
 
@author: Orion Health [Tim Panoho]
@created: 2015-05-01
@reference:  
 
 !!!  Important Notes  !!!   
*/ 
SELECT DISTINCT pe.pathwayIdentifier, pe.enrollmentIdentifier as pathwayEnrollmentId, title_PXB$P as documentMetadataTitle
	,dclnk.documentIdentifier_0E#DK as documentDataId , pt.dataId as dataId,
	 ''uuid_aa226254-a10a-4cdd-94c7-2e57af1006a4''  as documentModelId
   FROM [OH_CM_clinical].[PathwayEnrollment].[PES_PathwayEnrollment] pe
    INNER JOIN OH_CM_Task.dbo.PersistentTask pt ON pe.enrollmentIdentifier = REPLACE(pt.subjectKey,''ESI:com.orchestral.workflow.pathway.enrollment.api_3_1.esw.PathwayEnrollmentSubjectType:'','''')
    LEFT OUTER JOIN  OH_CM_cRepository.dbo.v_AllDocumentIdentifier ad ON ad.documentIdentifier = pt.dataId
    INNER JOIN OH_CM_cRepository.dbo.v2_GBLrvwSmmrycmpnnt_83RT5 comp ON comp.DOCUMENTID = ad.DOCUMENTID  
	INNER JOIN OH_CM_cRepository.dbo.v2_GBLrSc_83RT5_dcLn_HDGDFTH dclnk ON comp.v2_GBLrvwSmmrycmpnnt_83RT5 = dclnk.v2_GBLrvwSmmrycmpnnt_83RT5 
	WHERE enrollmentStatus = ''ENROLLED''
	
UNION ALL 
SELECT DISTINCT pe.pathwayIdentifier, pe.enrollmentIdentifier as pathwayEnrollmentId, title_PXB$P as documentMetadataTitle
	,dclnk.documentIdentifier_0E#DK as documentDataId , pt.dataId as dataId,
	 ''uuid_4832b237-a681-4b27-9a33-fc419b38433c'' as documentModelId
   FROM [OH_CM_clinical].[PathwayEnrollment].[PES_PathwayEnrollment] pe
    INNER JOIN OH_CM_Task.dbo.PersistentTask pt ON pe.enrollmentIdentifier = REPLACE(pt.subjectKey,''ESI:com.orchestral.workflow.pathway.enrollment.api_3_1.esw.PathwayEnrollmentSubjectType:'','''')
    LEFT OUTER JOIN  OH_CM_cRepository.dbo.v_AllDocumentIdentifier ad ON ad.documentIdentifier = pt.dataId
    INNER JOIN OH_CM_cRepository.dbo.v2_GBLrvwSmmrycmpnnt_83RT5 comp ON comp.DOCUMENTID = ad.DOCUMENTID  
	INNER JOIN OH_CM_cRepository.dbo.v2_GBLrSc_83RT5_dcLn_HLGE0NH dclnk ON comp.v2_GBLrvwSmmrycmpnnt_83RT5 = dclnk.v2_GBLrvwSmmrycmpnnt_83RT5 
	WHERE enrollmentStatus = ''ENROLLED''
		
	
UNION ALL 
SELECT DISTINCT pe.pathwayIdentifier, pe.enrollmentIdentifier as pathwayEnrollmentId, title_PXB$P as documentMetadataTitle
	,docLink.documentIdentifier_0E#DK as documentDataId , pt.dataId as dataId,
	 ''uuid_617b72ba-5dee-4c61-8ab4-e51fdf7bf71d'' as documentModelId
   FROM [OH_CM_clinical].[PathwayEnrollment].[PES_PathwayEnrollment] pe
    INNER JOIN OH_CM_Task.dbo.PersistentTask pt ON pe.enrollmentIdentifier = REPLACE(pt.subjectKey,''ESI:com.orchestral.workflow.pathway.enrollment.api_3_1.esw.PathwayEnrollmentSubjectType:'','''')
    LEFT OUTER JOIN  OH_CM_cRepository.dbo.v_AllDocumentIdentifier ad ON ad.documentIdentifier = pt.dataId
    INNER JOIN OH_CM_cRepository.dbo.v2_GBLrvwSmmrycmpnnt_83RT5 comp ON comp.DOCUMENTID = ad.DOCUMENTID  
	INNER JOIN OH_CM_cRepository.dbo.v2_GBLrSc_83RT5_TrtOrd_NWLXH compLink ON comp.v2_GBLrvwSmmrycmpnnt_83RT5 = compLink.v2_GBLrvwSmmrycmpnnt_83RT5
	INNER JOIN OH_CM_cRepository.dbo.v2_GBLTrtmntOrdrsLnk_30YCV compForm ON compLink.v2_GBLTrtmntOrdrsLnk_30YCV = compForm.v2_GBLTrtmntOrdrsLnk_30YCV
	INNER JOIN OH_CM_cRepository.dbo.v2_GBLTOL_30YCV_t_dcLn_K7LBL docLink ON docLink.v2_GBLTrtmntOrdrsLnk_30YCV = compForm.v2_GBLTrtmntOrdrsLnk_30YCV
	WHERE enrollmentStatus = ''ENROLLED'' 
	

'
GO
/****** Object:  View [dbo].[vw_ccr_actionListTask_formContent]    Script Date: 06/17/2015 14:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_ccr_actionListTask_formContent]'))
EXEC dbo.sp_executesql @statement = N'


CREATE VIEW [dbo].[vw_ccr_actionListTask_formContent] AS 

/*
View [dbo].[vw_ccr_actionListTask_formContent]
[Description] Retreives the form content of the action list in assessment forms in the CCR solution. The view contents a shared component that is linked to all forms that have this specific component. 
 
@author: Orion Health [Tim Panoho]
@created: 2015-05-01
@reference:  Appears in Rhapsody under the Status Update Route This view requires to have a full list of dataIds
 
 !!!  Important Notes  !!!  
*/ 

 SELECT  ad.documentIdentifier as documentIdentifier 
          ,ISNULL( comp.S_NxtAppntmntRqrd_RBRL8 , 0 ) as isReview
          ,ISNULL( comp.AddanEventStatus_GVRH4 , 0 )  as isEventStatus  
          ,S_dueDate_5HAAZ as dueDate
           
FROM OH_CM_cRepository.dbo.v_AllDocumentIdentifier ad  
    INNER JOIN OH_CM_cRepository.dbo.V2_DOCUMENTMETADATA_0Z14K metaData on metaData.documentId = ad.documentId
INNER JOIN  OH_CM_cRepository.dbo.v2_GBLrvwSmmrycmpnnt_83RT5 comp ON comp.DOCUMENTID = ad.documentId
  


'
GO
/****** Object:  View [dbo].[vw_ccr_NursingAssessmentWounds]    Script Date: 06/17/2015 14:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_ccr_NursingAssessmentWounds]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vw_ccr_NursingAssessmentWounds] AS 

/*
View [dbo].[vw_ccr_NursingAssessmentWounds]
[Description] Retreives the wound questions from nursing assessment and nursing assessment review forms in the CCR solution. The view contents a shared component that is linked to all forms that have this specific component. 
 
@author: Orion Health [Tim Panoho]
@created: 2015-05-01
@reference:  
 
 !!!  Important Notes  !!!  
*/ 
select  docid.documentId, DocId.documentIdentifier, wt.v2_CNNrAs_DC688_I_WnTy_K1P$B,  wt.IS_WT_WoundType_EI60I_cde
from OH_CM_cRepository.dbo.v_AllDocumentIdentifier DocId
 join OH_CM_cRepository.dbo.v2_CN#NursingAssessment_DC688 NA on NA.DOCUMENTID = DocId.documentId 
 join OH_CM_cRepository.dbo.v2_CNNrAs_DC688_I_WnTy_K1P$B WT on NA.v2_CN#NursingAssessment_DC688 = WT.v2_CN#NursingAssessment_DC688

UNION ALL

SELECT  docid.documentId, DocId.documentIdentifier, wt.v2_CNNRA_D$K$N_I_WnTy_K1P$B,  wt.IS_WT_WoundType_EI60I_cde
FROM OH_CM_cRepository.dbo.v_AllDocumentIdentifier DocId
JOIN OH_CM_cRepository.dbo.v2_CNNrsngRvwAssssmnt_D$K$N  NA on NA.DOCUMENTID = DocId.documentId 
JOIN OH_CM_cRepository.dbo.v2_CNNRA_D$K$N_I_WnTy_K1P$B wt ON na.v2_CNNrsngRvwAssssmnt_D$K$N = wt.v2_CNNrsngRvwAssssmnt_D$K$N  
'
GO
/****** Object:  View [dbo].[vw_ccr_NursingAssessmentCatheterPlan]    Script Date: 06/17/2015 14:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_ccr_NursingAssessmentCatheterPlan]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vw_ccr_NursingAssessmentCatheterPlan] AS 

/*
@Depricated.

View [dbo].[vw_ccr_NursingAssessmentCatheterPlan]
[Description] Retreives the Catheter Management Plan from nursing assessment and nursing assessment review forms in the CCR solution. The view contents a shared component that is linked to all forms that have this specific component. Designed to trigger tasks when assessments are completed.
 
@author: Orion Health [Tim Panoho]
@created: 2015-05-01
@reference:  
 
 !!!  Important Notes  !!!  
*/
SELECT na.US_isUrinaryCatheter_SC7DT as isCatheter, DocId.documentIdentifier
FROM OH_CM_cRepository.dbo.v_AllDocumentIdentifier DocId
JOIN OH_CM_cRepository.dbo.v2_CN#NursingAssessment_DC688 na ON na.DOCUMENTID = DocId.documentId


UNION ALL

SELECT na.US_isUrinaryCatheter_SC7DT as isCatheter, DocId.documentIdentifier
FROM OH_CM_cRepository.dbo.v_AllDocumentIdentifier DocId
JOIN OH_CM_cRepository.dbo.v2_CNNrsngRvwAssssmnt_D$K$N  NA on NA.DOCUMENTID = DocId.documentId
'
GO
/****** Object:  View [dbo].[vw_ccr_nursingAssesmentTasks_formContent]    Script Date: 06/17/2015 14:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_ccr_nursingAssesmentTasks_formContent]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[vw_ccr_nursingAssesmentTasks_formContent] AS 

/*
View [dbo].[vw_ccr_nursingAssesmentTasks_formContent]
[Description] Retreives the form content of the nursing assessment and nursing assessment review for in the CCR solution. The view contents a shared component that is linked to all forms that have this specific component. The design is to find if there are SUB pathways that are required to be generated. There is a Rhapsody route that lookups the returned values and enrols patients onto specific pathways.
 
@author: Orion Health [Tim Panoho]
@created: 2015-05-01
@reference:  
 
 !!!  Important Notes  !!!  
*/ 

 SELECT   ad.documentIdentifier as documentIdentifier
          , na.reviewBowel_LGNFD as reviewBowel
          , na.US_reviewUrinary_EI345 as reviewUrinary
          , na.reviewIntegumentary_R5L$0 as reviewIntegumentary
          , ISNULL(na.US_CommenceStoma_NM3NJ, na.BF_CommenceStomaPathway_QLJX6) as isStoma
          , ISNULL(na.US_CommenceStoma_NM3NJ, null) as isStomaUrinary
          , na.BF_CommenceStomaPathway_QLJX6 as isStomaBowel
          , ISNULL (na.US_ContinencePathway_0G1OL, na.BF_cmmncCntnncPthwy_C881C  ) as isContinence
          , na.IS_WoundsPresent_ZASX2 as isWound
          , na.reviewOncology_#FY3W as isOncology
          ,comp.S_NxtAppntmntRqrd_RBRL8 as isReviewed
          ,CASE 
			WHEN RTRIM(CONVERT(CHAR(10), comp.S_dueDate_5HAAZ, 126)) <= RTRIM(CONVERT(CHAR(10), GETDATE(), 126))   
          THEN RTRIM(CONVERT(CHAR(10), GETDATE(), 126))
          ELSE RTRIM(CONVERT(CHAR(10), comp.S_dueDate_5HAAZ, 126))
          END   as dueDate
FROM OH_CM_cRepository.dbo.v_AllDocumentIdentifier ad
INNER JOIN OH_CM_cRepository.dbo.v2_CN#NursingAssessment_DC688 na ON na.DOCUMENTID = ad.DOCUMENTID 
INNER JOIN  OH_CM_cRepository.dbo.v2_CNNrAs_DC688_RvwSmry_VHP#7 nar ON na.v2_CN#NursingAssessment_DC688 = nar.v2_CN#NursingAssessment_DC688
INNER JOIN  OH_CM_cRepository.dbo.v2_GBLrvwSmmrycmpnnt_83RT5 comp ON comp.v2_GBLrvwSmmrycmpnnt_83RT5 = nar.v2_GBLrvwSmmrycmpnnt_83RT5



UNION ALL


 SELECT   ad.documentIdentifier as documentIdentifier
          , na.reviewBowel_LGNFD as reviewBowel
          , na.US_reviewUrinary_EI345 as reviewUrinary
          , na.reviewIntegumentary_R5L$0 as reviewIntegumentary
          , ISNULL(na.US_CommenceStoma_NM3NJ, na.BF_CommenceStomaPathway_QLJX6) as isStoma
          , ISNULL(na.US_CommenceStoma_NM3NJ, null) as isStomaUrinary
          , na.BF_CommenceStomaPathway_QLJX6 as isStomaBowel
          , ISNULL (na.US_ContinencePathway_0G1OL, na.BF_cmmncCntnncPthwy_C881C  ) as isContinence
          , na.IS_WoundsPresent_ZASX2 as isWound
          , na.reviewOncology_#FY3W as isOncology
          ,comp.S_NxtAppntmntRqrd_RBRL8 as isReview
          ,CASE 
			WHEN RTRIM(CONVERT(CHAR(10), comp.S_dueDate_5HAAZ, 126)) <= RTRIM(CONVERT(CHAR(10), GETDATE(), 126))   
          THEN RTRIM(CONVERT(CHAR(10), GETDATE(), 126))
          ELSE RTRIM(CONVERT(CHAR(10), comp.S_dueDate_5HAAZ, 126))
          END   as dueDate
FROM OH_CM_cRepository.dbo.v_AllDocumentIdentifier ad
JOIN OH_CM_cRepository.dbo.v2_CNNrsngRvwAssssmnt_D$K$N na ON na.DOCUMENTID = ad.DOCUMENTID 
JOIN OH_CM_cRepository.dbo.v2_CNNRA_D$K$N_RvwSmry_VHP#7 rs ON na.v2_CNNrsngRvwAssssmnt_D$K$N = rs.v2_CNNrsngRvwAssssmnt_D$K$N
JOIN OH_CM_cRepository.dbo.v2_GBLrvwSmmrycmpnnt_83RT5 comp ON comp.v2_GBLrvwSmmrycmpnnt_83RT5 = rs.v2_GBLrvwSmmrycmpnnt_83RT5

'
GO
/****** Object:  View [dbo].[vw_ccr_adhoc_tasks_hacc]    Script Date: 06/17/2015 14:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_ccr_adhoc_tasks_hacc]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[vw_ccr_adhoc_tasks_hacc] AS  
/*
View [dbo].[vw_ccr_adhoc_tasks_hacc]
[Description] Retreives HACC task information for the CCR solution. 
 
@author: Orion Health [Tim Panoho]
@created: 2015-05-01
@reference:  
 
 !!!  Important Notes  !!!   
*/ 
	SELECT vrc.documentID as baseDocumentID, haccEligible, cwsReferralType, ISNULL(hacc.HACC_OverrideHACC_ZN#C3,0) as haccOverride ,pathway_enrollmentIdentifier,taskIdentifier , (case when haccEligible = 0 then 1 else 0 end) as haccSwitch  , rpm.referral_identifier as referralId	
FROM OH_CM_Custom.dbo.ReferralToPathwayMapping rpm 
INNER JOIN [OH_CM_Custom].[dbo].[vw_ccr_referral_content] vrc WITH(NOLOCK) ON vrc.referralId = rpm.referral_identifier 
 INNER JOIN OH_CM_task.dbo.PersistentTask pt WITH(NOLOCK) ON rpm.pathway_enrollmentIdentifier = REPLACE(pt.subjectKey,''ESI:com.orchestral.workflow.pathway.enrollment.api_3_1.esw.PathwayEnrollmentSubjectType:'','''')         
 INNER JOIN OH_CM_cRepository.dbo.v_AllDocumentIdentifier a WITH(NOLOCK) ON a.documentIdentifier = pt.dataId  
 INNER JOIN OH_CM_cRepository.dbo.v2_CCRGBLFrmCmpnnt_3TBZ$ hacc WITH(NOLOCK) ON hacc.DOCUMENTID = a.DOCUMENTID  
'
GO
/****** Object:  View [dbo].[v_WhiteboardReferrals]    Script Date: 06/17/2015 14:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_WhiteboardReferrals]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[v_WhiteboardReferrals]
AS
/*
View [dbo].[v_WhiteboardReferrals]
[Description] Retreives content specifically for the WIC implementation. To get the referral reason for the whiteboard table. 
 
@author: Orion Health [Tim Panoho]
@created: 2015-05-01
@reference:  
 
 !!!  Important Notes  !!!  
 This needs to be changed to a view: Possibly to use the vw_eventsummary_referralReasons
*/ 
SELECT     uniqueId AS v2_INT#CR#Base_DDKVM, instanceId, documentId, RP_code_X#P0U AS ReferralPeriod_KU3SA_cde, 
                      RP_description_RQ6QY AS ReferralPeriod_KU3SA_desc, RP_codingSystem_9TJFT AS ReferralPeriod_KU3SA_cdSys, 
                      RP_alternateCode_Q9PFW AS ReferralPeriod_KU3SA_aCde, RP_alternateDescription_ZVNAJ AS ReferralPeriod_KU3SA_aDesc, 
                      RP_alternateCodingSystem_SAGNK AS ReferralPeriod_KU3SA_aCdSys, RP_suppliedDescription_7I9CG AS ReferralPeriod_KU3SA_sDesc, R_identifier_3F16U, 
                      R_namespace_JVZEX, RT_IR_code_CTBS4 AS RT_IntlRcvr_MEJCJ_cde, RT_IR_description_KV#KO AS RT_IntlRcvr_MEJCJ_desc, 
                      RT_IR_codingSystem_C5#2B AS RT_IntlRcvr_MEJCJ_cdSys, RT_IR_alternateCode_DCBIX AS RT_IntlRcvr_MEJCJ_aCde, 
                      RT_IR_altrntDscrptn_QHJA2 AS RT_IntlRcvr_MEJCJ_aDesc, RT_IR_altrntCdngSystm_UME$0 AS RT_IntlRcvr_MEJCJ_aCdSys, 
                      RT_IR_sppldDscrptn_M5X36 AS RT_IntlRcvr_MEJCJ_sDesc, RT_ReferralService_QWYLW, 
                      RT_ReferralType_LRUT8, RT_s_code_5WFI2, RT_SS_StaffCode_9NXA$, RT_CT_sT_Facility_M848U, 
                      pD_cT_code_O2IPV AS pD_callbackType_7$#51_cde, pD_cT_description_FPCVH AS pD_callbackType_7$#51_desc, 
                      pD_cT_codingSystem_8#ION AS pD_callbackType_7$#51_cdSys, pD_cT_alternateCode_6PQBR AS pD_callbackType_7$#51_aCde, 
                      pD_cT_altrntDscrptn_ED8OZ AS pD_callbackType_7$#51_aDesc, pD_cT_altrntCdngSystm_RK29W AS pD_callbackType_7$#51_aCdSys, 
                      pD_cT_sppldDscrptn_ZE#93 AS pD_callbackType_7$#51_sDesc, pD_otherPhone_CNVIC, pD_name_I4EFJ, pD_mobilePhone_SFIW6, pD_homePhone_1ANL0, 
                      pD_gender_DI286, pD_workPhone_O8HQ1, pD_address_RTW8L, pD_interpreter_B87C8, pD_language_T4124, pD_indigenous_6JC4T, pD_alternativeAddress_1RP07, 
                      pD_PrmssntlvmssgH_G2P0#, pD_PrmssntlvmssgW_ZIE9Y, pD_PrmssntlvmssgM_SDL1S, pD_MedicareCardNumber_O883N, pD_PensionCardNumber_#G#$E, 
                      pD_HealthCareCard_BRD9S, pD_DVACardNumber_CXGH8, pD_Compensable_BRSN$, pD_Deceased_KU3YT, pD_DateofBirth_9AQFC, g_name_$LTNF, 
                      g_workPhone_8RCYZ, g_address_174A4, g_fax_EIQR4, g_clinic_6FVJS, g_usualGP_2PWZ3, g_PrmssntlvmssgP_#BTCF, referralReason_3388R, 
                      SD_otherTextSource_1#U$3, SD_R_Title_39D8C, SD_R_FirstName_#YCG#, SD_R_Surname_8GW$5, SD_R_HealthCareRole_66DTD, SD_R_Phone_FCW#8, 
                      SD_R_Fax_X$3PJ, SD_R_Address_V9JCS, showNOK_A54V$, showGP_HKE5T, showGender_BOD6Z, PastMedicalHxComments_1AG3$, 
                      '''' as nilMeds_QAERU 
FROM         OH_CM_cRepository.dbo.t_BJKM#24155IZ AS tab1
WHERE     (transactionTo = CONVERT(DATETIME, ''9999-12-31 23:59:59.000'', 121))

'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'v_WhiteboardReferrals', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tab1"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 288
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_WhiteboardReferrals'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'v_WhiteboardReferrals', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_WhiteboardReferrals'
GO
/****** Object:  View [dbo].[vw_ccr_nursingAssesmentDataIdFromTasks]    Script Date: 06/17/2015 14:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_ccr_nursingAssesmentDataIdFromTasks]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vw_ccr_nursingAssesmentDataIdFromTasks] AS 
/*
View [dbo].[vw_ccr_nursingAssesmentDataIdFromTasks]
[Description] Retreives identifier information for lookup in rhapsody. The purpose of this view is to find all the current tasks with id information from the persistant task table.
 
@author: Orion Health [Tim Panoho]
@created: 2015-05-01
@reference:  
 
 !!!  Important Notes  !!!  
*/ 
SELECT dataId, taskIdentifier FROM OH_CM_Task.dbo.PersistentTask
'
GO
/****** Object:  View [dbo].[vw_ccr_event_summary]    Script Date: 06/17/2015 14:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_ccr_event_summary]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vw_ccr_event_summary] AS 
/*
View [dbo].[vw_ccr_event_summary]
[Description] Retreives event summary information for the rhapsody lookup to determine the pathway to deactivate. 
 
@author: Orion Health [Tim Panoho]
@created: 2015-05-01
@reference:  
 
 !!!  Important Notes  !!!   
*/ 

SELECT  pe.enrollmentIdentifier as ID,
	pe.pathwayIdentifier as Pathway,
	CONVERT(varchar(20), pe.enrollmentTime, 113) as enrollTime,
	CONVERT(varchar(20), pe.modificationTime, 113) as endTime,
	pe.pathwayIdentifier as Category,
	pe.enrollmentIdentifier  as enrollDescription,
	pe.enrollmentStatus as Status ,  TaskType.identifyingName, TaskStatus.mappedStatus as formStatus, pt.dataId as dataId, pt.modelId, pt.note, pt.taskIdentifier, patientId , CONVERT(varchar(20), pt.resolutionTime, 113) as resolutionTime, pf.id as assignedTo
	
	FROM OH_CM_Clinical.PathwayEnrollment.PES_PathwayEnrollment pe  

     INNER JOIN OH_CM_task.dbo.PersistentTask pt ON pt.subjectKey = ''ESI:com.orchestral.workflow.pathway.enrollment.api_3_1.esw.PathwayEnrollmentSubjectType:''+pe.enrollmentIdentifier
	 LEFT OUTER JOIN OH_CM_task.dbo.ProviderRef pf ON pf.uniqueId = pt.assignedTo 
	 JOIN OH_CM_task.dbo.SchedulableTaskGroup stg ON pt.owner = stg.uniqueId
	 JOIN OH_CM_task.dbo.PatientId patient ON stg.patient = patient.uniqueId
	 JOIN OH_CM_task.dbo.TaskType on pt.taskType = TaskType.uniqueId
	 JOIN OH_CM_task.dbo.TaskStatus on pt.taskStatus = TaskStatus.uniqueId 
	  
'
GO
/****** Object:  View [dbo].[vw_ccr_adhoc_tasks_waterlow]    Script Date: 06/17/2015 14:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_ccr_adhoc_tasks_waterlow]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vw_ccr_adhoc_tasks_waterlow] AS  
/*
View [dbo].[vw_ccr_adhoc_tasks_waterlow]
[Description] Retreives water low task information for the CCR solution. 
 
@author: Orion Health [Tim Panoho]
@created: 2015-05-01
@reference:  
 
 !!!  Important Notes  !!!   
*/ 
	SELECT pt.taskIdentifier as taskId , patient.id , TaskType.identifyingName , pt.modificationTime modDate
	FROM OH_CM_task.dbo.PersistentTask pt
	JOIN OH_CM_task.dbo.SchedulableTaskGroup stg ON pt.owner = stg.uniqueId
	JOIN OH_CM_task.dbo.PatientId patient ON stg.patient = patient.uniqueId
	JOIN OH_CM_task.dbo.TaskType on pt.taskType = TaskType.uniqueId
	JOIN OH_CM_task.dbo.TaskStatus on pt.taskStatus = TaskStatus.uniqueId AND (TaskStatus.identifyingName = ''Completed'' OR TaskStatus.identifyingName = ''New'')
	WHERE TaskType.identifyingName = ''Waterlow Assessment''
'
GO
/****** Object:  View [dbo].[vw_ccr_adhoc_tasks_home]    Script Date: 06/17/2015 14:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_ccr_adhoc_tasks_home]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vw_ccr_adhoc_tasks_home] AS  
/*
View [dbo].[vw_ccr_adhoc_tasks_home]
[Description] Retreives Home Visit task information for the CCR solution. 
 
@author: Orion Health [Tim Panoho]
@created: 2015-05-01
@reference:  
 
 !!!  Important Notes  !!!   
*/ 
	SELECT pt.taskIdentifier as taskId , patient.id , TaskType.identifyingName name
	FROM OH_CM_task.dbo.PersistentTask pt
	JOIN OH_CM_task.dbo.SchedulableTaskGroup stg ON pt.owner = stg.uniqueId
	JOIN OH_CM_task.dbo.PatientId patient ON stg.patient = patient.uniqueId
	JOIN OH_CM_task.dbo.TaskType on pt.taskType = TaskType.uniqueId
	JOIN OH_CM_task.dbo.TaskStatus on pt.taskStatus = TaskStatus.uniqueId AND (TaskStatus.identifyingName = ''Completed'' OR TaskStatus.identifyingName = ''New'')
	WHERE TaskType.identifyingName = ''Home Assessment''
'
GO
/****** Object:  View [dbo].[vw_ccr_adhoc_tasks]    Script Date: 06/17/2015 14:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_ccr_adhoc_tasks]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vw_ccr_adhoc_tasks] AS 
/*
View [dbo].[vw_ccr_adhoc_tasks]
[Description] Retreives ALL Adhoc Global task information for the CCR solution. This is for a windowlet in the Patient Profile of Clinical Portal.
 
@author: Orion Health [Tim Panoho]
@created: 2015-05-01
@reference:  
 
 !!!  Important Notes  !!!   
*/ 
SELECT ADHOC.*
FROM ( 
	SELECT ISNULL( ( SELECT TOP 1 pt.taskIdentifier as taskId 
	FROM OH_CM_task.dbo.PersistentTask pt
	JOIN OH_CM_task.dbo.SchedulableTaskGroup stg ON pt.owner = stg.uniqueId
	JOIN OH_CM_task.dbo.PatientId patient ON stg.patient = patient.uniqueId
	JOIN OH_CM_task.dbo.TaskType on pt.taskType = TaskType.uniqueId
	JOIN OH_CM_task.dbo.TaskStatus on pt.taskStatus = TaskStatus.uniqueId AND (TaskStatus.identifyingName = ''Completed'' OR TaskStatus.identifyingName = ''New'')
	WHERE TaskType.identifyingName = ''HACC Assessment''
	ORDER BY pt.modificationTime desc
	) , ( SELECT ''false'' as taskId  ) )
	 as HACC 
	, ISNULL( ( SELECT TOP 1 pt.taskIdentifier as taskId 
	FROM OH_CM_task.dbo.PersistentTask pt
	JOIN OH_CM_task.dbo.SchedulableTaskGroup stg ON pt.owner = stg.uniqueId
	JOIN OH_CM_task.dbo.PatientId patient ON stg.patient = patient.uniqueId
	JOIN OH_CM_task.dbo.TaskType on pt.taskType = TaskType.uniqueId
	JOIN OH_CM_task.dbo.TaskStatus on pt.taskStatus = TaskStatus.uniqueId AND (TaskStatus.identifyingName = ''Completed'' OR TaskStatus.identifyingName = ''New'')
	WHERE TaskType.identifyingName = ''HOME Assessment''
	ORDER BY pt.modificationTime desc
	) , ( SELECT ''false'' as taskId  ) )
	 as HOME  
	 , ISNULL( ( SELECT TOP 1 pt.taskIdentifier as taskId 
	FROM OH_CM_task.dbo.PersistentTask pt
	JOIN OH_CM_task.dbo.SchedulableTaskGroup stg ON pt.owner = stg.uniqueId
	JOIN OH_CM_task.dbo.PatientId patient ON stg.patient = patient.uniqueId
	JOIN OH_CM_task.dbo.TaskType on pt.taskType = TaskType.uniqueId
	JOIN OH_CM_task.dbo.TaskStatus on pt.taskStatus = TaskStatus.uniqueId AND (TaskStatus.identifyingName = ''Completed'' OR TaskStatus.identifyingName = ''New'')
	WHERE TaskType.identifyingName = ''Waterlow Assessment''
	ORDER BY pt.modificationTime desc
	) , ( SELECT ''false'' as taskId  ) )
	 as WATER   
	 , ISNULL( ( SELECT TOP 1 pt.taskIdentifier as taskId
	FROM OH_CM_task.dbo.PersistentTask pt
	JOIN OH_CM_task.dbo.SchedulableTaskGroup stg ON pt.owner = stg.uniqueId
	JOIN OH_CM_task.dbo.PatientId patient ON stg.patient = patient.uniqueId
	JOIN OH_CM_task.dbo.TaskType on pt.taskType = TaskType.uniqueId
	JOIN OH_CM_task.dbo.TaskStatus on pt.taskStatus = TaskStatus.uniqueId AND (TaskStatus.identifyingName = ''Completed'' OR TaskStatus.identifyingName = ''New'')
	WHERE TaskType.identifyingName = ''Non-Response to a Schedule Visit''
	ORDER BY pt.modificationTime desc
	) , ( SELECT ''false'' as taskId  ) )
	 as NONSCHEDULE  
) ADHOC
'
GO
/****** Object:  View [dbo].[ACTPAS_Password_UserAttributes]    Script Date: 06/17/2015 14:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[ACTPAS_Password_UserAttributes]'))
EXEC dbo.sp_executesql @statement = N'/*
@Depricated
View [dbo].[ACTPAS_Password_UserAttributes]
[Description] Retreives design for context switching and passing a username and password to the MKM validation engine.
 
@author: Orion Health [Tim Panoho]
@created: 2015-05-01
@reference: AIM-28, CCR-1131 
 
 !!!  Important Notes  !!!   
*/ 


/* 
Changelog:
2014-10-14 Tim Panoho@orionhealth.com Updated:
Moved into the OH_CP_ContextSwitching database

 Use against Orion Health Clinical Portal 7.4.10
 Use against Orion Health Clinical Portal 7.4.6
Changed to point to CCR environment
Copied view down into custom database views for CCR project

2012-11-08 Mark Gardiner@orionhealth.com
 Use against Orion Health Clinical Portal 7.2.0
 
  
*/
CREATE VIEW [dbo].[ACTPAS_Password_UserAttributes]
AS
SELECT passUserView.userId as userId, passUserView.[Actpas User name] as pasId, passUserView.[Actpas Password] as value
FROM (
	SELECT   u.name AS userId, ua.name AS propertyName, ua.cValue AS value
	FROM OH_CP_ClinicalPortal.dbo.UserAttribute AS ua 
		INNER JOIN OH_CP_ClinicalPortal.dbo.cUser AS u ON ua.cUser = u.uniqueId
	WHERE(ua.protected = 1) AND (ua.name = ''ACTPAS Password'')
	UNION
	SELECT u.name AS userId, ua.name AS propertyName, ua.cValue AS value
	FROM OH_CP_ClinicalPortal.dbo.UserAttribute AS ua 
		INNER JOIN OH_CP_ClinicalPortal.dbo.cUser AS u ON ua.cUser = u.uniqueId
	WHERE(ua.name = ''ACTPAS User Name'')
) as pass
PIVOT
( MAX(pass.value) FOR pass.propertyName in ([ACTPAS User name],[ACTPAS Password]) ) as passUserView
'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'ACTPAS_Password_UserAttributes', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ua"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "u"
            Begin Extent = 
               Top = 6
               Left = 236
               Bottom = 125
               Right = 466
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ACTPAS_Password_UserAttributes'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'ACTPAS_Password_UserAttributes', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ACTPAS_Password_UserAttributes'
GO
/****** Object:  View [dbo].[vw_wic_WICDMALIST]    Script Date: 06/17/2015 14:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_wic_WICDMALIST]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[vw_wic_WICDMALIST] AS SELECT * FROM (
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_#5GA9	 REASON, UD_SD_Disposition_KK1NZ	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAHrtbrnPrgnnt_PFJ7L	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_#641G	 REASON, UD_SD_Disposition_ZXOF5	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WIC#DMA#HipNonInjury_51PT1	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_#68WF	 REASON, UD_SD_Disposition_X2#G3	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMADzznssVrtg_$HE6Y	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_#6B3E	 REASON, UD_SD_Disposition_H$LOU	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDCstSplnPrbl_051TK	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_#7E0#	 REASON, UD_SD_Disposition_$CAYW	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAUrnryIncntnnc_ZD6W8	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_#EAN7	 REASON, UD_SD_Disposition_92PIG	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDVgSyBfPb_OM0Y6	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_#ENEQ	 REASON, UD_SD_Disposition_KWS#P	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAUrnrySymptmsFml_I##LD	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_#Q8JM	 REASON, UD_SD_Disposition_88#HR	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAUrnSymPrsPrb_NFY$I	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_#RBI2	 REASON, UD_SD_Disposition_D27EP	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMABtsStngInscSpdr_8ZPT4	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_#UD9I	 REASON, UD_SD_Disposition_Q#4$U	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDSbstncAbs_$N95K	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_$$R1Q	 REASON, UD_SD_Disposition_LQBK$	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDEyAllrgy_RCOG1	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_$CBI5	 REASON, UD_SD_Disposition_BR5OL	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAUtrnPrlpDgnsInf_IQL6S	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_$FFQ7	 REASON, UD_SD_Disposition_PFA15	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WIC#DMA#AdultFever_KELPP	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_$J7P2	 REASON, UD_SD_Disposition_Y58QJ	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMASlfHrmBhvr_DDB$N	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_$KWN3	 REASON, UD_SD_Disposition_#B2FM	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDUrntnPnMl_$57AA	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_$LJOS	 REASON, UD_SD_Disposition_QE0W1	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDTrmChst_T3O$6	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_$QQ44	 REASON, UD_SD_Disposition_W58SN	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDVmttngBld_W1T3U	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_$TOYT	 REASON, UD_SD_Disposition_PIUEA	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDAthltsFt_5Z17O	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_$XYXO	 REASON, UD_SD_Disposition_Z8H45	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAUprLwrBckSymptm_O2ALV	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_0$S04	 REASON, UD_SD_Disposition_QJE76	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMATTnlNnInjry_085Z9	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_03$ED	 REASON, UD_SD_Disposition_Q4#G#	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMASxlAssltRp_CEHX2	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_04CVF	 REASON, UD_SD_Disposition_5MWHD	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WIC#DMA#PAED#Colds_PZ4ED	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_09C6W	 REASON, UD_SD_Disposition_WROQB	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WIC#DMA#ThighInjury_WS#$E	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_0C0OQ	 REASON, UD_SD_Disposition_O#DZM	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAHpttsKnwnSspctd_#55OD	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_0FVR6	 REASON, UD_SD_Disposition_BSY0$	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDCldSrs_NRDIC	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_0UBKR	 REASON, UD_SD_Disposition_JC5TG	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDErFrgnBdy_PH7GI	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_1#LY2	 REASON, UD_SD_Disposition_84926	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WIC#DMA#HandInjury_0ORPG	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_13#G3	 REASON, UD_SD_Disposition_SWICW	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAVgnBldMrTwnWks_PH$C5	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_17SLD	 REASON, UD_SD_Disposition_3JBNE	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAUpprArmInjry_BI7AS	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_1EGFT	 REASON, UD_SD_Disposition_L8FEF	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDEtnDsrPrb_I#FFO	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_1H72Q	 REASON, UD_SD_Disposition_760L0	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAChstPn8Hrs_6IGJE	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_1I0Y8	 REASON, UD_SD_Disposition_WQAHT	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDAgAnBhDs_QNIFU	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_1IODD	 REASON, UD_SD_Disposition_Y7$ZL	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMANsAndVmtng_N#C9V	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_2#1EO	 REASON, UD_SD_Disposition_JP7SN	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDHtInjrs_G8MSY	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_20OBA	 REASON, UD_SD_Disposition_ODQ45	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAErPnFrgnBdy_NVTLV	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_22VAR	 REASON, UD_SD_Disposition_SFQFA	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDStlUnsClrOf_O4ZKV	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_23VQ8	 REASON, UD_SD_Disposition_Q7EF$	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WIC#DMA#PAED#BackPain_#D$K0	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_24IH3	 REASON, UD_SD_Disposition_CYU2N	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDUmblCrdOzng_MUXIK	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_28SW$	 REASON, UD_SD_Disposition_U$GTD	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAAllrgcRctnSvr_#F330	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_2GEFS	 REASON, UD_SD_Disposition_7YLNX	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WIC#DMA#FlankPain_GGVLT	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_2PHWX	 REASON, UD_SD_Disposition_26XZY	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WIC#DMA#KneeNonInjury_UKQIM	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_2QIYG	 REASON, UD_SD_Disposition_H4YR1	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDEyWthPsBctr_H#MXV	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_2RV1M	 REASON, UD_SD_Disposition_YO$JR	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMABrstSymptmsFml_LJL$7	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_2WOYI	 REASON, UD_SD_Disposition_G5S8S	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDChcknpx_BJ844	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_3#0XV	 REASON, UD_SD_Disposition_59GD6	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMABrthngPrblms_SXJ7G	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_30KFY	 REASON, UD_SD_Disposition_Y5ZET	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WIC#DMA#PAED#Fainting_1YFED	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_347CZ	 REASON, UD_SD_Disposition_01E85	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAAnxtyMldTMdrt_580P#	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_35O0C	 REASON, UD_SD_Disposition_RM23D	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPrgCntrSympInf_PMYMT	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_35XRM	 REASON, UD_SD_Disposition_R9S#W	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDTrmAbdmnl_LKM5T	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_3HWTJ	 REASON, UD_SD_Disposition_X3CBY	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WIC#DMA#Fatigue_NOI5E	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_3J#2Y	 REASON, UD_SD_Disposition_SZ1F2	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WIC#DMA#GIBleeding_1AH71	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_3NSND	 REASON, UD_SD_Disposition_685B6	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WIC#DMA#PAED#Diabetes_H2579	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_3R9XW	 REASON, UD_SD_Disposition_PPWCU	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAUprRsprTrctInfc_T#WIO	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_3V3A#	 REASON, UD_SD_Disposition_BUTDR	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WIC#DMA#ForearmInjury_Q4I#4	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_3YESE	 REASON, UD_SD_Disposition_DZNE7	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAEtngDsrdrPrblm_WHP3P	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_4#ZM7	 REASON, UD_SD_Disposition_TM$C4	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAAnklNnInjry_3HV1#	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_43FO7	 REASON, UD_SD_Disposition_0O9O1	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WIC#DMA#HandNonInjury_9OYRD	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_47CFZ	 REASON, UD_SD_Disposition_3SA6U	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMACgntvImprmEldrl_TSOGG	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_49QJB	 REASON, UD_SD_Disposition_E#RV1	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDHrsnss_S#3E$	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_4F5#G	 REASON, UD_SD_Disposition_I1OR6	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMABtsRdbckSpdr_XR9IZ	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_4IZA6	 REASON, UD_SD_Disposition_X0WGI	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WIC#DMA#PAED#Worms_8BNSB	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_4KUVM	 REASON, UD_SD_Disposition_NHPW$	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAEyOthrPrblms_RWIC3	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_4QI8Y	 REASON, UD_SD_Disposition_67GET	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WIC#DMA#HeatExposure_PBILV	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_4VL56	 REASON, UD_SD_Disposition_#X20$	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WIC#DMA#PAED#Rashes_R0$X2	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_4XO2P	 REASON, UD_SD_Disposition_SR3VT	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDStThFlUpCl_Z1UMJ	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_5#$3J	 REASON, UD_SD_Disposition_MRKUS	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMASbstAbsDgnsSspc_CAQV#	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_5$OIX	 REASON, UD_SD_Disposition_55HP9	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDHpttsAExpsr_34TTI	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_52C1T	 REASON, UD_SD_Disposition_6ZHA3	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDDrhOnAntbtc_GXI6E	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_5F$1R	 REASON, UD_SD_Disposition_V99MO	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDErInFlUpCl_#ML8H	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_5FP4N	 REASON, UD_SD_Disposition_G3JYC	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WIC#DMA#Depression_GOP5F	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_5JPS2	 REASON, UD_SD_Disposition_ZH7O2	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDTrmNs_L29JH	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_5KC0B	 REASON, UD_SD_Disposition_5VDPY	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDSnsPnAndCng_M3APS	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_5YL#K	 REASON, UD_SD_Disposition_7TNPY	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAShldrInjry_BGJ5U	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_60UD6	 REASON, UD_SD_Disposition_0051B	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDStrQstns_YSOHT	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_6GVB8	 REASON, UD_SD_Disposition_O45YI	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WIC#DMA#WeightLoss_HYDUV	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_6JIBO	 REASON, UD_SD_Disposition_4X927	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WIC#DMA#Seizure_VX0HY	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_6NOKZ	 REASON, UD_SD_Disposition_YMM9T	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WIC#DMA#FootInjury_XBBE7	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_6RSIC	 REASON, UD_SD_Disposition_BRAB8	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAFtlMvmnt_RZAI4	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_6V6HC	 REASON, UD_SD_Disposition_DRNQ8	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDErCngstn_ECZXU	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_7577O	 REASON, UD_SD_Disposition_I3XGQ	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDCrdlCp_B5I3P	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_76YDN	 REASON, UD_SD_Disposition_MJD2H	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDFldIntkDcrs_T4YVB	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_79459	 REASON, UD_SD_Disposition_M4ZF1	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMACrbnMnxdExpsr_J5B25	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_7FNM2	 REASON, UD_SD_Disposition_MJ#VC	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WIC#DMA#PAED#Cough_U#PNV	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_7IM2T	 REASON, UD_SD_Disposition_0GER3	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAFfthDsKnwnSspct_BQNHN	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_7IQEC	 REASON, UD_SD_Disposition_CFDSB	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDTrmGntlMl_T0FA2	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_7K0#E	 REASON, UD_SD_Disposition_EQ7WT	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDSOGSPM_KCESY	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_7KMFQ	 REASON, UD_SD_Disposition_KA83B	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAEyInjUVLghExp_7M4XU	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_7MP$G	 REASON, UD_SD_Disposition_$S3ZJ	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WIC#DMA#PAED#Thrush_EGYL3	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_7OADX	 REASON, UD_SD_Disposition_HU3C9	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMADbtsGIPrblms_83XA7	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_7PLS#	 REASON, UD_SD_Disposition_BD7UK	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDSwlwnDfclt_387B8	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_7Q02D	 REASON, UD_SD_Disposition_EMV$T	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDElctrcShck_3W9S6	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_7S4FE	 REASON, UD_SD_Disposition_LJSYS	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDSlpIncrsd_EE5O$	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_7UVN0	 REASON, UD_SD_Disposition_02ZEO	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAHnFtMtDsKnSs_B#3UY	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_7WRNB	 REASON, UD_SD_Disposition_7RH2V	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WIC#DMA#GenitalHerpes_VU0HT	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_8#6T2	 REASON, UD_SD_Disposition_9SQ4F	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDChstPn_Q3A0M	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_8$ASG	 REASON, UD_SD_Disposition_50B4M	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WIC#DMA#Falls_QPHPB	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_871IL	 REASON, UD_SD_Disposition_RX2TU	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WIC#DMA#HairLoss_$W3P6	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_88FJW	 REASON, UD_SD_Disposition_FDKYG	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDVsnLssChng_KL1EX	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_88KF1	 REASON, UD_SD_Disposition_FQ919	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAFlSymptmsPrgnnt_53HAF	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_8BCT2	 REASON, UD_SD_Disposition_UV4MZ	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WIC#DMA#ElbowInjury_FGD48	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_8FK6B	 REASON, UD_SD_Disposition_OC3U4	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPbcLcKnwnSspctd_Q0CWO	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_8R6G7	 REASON, UD_SD_Disposition_A1ALM	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAChstPnDscmfrt_EATRX	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_92J26	 REASON, UD_SD_Disposition_ZQLLR	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMADbtsOtOfCntrl_S03YA	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_92R$A	 REASON, UD_SD_Disposition_HI0A$	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WIC#DMA#PAED#Sunburn_MBW20	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_92U$O	 REASON, UD_SD_Disposition_EGKN4	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMASzrPrgnnt_$IIAK	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_988XP	 REASON, UD_SD_Disposition_GUPIS	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAWrstNnInjry_8CIQ8	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_9BYC1	 REASON, UD_SD_Disposition_BS3KZ	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WIC#DMA#PAED#Vomiting_82JO2	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_9GBXV	 REASON, UD_SD_Disposition_AQALR	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDFcSwllngOf_AA0Z3	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_9K06X	 REASON, UD_SD_Disposition_5C3LM	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAEmrgncCntrcpInf_MMWJX	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_9OFLY	 REASON, UD_SD_Disposition_94Q46	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDAbdmnlPnFml_NDRC3	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_9Q5HS	 REASON, UD_SD_Disposition_J50O5	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDAsthmAttck_$JLN0	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_9SAXG	 REASON, UD_SD_Disposition_RGPOA	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDAbdmnlPnMl_BG0E#	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_9YCR6	 REASON, UD_SD_Disposition_TR006	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAVgnFrgBdyKnwSsp_X4CSF	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_A##82	 REASON, UD_SD_Disposition_SD548	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMASrThrtHrsnss_IDXO#	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_AAE9F	 REASON, UD_SD_Disposition_CHWYR	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WIC#DMA#HipInjury_76Q7C	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_AB23M	 REASON, UD_SD_Disposition_0G$F3	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAStrQstns_KDRKK	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_ADMON	 REASON, UD_SD_Disposition_8I7#M	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDImnstnRctns_7VAWK	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_AGOEU	 REASON, UD_SD_Disposition_Y7Q4E	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WIC#DMA#PAED#ArmPain_#KINR	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_AJ9RO	 REASON, UD_SD_Disposition_8IHDS	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WIC#DMA#ComaStupor_S1WTD	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_ALF0T	 REASON, UD_SD_Disposition_9NX25	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAFrrmNnInjry_HV0L3	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_AM8FS	 REASON, UD_SD_Disposition_P9GON	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WIC#DMA#TickBite_F21AM	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_AURTJ	 REASON, UD_SD_Disposition_Q7U$H	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAFrsknRtrctPrblm_5VPC5	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_B2$NB	 REASON, UD_SD_Disposition_2S1ZB	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDHrnIngnl_3O3#4	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_B78NE	 REASON, UD_SD_Disposition_YX$5R	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPstprtvPrblms_FV#2O	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_BC$Y4	 REASON, UD_SD_Disposition_EKQ0D	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDErSwmmrs_0VLNS	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_BFDH5	 REASON, UD_SD_Disposition_I9X1O	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAUprRspTrcInfPrg_8AJKE	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_BG7IA	 REASON, UD_SD_Disposition_6SUVY	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDTrmTth_$0CYW	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_BIG88	 REASON, UD_SD_Disposition_#ETN3	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WIC#DMA#ToothGumJaw_5FLD$	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_BTBGW	 REASON, UD_SD_Disposition_$X4B6	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDCldExpsr_2M2O0	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_C#5WF	 REASON, UD_SD_Disposition_X3OG3	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAAthltsFtKnwn_O1I5N	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_C7UMT	 REASON, UD_SD_Disposition_6D1CQ	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDEyDrkCrcUnd_GNS89	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_C806J	 REASON, UD_SD_Disposition_AAD5K	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WIC#DMA#Amenorrhoea_7DQWC	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_CG#G4	 REASON, UD_SD_Disposition_N81DG	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDFfthDss_82J$X	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_CMT8P	 REASON, UD_SD_Disposition_16H5W	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDChInFrBd_UYPT7	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_CNE59	 REASON, UD_SD_Disposition_$LD$$	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMASknRshPrgnnt_2L3HI	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_D55AI	 REASON, UD_SD_Disposition_H6K73	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDUrntnPnFml_6DD8Q	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_DBS#1	 REASON, UD_SD_Disposition_#HOHL	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMABtsAnmlHmn_53FSR	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_DL8TI	 REASON, UD_SD_Disposition_YML05	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WIC#DMA#PAED#Burns_O21EJ	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_DMI4X	 REASON, UD_SD_Disposition_SZ0VD	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAGntlLsnsFml_#O903	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_DXENY	 REASON, UD_SD_Disposition_CJ1WO	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WIC#DMA#Tremor_IV0PN	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_E2QN0	 REASON, UD_SD_Disposition_WDOO3	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WIC#DMA#PAED#Earache_$0GOT	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_ECHUX	 REASON, UD_SD_Disposition_12UH7	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDArmJntSwlOf_N$ANG	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_ED05Z	 REASON, UD_SD_Disposition_PYAX5	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAAlrgsHyFvrSympt_7XH9F	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_EF0A#	 REASON, UD_SD_Disposition_NIFY$	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAUpprArmNnInjry_OJJQP	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_EIBZU	 REASON, UD_SD_Disposition_GJJ2Y	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDBtAnmlHmn_S8EOT	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_EK62E	 REASON, UD_SD_Disposition_QT89L	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WIC#DMA#AbdominalPain_ZA9#M	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_EZ5FR	 REASON, UD_SD_Disposition_UQQ0C	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAAbrtLsThn20Thrt_13HH7	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_F35M3	 REASON, UD_SD_Disposition_07ZXZ	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDEySwllngOf_B1WUA	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_F6VZ7	 REASON, UD_SD_Disposition_#CPXM	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAScdlHmcdlBhvr_3Z2QL	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_FM041	 REASON, UD_SD_Disposition_CD0Q3	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAThghNnInjry_F5L4M	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_FOP$3	 REASON, UD_SD_Disposition_LJSXU	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAVgnlDschrg_J6DJA	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_GG1AL	 REASON, UD_SD_Disposition_2Z0YP	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WIC#DMA#PAED#Croup_57VGO	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_GGYDN	 REASON, UD_SD_Disposition_#MV09	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WIC#DMA#AsthmaAttack_R078Y	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_GMBNT	 REASON, UD_SD_Disposition_AJY$W	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMASnbrnLkRsh_G#W3Z	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_GMDXQ	 REASON, UD_SD_Disposition_#BSLZ	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDUrUnClOd_ZYD7N	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_GMNK1	 REASON, UD_SD_Disposition_0UKDY	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAAbrLcrPncWnd_OGG$H	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_GN#HU	 REASON, UD_SD_Disposition_T4V1Y	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WIC#DMA#KneeInjury_N9VHP	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_GOGY0	 REASON, UD_SD_Disposition_Z9#XO	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WIC#DMA#SignsOfLabour_Z93##	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_GOXGL	 REASON, UD_SD_Disposition_SCDUQ	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPstprtCmnPrblms_BCCKL	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_GPR8I	 REASON, UD_SD_Disposition_K0YSX	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAFlLkSymptms_78$KG	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_GRTGN	 REASON, UD_SD_Disposition_10FDK	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMADbtsPrgnnt_QR8HM	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_GTS38	 REASON, UD_SD_Disposition_4L3CF	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMACnstpRctlSympt_KO$BD	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_GXCSK	 REASON, UD_SD_Disposition_MVNYE	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMACntctLnsPrblms_RX4ZE	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_H0Y08	 REASON, UD_SD_Disposition_M0EJZ	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAShldrNnInjry_XX9HS	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_HCW81	 REASON, UD_SD_Disposition_8WZF$	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDUrnBldIn_KM01A	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_HCWCD	 REASON, UD_SD_Disposition_#91JB	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDChrncDss_KX9KC	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_HFOSC	 REASON, UD_SD_Disposition_IZNKZ	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WIC#DMA#PAED#Headache_M09CF	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_HVZG9	 REASON, UD_SD_Disposition_BF#39	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDBtStInSp_XGJSK	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_HYMXV	 REASON, UD_SD_Disposition_$1T4W	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WIC#DMA#PAED#TickBite_14BU#	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_HYO7E	 REASON, UD_SD_Disposition_C3#FY	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WIC#DMA#PAED#Fever_42K93	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_HZ$X4	 REASON, UD_SD_Disposition_WN839	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WIC#DMA#Fainting_AN7Q3	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_I1I8S	 REASON, UD_SD_Disposition_OR7ZG	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WIC#DMA#PAED#Weakness_V9$YI	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_IN7Y9	 REASON, UD_SD_Disposition_VL6$Q	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDTrmArm_2MP7N	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_IX#QM	 REASON, UD_SD_Disposition_CTAND	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDAnphylxs_3N3SY	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_IXHWS	 REASON, UD_SD_Disposition_80$BO	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDSzrWthtFvr_PGHX6	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_JD$YR	 REASON, UD_SD_Disposition_4Q0NX	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDTrmEy_KVHOB	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_JIL75	 REASON, UD_SD_Disposition_4PWQ8	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDTrmFc_KI3GX	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_JU$HH	 REASON, UD_SD_Disposition_8EQ2Y	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAAbPnPrMrTh20Wk_40DCN	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_JUJKZ	 REASON, UD_SD_Disposition_Y52BT	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAChcknKnwnSspct_D5I$1	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_JZ8ZL	 REASON, UD_SD_Disposition_GC816	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMATrmPrgnnt_$KO1F	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_KACO7	 REASON, UD_SD_Disposition_WKUVH	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WIC#DMA#PAED#Bruises_K4NLT	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_KAKSK	 REASON, UD_SD_Disposition_ZE$UH	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WIC#DMA#HeadInjury_EPMI5	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_KDFZ7	 REASON, UD_SD_Disposition_DVQRW	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WIC#DMA#Bruises_AYJPU	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_KQEMK	 REASON, UD_SD_Disposition_F3BYI	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAAntntlTstng_Q2B#H	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_KXWUZ	 REASON, UD_SD_Disposition_X88PL	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDHrngLss_40L8P	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_KYMZR	 REASON, UD_SD_Disposition_3EJ52	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDErDschrg_2H34E	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_LCO9O	 REASON, UD_SD_Disposition_TV5UM	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WIC#DMA#ChestInjury_P1KS2	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_LD5XO	 REASON, UD_SD_Disposition_H40RA	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WIC#DMA#BloodyUrine_T#91A	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_LL84A	 REASON, UD_SD_Disposition_8W$9Y	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDUmCrDlSp_HSKWN	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_LNBQ5	 REASON, UD_SD_Disposition_B9VEQ	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDSprGlExpsr_G6A#Y	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_M41#U	 REASON, UD_SD_Disposition_OLV91	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDCryngChld_39VGH	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_M76F7	 REASON, UD_SD_Disposition_Q5262	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WIC#DMA#CoughAdult_PV5TP	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_MJP8B	 REASON, UD_SD_Disposition_J#LZX	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDUmblclHrn_DKCT7	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_MSAKH	 REASON, UD_SD_Disposition_GCCG#	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDVgnItcIrt_ESTGJ	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_MTYKF	 REASON, UD_SD_Disposition_5AHQ5	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDHndFtMthDss_BG70D	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_N$7L9	 REASON, UD_SD_Disposition_$61K9	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAAbrtnThrptElctv_O31U1	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_N9A9O	 REASON, UD_SD_Disposition_IWRMG	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDSwlwFrgnBdy_$Q5DZ	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_NBO#R	 REASON, UD_SD_Disposition_B$KUB	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAFngrFngrnlInjry_DM273	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_NCN8$	 REASON, UD_SD_Disposition_C1MKO	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDAnsSymptms_$OB1Z	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_NJ#0A	 REASON, UD_SD_Disposition_H4STA	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMARtrnFrmMdclImgn_CIWKH	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_NS8HU	 REASON, UD_SD_Disposition_3IRZS	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAVgnBldPrMnAbn_NETO8	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_NWN00	 REASON, UD_SD_Disposition_O1IC7	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDTrmT_C922J	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_O1M96	 REASON, UD_SD_Disposition_9L7MM	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDChmclInThEy_0GMV6	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_O6ZEX	 REASON, UD_SD_Disposition_PV5Z5	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAEndmtKnwnSspct_X6KPN	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_O98DQ	 REASON, UD_SD_Disposition_UH#YT	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAHyprtKnwnSspct_4OYYM	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_ON$MU	 REASON, UD_SD_Disposition_E1X8R	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAFngrFngrNnInjr_YJP#5	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_ONOA$	 REASON, UD_SD_Disposition_2SRN6	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMABckSymptmsPrgnt_9STR2	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_OO1YK	 REASON, UD_SD_Disposition_5ETLF	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WIC#DMA#ElectricShock_Z5L9V	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_OXB2H	 REASON, UD_SD_Disposition_ZY3OO	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDTrmBck_T1CGE	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_P#VFZ	 REASON, UD_SD_Disposition_NTTFW	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMASprGlExpsr_T#58E	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_P16WV	 REASON, UD_SD_Disposition_ZPY#X	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDTrmTlbn_1Q#P0	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_P6#SZ	 REASON, UD_SD_Disposition_0XSE9	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDUmblCrdBldn_5T8J2	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_P7JK4	 REASON, UD_SD_Disposition_5MSHY	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WIC#DMA#Hiccups_JNOBB	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_PA2#8	 REASON, UD_SD_Disposition_O6WYA	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMADprssnPstNtl_73HXJ	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_PAJ6E	 REASON, UD_SD_Disposition_EJVBM	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WIC#DMA#PAED#HayFever_GW#D1	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_PJZQI	 REASON, UD_SD_Disposition_ZAAE6	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDEyRdWthtPs_NXFII	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_PXEEG	 REASON, UD_SD_Disposition_X$AR1	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDCnfsnDlrm_O68SH	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_Q#TVL	 REASON, UD_SD_Disposition_IB31F	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDBtsSnk_04A9I	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_Q0$Q#	 REASON, UD_SD_Disposition_RF8Q1	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDTrmNck_PS24E	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_Q6POT	 REASON, UD_SD_Disposition_R0972	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMACnfsnDsrntnAgtn_4EQQV	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_Q7V1Z	 REASON, UD_SD_Disposition_AVG1J	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WIC#DMA#ColdSores_BL$G1	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_QBSFE	 REASON, UD_SD_Disposition_ONMLG	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDSzrWthFvr_T541W	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_QCSRN	 REASON, UD_SD_Disposition_WF3VY	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDFntnllBlgng_9MJ83	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_QGJ04	 REASON, UD_SD_Disposition_YQXNA	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDTrmLg_0IIP$	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_QR24W	 REASON, UD_SD_Disposition_Y5A7L	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMARshsHvsErptns_$2$F6	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_R4HTY	 REASON, UD_SD_Disposition_CXBGO	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMABrstSymptPstpr_RQJDF	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_R71N#	 REASON, UD_SD_Disposition_2#RLO	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDNwPnBrUr_S69LF	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_RBVLA	 REASON, UD_SD_Disposition_W42K9	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDSrThrt_HFL2X	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_RL83H	 REASON, UD_SD_Disposition_O30GF	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDBlshSknCyns_ANHIT	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_RMX0V	 REASON, UD_SD_Disposition_4BZ71	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDBtAnStMrLf_S87KF	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_RMYY2	 REASON, UD_SD_Disposition_N7O$K	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDFrgnBdySkn_YZ#MT	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_RQC07	 REASON, UD_SD_Disposition_TFHVF	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMASwllwngDffclty_0NCYH	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_RQEHI	 REASON, UD_SD_Disposition_XTN0Q	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WIC#DMA#Headache_JX4CM	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_S0$E#	 REASON, UD_SD_Disposition_YDLMZ	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WIC#DMA#PAED#BeeSting_XPDH3	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_S1933	 REASON, UD_SD_Disposition_$X3ZH	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WIC#DMA#SleepDisorder_D0PO3	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_S93B4	 REASON, UD_SD_Disposition_S#$VE	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WIC#DMA#PAED#Sores_A93QY	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_SC8JR	 REASON, UD_SD_Disposition_MLAH9	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAWknssPrlyss_JM4HS	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_SD0YX	 REASON, UD_SD_Disposition_NKLNI	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WIC#DMA#BitesSnake_TAWMO	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_SK6LG	 REASON, UD_SD_Disposition_QNJMH	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDWndInfctn_B8GGG	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_SKKWR	 REASON, UD_SD_Disposition_GXLA5	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMABrstDsrdrsMl_JWLF7	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_SOHIK	 REASON, UD_SD_Disposition_NGD3X	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDTthch_O51TT	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_SXSY1	 REASON, UD_SD_Disposition_R55IM	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDWhOtThAs_W5NF#	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_SZTVU	 REASON, UD_SD_Disposition_S8KDC	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDVmWhTkMd_229P2	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_T#K#T	 REASON, UD_SD_Disposition_3GESG	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDHydrcl_EU9FP	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_T0BQL	 REASON, UD_SD_Disposition_C1B4Q	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAAnxtySvrPnc_SQ1XP	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_T4I3J	 REASON, UD_SD_Disposition_E1SGS	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WIC#DMA#PAED#Stye_IH6SM	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_T4V4D	 REASON, UD_SD_Disposition_PRA4V	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAImmnstnRctn_C3K31	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_TEALF	 REASON, UD_SD_Disposition_LFX8P	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDRshWdsOnDrg_NY9A8	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_TOROT	 REASON, UD_SD_Disposition_AAJ5A	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMACstSplntPrblm_80KRZ	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_TUZCF	 REASON, UD_SD_Disposition_73CS#	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAAbdmnlInjry_EO8J0	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_U0A56	 REASON, UD_SD_Disposition_2UO4T	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMASwllwdFrgnBdy_UPCYC	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_U2AE5	 REASON, UD_SD_Disposition_UYN##	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDAbLcBtPn_VRTU7	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_UDCZ$	 REASON, UD_SD_Disposition_HNDOE	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDBrthHldnSpl_$ZF2K	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_UF$LL	 REASON, UD_SD_Disposition_L7ZW$	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WIC#DMA#WristInjury_J6A91	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_UMUJV	 REASON, UD_SD_Disposition_GIKOI	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDSknSwllngOf_AMR#C	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_UNQLP	 REASON, UD_SD_Disposition_NUH#3	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAVrsPstPrcSxPrg_$PN0R	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_UW5W3	 REASON, UD_SD_Disposition_6G0YN	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDCnstptn_$HTHQ	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_V0PKR	 REASON, UD_SD_Disposition_0U1UB	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDFrstCldInjr_$XXSR	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_V2H4K	 REASON, UD_SD_Disposition_$3QKA	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDVgnFrgnBdy_PR$IP	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_V3AFH	 REASON, UD_SD_Disposition_0ZWW#	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDBrstfdQstns_OK5F7	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_V4GAQ	 REASON, UD_SD_Disposition_XKNZJ	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAEctpPrgKnwnSspc_AJF7$	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_V5Y7Y	 REASON, UD_SD_Disposition_CE04A	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WIC#DMA#ColdExposure_VMOLD	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_V8Q2I	 REASON, UD_SD_Disposition_L1$JN	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDCrckdSkn_BO1IB	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_V9SJL	 REASON, UD_SD_Disposition_8FLVQ	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDScdCncrns_W$KU9	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_VABYD	 REASON, UD_SD_Disposition_FLGOU	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMABtsStngsMrnLf_3PVKO	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_VBHIC	 REASON, UD_SD_Disposition_E7UOR	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDTrmEr_M4OLN	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_VQOHL	 REASON, UD_SD_Disposition_XLNSW	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAElbwNnInjry_0RIHG	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_VQX7D	 REASON, UD_SD_Disposition_NFD5O	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMADbtsFtPrblms_1A4QV	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_VZLP6	 REASON, UD_SD_Disposition_R0Y6#	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WIC#DMA#Dehydration_X9AFQ	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_W3#5Z	 REASON, UD_SD_Disposition_YCM11	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAVgnlBldng_#TS5P	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_W5TLC	 REASON, UD_SD_Disposition_67M3N	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMANsVmtngPrgnnt_EZTG4	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_W6J3Y	 REASON, UD_SD_Disposition_OBDR5	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDVgSyAfPb_9$K1$	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_WDVWX	 REASON, UD_SD_Disposition_IZ1EN	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDDrrh_9RYSF	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_WO7#G	 REASON, UD_SD_Disposition_KP4TQ	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDDzznss_FIOHV	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_WOLGQ	 REASON, UD_SD_Disposition_HE4RL	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAWndInfctn_JEMZ9	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_WPSB9	 REASON, UD_SD_Disposition_2EHQK	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDFtrAnkSwlOf_OIZF2	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_WUD37	 REASON, UD_SD_Disposition_C9Y26	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAEyInfctnIrrttn_3EYKM	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_X#XPP	 REASON, UD_SD_Disposition_9QWKK	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAWthdrwlSymptms_5BP5C	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_X$1LJ	 REASON, UD_SD_Disposition_4QK55	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAErHrngSymptms_H6G5X	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_X$OVF	 REASON, UD_SD_Disposition_8JS#Q	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDUrntnWttng_VPGZI	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_X12BL	 REASON, UD_SD_Disposition_O17CF	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMASxlDsrdrs_ZCTZ0	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_XG0UE	 REASON, UD_SD_Disposition_GS0Z9	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WIC#DMA#PAED#Hives_E9QK6	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_XHV##	 REASON, UD_SD_Disposition_HZD0G	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDTrmMth_P51V0	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_XI8NO	 REASON, UD_SD_Disposition_19B$J	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDFlrOnAntbtc_O6KJR	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_XMQ7I	 REASON, UD_SD_Disposition_52UB7	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAVcImnglblnAdmn_L#REL	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_XRMGW	 REASON, UD_SD_Disposition_1#B8U	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDTrDctBlckd_CO7MX	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_XW#7K	 REASON, UD_SD_Disposition_SCAHQ	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDVgBlAfPb_LJ9#P	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_Y0MR#	 REASON, UD_SD_Disposition_90G42	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAChmclInThEy_6OY1P	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_Y22RN	 REASON, UD_SD_Disposition_GNGOH	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAFcPnSwlngNInjry_W4N5F	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_Y37OJ	 REASON, UD_SD_Disposition_DXRY4	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WIC#DMA#Dysmenorrhoea_0ZBHU	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_Y98B#	 REASON, UD_SD_Disposition_8L#96	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDBlstrsFtHnd_MXG$Y	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_Y9QQN	 REASON, UD_SD_Disposition_PAYSJ	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WIC#DMA#Burns_3Z13X	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_YN043	 REASON, UD_SD_Disposition_UBIBP	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDTrmGntlFml_5KBL2	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_YOFH9	 REASON, UD_SD_Disposition_1#QGM	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDEyFrgnBdyIn_OVU2H	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_YYOSV	 REASON, UD_SD_Disposition_3GLEF	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WIC#DMA#PAED#Teething_N94C2	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_Z$8DB	 REASON, UD_SD_Disposition_AFJ1V	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDVgBlBfPb_SD2L0	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_Z5#IS	 REASON, UD_SD_Disposition_7AW$K	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WIC#DMA#FootNonInjury_HK5S9	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_Z9JP#	 REASON, UD_SD_Disposition_DKWBQ	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDErPllngAt_YH2MN	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_ZFJT5	 REASON, UD_SD_Disposition_IWB#C	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMADbtsRspPrblms_3YEDK	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_ZFKR5	 REASON, UD_SD_Disposition_A8NYV	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WIC#DMA#EyeCondition_$KEPZ	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_ZIB7G	 REASON, UD_SD_Disposition_UM37X	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAHprtnDgnsdPrgnt_0JI2S	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_ZO5J2	 REASON, UD_SD_Disposition_ZQ2IX	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMATTnlInjry_YZO5E	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_ZW$##	 REASON, UD_SD_Disposition_HU06M	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAActAlchlIntxctn_AVEDG	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_ZW1SN	 REASON, UD_SD_Disposition_NV$UF	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WIC#DMA#AnkleInjury_ZJGUH	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_ZW9IR	 REASON, UD_SD_Disposition_3ZUWB	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMADbtChnInBwlHbt_VI0G5	UNION
	SELECT DOCUMENTID AS DOCUMENTID,	UD_Reason_ZYGDU	 REASON, UD_SD_Disposition_VROT$	 AS DISPOSITION FROM OH_CM_cRepository.dbo.V2_WICDMAPAEDTrmHd_VYTAC	
) AS  dmalist
WHERE dmalist.reason is not null and dmalist.disposition is not null
	
	
'
GO
/****** Object:  View [dbo].[vw_wic_get_DMA_results]    Script Date: 06/17/2015 14:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_wic_get_DMA_results]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[vw_wic_get_DMA_results]
AS
SELECT
DOCUMENTID
,UD_DspstnUsd_SINJX_cde AS CODE
,UD_SD_Disposition_QT89L AS DISPOSITION
,UD_Reason_EK62E AS REASON
,RecommendedDisposition_BNUDU AS RECOMENDED
,AppliedDisposition_Q77SQ AS APPLIED
FROM
OH_CM_cRepository.dbo.v2_WIC#DMA#AbdominalPain_ZA9#M
UNION ALL
SELECT
DOCUMENTID
,UD_DspstnUsd_RWGP7_cde AS CODE
,UD_SD_Disposition_PFA15 AS DISPOSITION
,UD_Reason_$FFQ7 AS REASON
,RecommendedDisposition_ZHJ$8 AS RECOMENDED
,AppliedDisposition_5FN9M AS APPLIED
FROM
OH_CM_cRepository.dbo.v2_WIC#DMA#AdultFever_KELPP
UNION ALL
SELECT
DOCUMENTID
,UD_DspstnUsd_68DHF_cde AS CODE
,UD_SD_Disposition_AAD5K AS DISPOSITION
,UD_Reason_C806J AS REASON
,RecommendedDisposition_G3V41 AS RECOMENDED
,AppliedDisposition_EV37H AS APPLIED
FROM
OH_CM_cRepository.dbo.v2_WIC#DMA#Amenorrhoea_7DQWC
UNION ALL
SELECT
DOCUMENTID
,UD_DspstnUsd_GKZJ3_cde AS CODE
,UD_SD_Disposition_NV$UF AS DISPOSITION
,UD_Reason_ZW1SN AS REASON
,RecommendedDisposition_MHQUF AS RECOMENDED
,AppliedDisposition_534U3 AS APPLIED
FROM
OH_CM_cRepository.dbo.v2_WIC#DMA#AnkleInjury_ZJGUH
UNION ALL
SELECT
DOCUMENTID
,ai.UD_DspstnUsd_XA198_cde AS CODE
,ai.UD_SD_Disposition_73CS# AS DISPOSITION
,ai.UD_Reason_TUZCF AS REASON
,ai.RecommendedDisposition_SMZSA AS RECOMENDED
,ai.AppliedDisposition_LAEFQ AS APPLIED
FROM
OH_CM_cRepository.dbo.v2_WICDMAAbdmnlInjry_EO8J0 ai

'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'vw_wic_get_DMA_results', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_wic_get_DMA_results'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'vw_wic_get_DMA_results', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_wic_get_DMA_results'
GO
/****** Object:  View [dbo].[vw_pathwayEnrollment]    Script Date: 06/17/2015 14:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_pathwayEnrollment]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vw_pathwayEnrollment] as
/*
View [dbo].[vw_pathwayEnrollment]
[Description] Retreives all pathway enrollment information for the CCR solution.
 
@author: Orion Health [Tim Panoho]
@created: 2015-05-01
@reference:  
 
 !!!  Important Notes  !!!   
*/ 
select
	[uniqueId]
      ,[enrollmentIdentifier]
      ,[enrollmentStatus]
      ,[enrollerUserId]
      ,[enrollerUserNamespace]
      ,[enrollmentTime]
      ,[enrollmentTimeZone]
      ,[modifierUserId]
      ,[modifierUserNamespace]
      ,[modificationTime]
      ,[modificationTimeZone]
      ,[pathwayIdentifier]
      ,[patientId]
      ,[patientNamespace]
      ,[deactivationReasonId]
from [OH_CM_clinical].[PathwayEnrollment].[PES_PathwayEnrollment]
'
GO
/****** Object:  View [dbo].[vw_ccr_actionListDataIdFromTasks]    Script Date: 06/17/2015 14:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_ccr_actionListDataIdFromTasks]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vw_ccr_actionListDataIdFromTasks] AS 
/*
@Depricated
View [dbo].[vw_ccr_actionListDataIdFromTasks]
[Description] Retreives identifier information for lookup in rhapsody. The purpose of this view is to find all the current tasks with id information from the persistant task table.
 
@author: Orion Health [Tim Panoho]
@created: 2015-05-01
@reference:  
 
 !!!  Important Notes  !!!  
This is a duplicate view of vw_ccr_nursingAssesmentDataIdFromTasks
*/ 
SELECT dataId, taskIdentifier FROM OH_CM_Task.dbo.PersistentTask
'
GO
/****** Object:  View [dbo].[vw_ccr_referralTasks_listServices]    Script Date: 06/17/2015 14:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_ccr_referralTasks_listServices]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vw_ccr_referralTasks_listServices] AS 
  
/*
View [dbo].[vw_ccr_referralTasks_listServices]
[Description] Retreives a list of services for referrals that are currently in Clinical Referrals.
 
@author: Orion Health [Tim Panoho]
@created: 2015-05-01
@reference:  
 
 !!!  Important Notes  !!!   
*/ 
SELECT rrv.referralService as pathwayCode,  rrv.modelDataId as documentId
  FROM [OH_CM_clinical].[RefRequest].[ERF_ReferralRequestView] rrv
'
GO


USE [OH_CM_Custom]
GO
/****** Object:  Table [dbo].[ReferralServiceMapping]    Script Date: 06/17/2015 15:03:04 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ReferralServiceMapping]') AND type in (N'U'))
DROP TABLE [dbo].[ReferralServiceMapping]
GO
/****** Object:  Table [dbo].[ReferralServiceMapping]    Script Date: 06/17/2015 15:03:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ReferralServiceMapping]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ReferralServiceMapping](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[referralServiceName] [nvarchar](100) NOT NULL,
	[pathwayId] [nvarchar](100) NOT NULL,
	[project] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_ReferralService] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UC_ReferralService] UNIQUE NONCLUSTERED 
(
	[referralServiceName] ASC,
	[pathwayId] ASC,
	[project] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[ReferralServiceMapping] ON
INSERT [dbo].[ReferralServiceMapping] ([id], [referralServiceName], [pathwayId], [project]) VALUES (78, N'WICN', N'Walk-In-Centre Pathway', N'CHI')
INSERT [dbo].[ReferralServiceMapping] ([id], [referralServiceName], [pathwayId], [project]) VALUES (75, N'WICS', N'Walk-In-Centre Pathway', N'CHI')
SET IDENTITY_INSERT [dbo].[ReferralServiceMapping] OFF

