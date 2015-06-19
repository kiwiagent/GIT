/*
[1. ACTPAS_CDR_VIEWS_VIEW_Creation_Scripts.sql]
[Description] Creates ACTPAS Views specific for the CCR solution. Used in the Clinical Portal, there are some references also with in the Rhapsody Engine specific to Referrals.
 
@author: Orion Health [Tim Panoho]
@created: 2015-05-01
@reference: Specific CCR Solution views that are located on the ACTPAS_CDR_VIEWS Database
 
 !!!  Important Notes  !!!
OrionPortal requires access to these views so that we are able to access them from the Clinical Portal.
*/
USE [ACTPAS_CDR_VIEWS]
GO
/*
First check if the views exist and drop if they are then recreate.
*/
USE [ACTPAS_CDR_VIEWS]
GO
/****** Object:  View [dbo].[Orion_CWSGPLookup]    Script Date: 06/17/2015 14:54:03 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Orion_CWSGPLookup]'))
DROP VIEW [dbo].[Orion_CWSGPLookup]
GO
/****** Object:  View [dbo].[Orion_CWSGPReferrerAddresses]    Script Date: 06/17/2015 14:54:03 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Orion_CWSGPReferrerAddresses]'))
DROP VIEW [dbo].[Orion_CWSGPReferrerAddresses]
GO
/****** Object:  View [dbo].[orion_CWSCurrentPatientPersonalContacts]    Script Date: 06/17/2015 14:54:03 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[orion_CWSCurrentPatientPersonalContacts]'))
DROP VIEW [dbo].[orion_CWSCurrentPatientPersonalContacts]
GO
/****** Object:  View [dbo].[Orion_CWSPatientDemographics]    Script Date: 06/17/2015 14:54:03 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Orion_CWSPatientDemographics]'))
DROP VIEW [dbo].[Orion_CWSPatientDemographics]
GO
/****** Object:  View [dbo].[Orion_CWSCommunityReferrals]    Script Date: 06/17/2015 14:54:03 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Orion_CWSCommunityReferrals]'))
DROP VIEW [dbo].[Orion_CWSCommunityReferrals]
GO
/****** Object:  View [dbo].[Orion_CWSReferrals]    Script Date: 06/17/2015 14:54:03 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Orion_CWSReferrals]'))
DROP VIEW [dbo].[Orion_CWSReferrals]
GO
/****** Object:  View [dbo].[orion_CWSPatientPersonalContacts]    Script Date: 06/17/2015 14:54:03 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[orion_CWSPatientPersonalContacts]'))
DROP VIEW [dbo].[orion_CWSPatientPersonalContacts]
GO
/****** Object:  View [dbo].[Orion_CWSPatLivingArrangements]    Script Date: 06/17/2015 14:54:03 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Orion_CWSPatLivingArrangements]'))
DROP VIEW [dbo].[Orion_CWSPatLivingArrangements]
GO
/****** Object:  View [dbo].[Orion_CWSReferenceValues]    Script Date: 06/17/2015 14:54:03 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Orion_CWSReferenceValues]'))
DROP VIEW [dbo].[Orion_CWSReferenceValues]
GO
/****** Object:  View [dbo].[Orion_CWSReferralAdminCategory]    Script Date: 06/17/2015 14:54:03 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Orion_CWSReferralAdminCategory]'))
DROP VIEW [dbo].[Orion_CWSReferralAdminCategory]
GO
/****** Object:  View [dbo].[Orion_CWSReferrers]    Script Date: 06/17/2015 14:54:03 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Orion_CWSReferrers]'))
DROP VIEW [dbo].[Orion_CWSReferrers]
GO
/****** Object:  View [dbo].[Orion_CWSSpecialty]    Script Date: 06/17/2015 14:54:03 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Orion_CWSSpecialty]'))
DROP VIEW [dbo].[Orion_CWSSpecialty]
GO
/****** Object:  View [dbo].[Orion_CWSStaffTeams]    Script Date: 06/17/2015 14:54:03 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Orion_CWSStaffTeams]'))
DROP VIEW [dbo].[Orion_CWSStaffTeams]
GO
/****** Object:  View [dbo].[Orion_CWSContacts]    Script Date: 06/17/2015 14:54:03 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Orion_CWSContacts]'))
DROP VIEW [dbo].[Orion_CWSContacts]
GO
/****** Object:  View [dbo].[Orion_CWSCurrentAppointments]    Script Date: 06/17/2015 14:54:03 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Orion_CWSCurrentAppointments]'))
DROP VIEW [dbo].[Orion_CWSCurrentAppointments]
GO
/****** Object:  View [dbo].[Orion_CWSCurrentClinicians]    Script Date: 06/17/2015 14:54:03 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Orion_CWSCurrentClinicians]'))
DROP VIEW [dbo].[Orion_CWSCurrentClinicians]
GO
/****** Object:  View [dbo].[orion_CWSCurrentClinicianStaffTeams]    Script Date: 06/17/2015 14:54:03 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[orion_CWSCurrentClinicianStaffTeams]'))
DROP VIEW [dbo].[orion_CWSCurrentClinicianStaffTeams]
GO
/****** Object:  View [dbo].[Orion_CWSCurrentContacts]    Script Date: 06/17/2015 14:54:03 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Orion_CWSCurrentContacts]'))
DROP VIEW [dbo].[Orion_CWSCurrentContacts]
GO
/****** Object:  View [dbo].[Orion_CWSAppointments]    Script Date: 06/17/2015 14:54:03 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Orion_CWSAppointments]'))
DROP VIEW [dbo].[Orion_CWSAppointments]
GO
/****** Object:  View [dbo].[Orion_CWSClinicians]    Script Date: 06/17/2015 14:54:03 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Orion_CWSClinicians]'))
DROP VIEW [dbo].[Orion_CWSClinicians]
GO
/****** Object:  View [dbo].[Orion_CWSCliniciansSpecialty]    Script Date: 06/17/2015 14:54:03 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Orion_CWSCliniciansSpecialty]'))
DROP VIEW [dbo].[Orion_CWSCliniciansSpecialty]
GO
/****** Object:  View [dbo].[orion_CWSClinicianStaffTeams]    Script Date: 06/17/2015 14:54:03 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[orion_CWSClinicianStaffTeams]'))
DROP VIEW [dbo].[orion_CWSClinicianStaffTeams]
GO
/****** Object:  View [dbo].[Orion_CWSClinics]    Script Date: 06/17/2015 14:54:03 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Orion_CWSClinics]'))
DROP VIEW [dbo].[Orion_CWSClinics]
GO
/****** Object:  View [dbo].[orion_CWSPatientGP]    Script Date: 06/17/2015 14:54:03 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[orion_CWSPatientGP]'))
DROP VIEW [dbo].[orion_CWSPatientGP]
GO
/****** Object:  View [dbo].[Orion_CWSCurrentStaffTeams]    Script Date: 06/17/2015 14:54:03 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Orion_CWSCurrentStaffTeams]'))
DROP VIEW [dbo].[Orion_CWSCurrentStaffTeams]
GO
/****** Object:  View [dbo].[Orion_CWSGPReferrerClinic]    Script Date: 06/17/2015 14:54:03 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Orion_CWSGPReferrerClinic]'))
DROP VIEW [dbo].[Orion_CWSGPReferrerClinic]
GO
/****** Object:  View [dbo].[Orion_CWSMessageAuthorisation]    Script Date: 06/17/2015 14:54:03 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Orion_CWSMessageAuthorisation]'))
DROP VIEW [dbo].[Orion_CWSMessageAuthorisation]
GO
/****** Object:  View [dbo].[Orion_CWSMessageAuthorisation]    Script Date: 06/17/2015 14:54:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Orion_CWSMessageAuthorisation]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[Orion_CWSMessageAuthorisation]
as
/*
View [dbo].[Orion_CWSMessageAuthorisation]
[Description] Used in the prepopulation of the Referral form, this view is for adding additional information into the Patient Demographics section of the Referral. It is designed to show if a client has approved leaving a message on the phone and viewable on the Referral form.
 
@author: Orion Health [Tim Panoho]
@created: 2015-05-01
@reference: CCR-92
 
 !!!  Important Notes  !!! 
 LDA restrictions and performance hits may occur.
 Used in DAS CWS Prepopulation for the referral adaptor.
*/
SELECT p.PASID AS patientId,
ISNULL(lm.DESCRIPTION, ''No'')  AS leaveMessageOnAnsweringMachine,
ISNULL(hm.DESCRIPTION, ''No'')  AS leaveMessageHouseholdMembers,
ISNULL(mo.DESCRIPTION, ''No'')  AS leaveMessageMobile,
ISNULL(wo.DESCRIPTION, ''No'')  AS leaveMessageWork,
ISNULL(wc.DESCRIPTION, ''No'')  AS leaveMessageWorkColleague,
ISNULL(sms.DESCRIPTION, ''No'') AS SMS,
ISNULL(em.DESCRIPTION, ''No'') AS email,
ISNULL(ldv.USSOB_VALUE_9, '''') AS notes,
ISNULL(rv.DESCRIPTION, ''Not Specified'') AS preferredContactMethod,
ldv.MODIF_DTTM AS LastModifiedDate
FROM PATIENTS AS p WITH (nolock) INNER JOIN
LDD_LOCAL_DATAVALUES AS ldv WITH (nolock) ON ldv.PATNT_REFNO = p.PATNT_REFNO INNER JOIN
USER_SCREENS AS us WITH (nolock) ON ldv.USSCR_REFNO = us.USSCR_REFNO LEFT OUTER JOIN
REFERENCE_VALUES AS sms WITH (nolock) ON ldv.USSOB_VALUE_6 = sms.RFVAL_REFNO LEFT OUTER JOIN
REFERENCE_VALUES AS rv WITH (nolock) ON ldv.USSOB_VALUE_8 = rv.RFVAL_REFNO LEFT OUTER JOIN
REFERENCE_VALUES AS lm WITH (nolock) ON ldv.USSOB_VALUE_1 = lm.RFVAL_REFNO LEFT OUTER JOIN
REFERENCE_VALUES AS hm WITH (nolock) ON ldv.USSOB_VALUE_2 = hm.RFVAL_REFNO LEFT OUTER JOIN
REFERENCE_VALUES AS mo WITH (nolock) ON ldv.USSOB_VALUE_3 = mo.RFVAL_REFNO LEFT OUTER JOIN
REFERENCE_VALUES AS wo WITH (nolock) ON ldv.USSOB_VALUE_4 = wo.RFVAL_REFNO LEFT OUTER JOIN
REFERENCE_VALUES AS wc WITH (nolock) ON ldv.USSOB_VALUE_5 = wc.RFVAL_REFNO LEFT OUTER JOIN
REFERENCE_VALUES AS em WITH (nolock) ON ldv.USSOB_VALUE_7 = em.RFVAL_REFNO 
WHERE (us.NAME = ''Message Authorisation'')
AND  p.ARCHV_FLAG  = ''N'' AND  p.ARCHV_FLAG IS NOT NULL
AND  ldv.ARCHV_FLAG = ''N'' AND  ldv.ARCHV_FLAG IS NOT NULL
AND  us.ARCHV_FLAG  = ''N'' AND  us.ARCHV_FLAG IS NOT NULL
AND sms.ARCHV_FLAG = ''N'' AND  sms.ARCHV_FLAG IS NOT NULL
AND rv.ARCHV_FLAG = ''N'' AND  rv.ARCHV_FLAG IS NOT NULL
AND lm.ARCHV_FLAG = ''N'' AND  lm.ARCHV_FLAG IS NOT NULL

'
GO
/****** Object:  View [dbo].[Orion_CWSGPReferrerClinic]    Script Date: 06/17/2015 14:54:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Orion_CWSGPReferrerClinic]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[Orion_CWSGPReferrerClinic] 
as
/*
View [dbo].[Orion_CWSGPReferrerClinic]
[Description] Used in the prepopulation of the Referral form, this view is for adding additional information into the GP section of the Referral. It is designed to show GP information on the Referral form.
 
@author: Orion Health [Tim Panoho]
@created: 2015-05-01
@reference: CCR-92
 
 !!!  Important Notes  !!!  
 Used in DAS CWS Prepopulation for the referral adaptor.
*/
SELECT		pc.proca_refno, 
			pc.MAIN_IDENT AS pcpClinicianId, 
			clintype.MAIN_CODE AS pcpclinicianIdType, 
			ho.MAIN_IDENT AS pcpClinicId, 
			pch.PROVIDER_NUMBER, 
			pch.END_DTTM as pcho_enddttm
FROM        PROF_CARER_HEALTH_ORGS AS pch   with(nolock) INNER JOIN
                      HEALTH_ORGANISATIONS AS ho   with(nolock) ON pch.HEORG_REFNO = ho.HEORG_REFNO INNER JOIN
                      PROF_CARERS AS pc   with(nolock) ON pch.PROCA_REFNO = pc.PROCA_REFNO INNER JOIN
                      REFERENCE_VALUES AS clintype   with(nolock) ON pc.PRTYP_REFNO = clintype.RFVAL_REFNO
WHERE     (ISNULL(pch.ARCHV_FLAG, ''N'') = ''N'') and pc.MAIN_IDENT is not null
'
GO
/****** Object:  View [dbo].[Orion_CWSCurrentStaffTeams]    Script Date: 06/17/2015 14:54:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Orion_CWSCurrentStaffTeams]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[Orion_CWSCurrentStaffTeams]
AS
/*
View [dbo].[Orion_CWSCurrentStaffTeams]
[Description] Contains all current Staff Teams that are in ACTPAS. This view is used mainly for Referrals when users want to find a staff team for the Referred To Staff Team component.
 
@author: Orion Health [Tim Panoho]
@created: 2015-05-01
@reference: CCR-1054, CCR-449, CCR-1076
 
 !!!  Important Notes  !!! 
 This view restricts the number of staff team values returned. This is form performance.
*/
SELECT    
		steam.STEAM_REFNO as staffTeamID, 
		steam.CODE, 
		steam.[DESCRIPTION], 
		steamtype.[DESCRIPTION] as teamType,
		steam.START_DTTM as startDateTime, 
		ho.MAIN_IDENT as healthOrgCode, 
		ho.DESCRIPTION  as healthOrg,
		ownerho.DESCRIPTION  as facility
FROM         STAFF_TEAMS as steam with (nolock) INNER JOIN
             HEALTH_ORGANISATIONS as ho  with (nolock) ON steam.HEORG_REFNO = ho.HEORG_REFNO INNER JOIN
             HEALTH_ORGANISATIONS as ownerho  with (nolock) ON steam.OWNER_HEORG_REFNO = ownerho.HEORG_REFNO INNER JOIN
             REFERENCE_VALUES AS steamtype WITH (nolock) ON steam.STTYP_REFNO = steamtype.RFVAL_REFNO
where 		
(steam.END_DTTM IS NULL or steam.END_DTTM > GetDate()) 
AND (ISNULL(steam.ARCHV_FLAG, ''N'') = ''N'')
AND (ISNULL(ho.ARCHV_FLAG, ''N'') = ''N'')
AND (ISNULL(ownerho.ARCHV_FLAG, ''N'') = ''N'')
and (ISNULL(steamtype.ARCHV_FLAG, ''N'') = ''N'')
AND	(ownerho.MAIN_IDENT IN (''DHHCC'', ''ACTCC'', ''CHCACT''))
'
GO
/****** Object:  View [dbo].[orion_CWSPatientGP]    Script Date: 06/17/2015 14:54:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[orion_CWSPatientGP]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[orion_CWSPatientGP] 
as
/*
View [dbo].[orion_CWSPatientGP]
[Description] Used in the prepopulation of the Referral form, this view is for adding additional information into the GP section of the Referral Form. It is designed to show the patients current GP in ACTPAS.
 
@author: Orion Health [Tim Panoho]
@created: 2015-05-01
@reference: CCR-92
 
 !!!  Important Notes  !!!  
 Used in DAS CWS Prepopulation for the Referral adaptor.
*/
SELECT       		  ppc.PATNT_REFNO, 
					  p.PASID as patientID, 
					  pc.MAIN_IDENT AS pcpclinicianid, 
					  clintype.MAIN_CODE AS pcpclinicianidtype, 
					  ho.MAIN_IDENT AS pcpclinicid, 
                      title.DESCRIPTION AS title, 
                      pc.SURNAME AS surname, 
                      pc.FORENAME AS firstName,  
                      ppc.START_DTTM as gpstartdttm, 
                      ppc.END_DTTM AS gpenddttm
FROM         PATIENT_PROF_CARERS AS ppc WITH (nolock) LEFT OUTER JOIN
                      HEALTH_ORGANISATIONS AS ho WITH (nolock) ON ppc.HEORG_REFNO = ho.HEORG_REFNO INNER JOIN
                      REFERENCE_VALUES AS prtyp WITH (nolock) ON ppc.PRTYP_REFNO = prtyp.RFVAL_REFNO INNER JOIN
                      PROF_CARERS AS pc WITH (nolock) ON ppc.PROCA_REFNO = pc.PROCA_REFNO INNER JOIN
                      REFERENCE_VALUES AS clintype WITH (nolock) ON pc.PRTYP_REFNO = clintype.RFVAL_REFNO INNER JOIN
                      REFERENCE_VALUES AS title WITH (nolock) ON pc.TITLE_REFNO = title.RFVAL_REFNO INNER JOIN
                      PATIENTS AS p WITH (nolock) ON ppc.PATNT_REFNO = p.PATNT_REFNO 
WHERE    (ISNULL(ppc.ARCHV_FLAG, ''N'') = ''N'') AND (prtyp.MAIN_CODE = ''GMPRC'') AND (ISNULL(p.ARCHV_FLAG,''N'')=''N'') AND ppc.END_DTTM IS NULL

'
GO
/****** Object:  View [dbo].[Orion_CWSClinics]    Script Date: 06/17/2015 14:54:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Orion_CWSClinics]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[Orion_CWSClinics]
AS

/*
View [dbo].[Orion_CWSClinics]
[Description] Contains for a clinician all clinics are in ACTPAS. This view is used mainly for Referrals and is displayed on the Clinical Portal homepage for any clinical user.
 
@author: Orion Health [Tim Panoho]
@created: 2015-05-01
@reference: CCR-101, CCR-1152
 
 !!!  Important Notes  !!! 
*/ 
SELECT     sp.CODE AS clinicId, 
           sp.DESCRIPTION AS clinicName, 
           pc.MAIN_IDENT AS ClinicianId, 
           clintype.MAIN_CODE AS ClinicianIdType, 
           s.MAIN_IDENT AS service_code, 
           hotyp.MAIN_CODE AS facilitycode,
           heorg.MAIN_IDENT AS Facility
           
FROM       SERVICE_POINTS AS sp with(nolock) INNER JOIN
           PROF_CARERS AS pc  with(nolock) ON sp.PROCA_REFNO = pc.PROCA_REFNO INNER JOIN
           SPECIALTIES AS s  with(nolock) ON sp.SPECT_REFNO = s.SPECT_REFNO INNER JOIN
           REFERENCE_VALUES AS clintype  with(nolock) ON pc.PRTYP_REFNO = clintype.RFVAL_REFNO INNER JOIN
           REFERENCE_VALUES AS sptype  with(nolock) ON sp.SPTYP_REFNO = sptype.RFVAL_REFNO INNER JOIN
           HEALTH_ORGANISATIONS AS heorg  with(nolock) ON sp.OWNER_HEORG_REFNO = heorg.HEORG_REFNO INNER JOIN
           HEALTH_ORGANISATIONS AS ho  with(nolock) ON sp.HEORG_REFNO = ho.HEORG_REFNO INNER JOIN
           REFERENCE_VALUES AS hotyp  with(nolock) ON ho.HOTYP_REFNO = hotyp.RFVAL_REFNO
           
--WHERE  (sp.SPTYP_REFNO = 2016) 
WHERE  hotyp.MAIN_CODE = ''CLINIC''
AND (sp.END_DTTM IS NULL)
AND (s.MAIN_IDENT not in (''CHPMO'',''CHPNUR'',''CHPPHA''))
and heorg.MAIN_IDENT IN (''DHHCC'',''ACTCC'',''CHCACT'')
AND (ISNULL(sp.ARCHV_FLAG, ''N'') = ''N'') 
AND (ISNULL(pc.ARCHV_FLAG, ''N'') in (''N'',''D'',''C'')) -- added 6/2/13 to include providers marked for deletion but haven''t been deletes as yet, as they still appear on ACTPAS with a archive_flag=''D''
AND (ISNULL(s.ARCHV_FLAG, ''N'') = ''N'') 
AND (ISNULL(heorg.ARCHV_FLAG, ''N'') = ''N'')
'
GO
/****** Object:  View [dbo].[orion_CWSClinicianStaffTeams]    Script Date: 06/17/2015 14:54:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[orion_CWSClinicianStaffTeams]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[orion_CWSClinicianStaffTeams]
AS
/*
View [dbo].[orion_CWSClinicianStaffTeams]
[Description] To find all Clinicians and associated specialities i.e. if I work at Tuggeranong as a nurse and educator as a clinician I want to see this association. The view contains clinician staff teams. This is currently used in the Clinical Portal for Referrals.

Usage	Homepages and Patient Context
Clause	Joins on Clinic / Specialty / Staff Teams

@author: Orion Health [Tim Panoho]
@created: 2015-05-01
@reference: CCR-102
 
 !!!  Important Notes  !!! 
*/ 
SELECT     
pcsteam.PROCA_REFNO, 
pcsteam.START_DTTM as startDate, 
pcsteam.END_DTTM as endDate, 
pcsteam.STEAM_REFNO as staffTeamID,   
ho.MAIN_IDENT as facility 
FROM         PROF_CARER_STAFF_TEAMS AS pcsteam with (nolock) INNER JOIN
             HEALTH_ORGANISATIONS as ho with (nolock) on pcsteam.OWNER_HEORG_REFNO = ho.HEORG_REFNO
where   (ISNULL(pcsteam.ARCHV_FLAG, ''N'') = ''N'')
		AND (ho.MAIN_IDENT IN (''DHHCC'', ''ACTCC'', ''CHCACT''))
'
GO
/****** Object:  View [dbo].[Orion_CWSCliniciansSpecialty]    Script Date: 06/17/2015 14:54:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Orion_CWSCliniciansSpecialty]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[Orion_CWSCliniciansSpecialty]
AS
/*
View [dbo].[Orion_CWSCliniciansSpecialty]
[Description] To find all Clinicians and associated specialities i.e. if I work at Tuggeranong as a nurse and educator as a clinician I want to see this association. The view contains clinician specialties. This is currently used in the Clinical Portal for Referrals.

Usage	Homepages and Patient Context
Clause	Joins on Clinic / Specialty / Staff Teams

@author: Orion Health [Tim Panoho]
@created: 2015-05-01
@reference: CCR-101, CCR-102
 
 !!!  Important Notes  !!! 
*/ 
SELECT      pc.PROCA_REFNO,  
			spec.MAIN_IDENT AS SpecialtyCode, 
			spec.[DESCRIPTION] AS Specialty, 
			profspec.START_DTTM as StartDate,
			profspec.END_DTTM as EndDate,
			ho.MAIN_IDENT as facility
FROM         PROF_CARERS AS pc WITH (nolock) INNER JOIN
                      PROF_CARER_SPECIALTIES AS profspec WITH (nolock) ON pc.PROCA_REFNO = profspec.PROCA_REFNO INNER JOIN
                      SPECIALTIES AS spec WITH (nolock) ON profspec.SPECT_REFNO = spec.SPECT_REFNO INNER JOIN
                      HEALTH_ORGANISATIONS AS ho  WITH (nolock) ON pc.OWNER_HEORG_REFNO = ho.HEORG_REFNO 
WHERE     profspec.END_DTTM is null
AND  (ISNULL(pc.ARCHV_FLAG, ''N'') = ''N'') 
			AND (ISNULL(profspec.ARCHV_FLAG, ''N'') = ''N'') 
			AND (ISNULL(spec.ARCHV_FLAG, ''N'') = ''N'') 
			AND (ISNULL(ho.ARCHV_FLAG, ''N'') = ''N'')
			AND (ho.MAIN_IDENT IN (''DHHCC'', ''ACTCC'', ''CHCACT''))
'
GO
/****** Object:  View [dbo].[Orion_CWSClinicians]    Script Date: 06/17/2015 14:54:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Orion_CWSClinicians]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[Orion_CWSClinicians]
AS
/*
View [dbo].[Orion_CWSClinicians]
[Description] To find all Clinicians in ACTPAS i.e. if I work at Tuggeranong as a nurse and educator as a clinician I want to see this association. The view contains clinicians that are active in ACTPAS. This is currently used in the Clinical Portal for Referrals.

Usage	Homepages and Patient Context
Clause	Joins on Clinician / Specialty / Staff Teams

@author: Orion Health [Tim Panoho]
@created: 2015-05-01
@reference: CCR-100, CCR-101, CCR-102, CCR-653, CCR-881
 
 !!!  Important Notes  !!! 
*/
SELECT      pc.PROCA_REFNO, 
			pc.MAIN_IDENT AS ClinicianID, 
			prtyp.MAIN_CODE AS ClinicianIDType, 
			title.MAIN_CODE AS title, 
			pc.SURNAME AS familyname, 
			ISNULL(pc.FORENAME, '''') AS givenname, 
			pc.START_DTTM as StartDate,
			pc.END_DTTM as EndDate, 
			ho.MAIN_IDENT as facility
FROM         PROF_CARERS AS pc WITH (nolock) INNER JOIN
                      REFERENCE_VALUES AS prtyp WITH (nolock) ON pc.PRTYP_REFNO = prtyp.RFVAL_REFNO INNER JOIN
                      HEALTH_ORGANISATIONS AS ho  WITH (nolock) ON pc.OWNER_HEORG_REFNO = ho.HEORG_REFNO INNER JOIN
                      REFERENCE_VALUES AS title WITH (nolock) ON pc.TITLE_REFNO = title.RFVAL_REFNO
WHERE    (ISNULL(pc.ARCHV_FLAG, ''N'') = ''N'') 
			AND (ISNULL(ho.ARCHV_FLAG, ''N'') = ''N'')
			AND (ho.MAIN_IDENT IN (''DHHCC'', ''ACTCC'', ''CHCACT''))
'
GO
/****** Object:  View [dbo].[Orion_CWSAppointments]    Script Date: 06/17/2015 14:54:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Orion_CWSAppointments]'))
EXEC dbo.sp_executesql @statement = N'

CREATE VIEW [dbo].[Orion_CWSAppointments]
as
/*
View [dbo].[Orion_CWSAppointments]
[Description] To find all Appointments in ACTPAS. The view contains all apointments that are active in ACTPAS for any patient. This is currently used in the Clinical Portal for Referrals.

Usage	Homepages and Patient Context
Clause	Joins on Clinician / Appointment

@author: Orion Health [Tim Panoho]
@created: 2015-05-01
@reference: CCR-100 
 
 !!!  Important Notes  !!! 
 
 There maybe performance hits on this as it attempts to find all appointments and is a very large number of records to scan. Care is required when implementing with this view.
 
*/  
SELECT p.PASID AS PatientId, 
        pc.Proca_refno,
        s.REFRL_REFNO AS referralID,
        pc.MAIN_IDENT AS ClinicianID, 
		prtyp.MAIN_CODE AS ClinicianIDType,
		s.SCHDL_REFNO AS AppointmentNumber, 
		s.START_DTTM AS AppointmentDttm, 
		s.END_DTTM AS AppointmentEndDttm, 
        [type].[DESCRIPTION] AS AppointmentType, 
        SP.CODE AS clinicCode,         
        sp.NAME AS ClinicName,
        spec.[DESCRIPTION] AS ClinicSpecialty, 
        spec.[MAIN_IDENT] AS ClinicSpecialtyCode, 
        spsess.CODE as sessionCode, 
        AtStat.[DESCRIPTION] AS AttendStatus, 
        s.COMMENTS AS Comments, 
        s.USER_MODIF AS LastModifiedBy, 
        ho.MAIN_IDENT AS Facility,
        sctyp.MAIN_CODE as scheduletype,
        cancr.[DESCRIPTION] as cancelstatus,
        s.ARRIVED_DTTM as ArrivedAt,
        s.SEEN_DTTM as SeenAt,
        s.CALLED_DTTM as CalledAt,
        s.DEPARTED_DTTM as DepartedAt,
        s.CANCR_DTTM as CancelledAt
FROM    SCHEDULES AS s with(nolock) 
		INNER JOIN PATIENTS AS p  with(nolock) 
			ON s.PATNT_REFNO = p.PATNT_REFNO
		INNER JOIN REFERENCE_VALUES AS sctyp  with(nolock) 
			ON s.SCTYP_REFNO = sctyp.RFVAL_REFNO 
		INNER JOIN PROF_CARERS AS PC  with(nolock) 
			ON s.PROCA_REFNO = PC.PROCA_REFNO 
		INNER JOIN SERVICE_POINTS AS SP  with(nolock) 
			ON s.SPONT_REFNO = SP.SPONT_REFNO 
		INNER JOIN REFERENCE_VALUES AS [type]  with(nolock) 
			ON s.VISIT_REFNO = type.RFVAL_REFNO 
		INNER JOIN SPECIALTIES AS spec  with(nolock) 
			ON s.SPECT_REFNO = spec.SPECT_REFNO 
		INNER JOIN REFERENCE_VALUES AS AtStat  with(nolock) 
			ON s.ATTND_REFNO = AtStat.RFVAL_REFNO 
		INNER JOIN HEALTH_ORGANISATIONS AS ho  with(nolock) 
			ON s.OWNER_HEORG_REFNO = ho.HEORG_REFNO 
		INNER JOIN SERVICE_POINT_SESSIONS AS spsess  with(nolock) 
			ON s.SPSSN_REFNO = spsess.SPSSN_REFNO 
		INNER JOIN REFERENCE_VALUES AS prtyp WITH (nolock) 
			ON pc.PRTYP_REFNO = prtyp.RFVAL_REFNO   
		INNER JOIN REFERENCE_VALUES AS cancr  with(nolock) 
			ON s.CANCR_REFNO = cancr.RFVAL_REFNO    
WHERE   ho.MAIN_IDENT IN (''DHHCC'',''ACTCC'',''CHCACT'')
		and (ISNULL(s.ARCHV_FLAG, ''N'') = ''N'')
		AND (ISNULL(p.ARCHV_FLAG, ''N'') = ''N'')
		AND (ISNULL(pc.ARCHV_FLAG, ''N'') = ''N'')
		AND (ISNULL(sp.ARCHV_FLAG, ''N'') = ''N'')
		AND (ISNULL(spec.ARCHV_FLAG, ''N'') = ''N'')
		AND (ISNULL(ho.ARCHV_FLAG, ''N'') = ''N'')
		AND (ISNULL(spsess.ARCHV_FLAG, ''N'') = ''N'')

'
GO
/****** Object:  View [dbo].[Orion_CWSCurrentContacts]    Script Date: 06/17/2015 14:54:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Orion_CWSCurrentContacts]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[Orion_CWSCurrentContacts]
as
/*
View [dbo].[Orion_CWSCurrentContacts]
[Description] Contains for a clinician the current patient contacts for that week that are in ACTPAS. This view is used mainly for contacts and is displayed on the Clinical Portal homepage for any clinical user.
 
@author: Orion Health [Tim Panoho]
@created: 2015-05-01
@reference: CCR-101, CCR-1152
 
 !!!  Important Notes  !!! 
 This view is restricted to the last 7 days and is designed to work with a more current worklist from the Clinical Portal.
*/ 
SELECT     
p.PASID AS PatientId, 
s.SCHDL_REFNO AS contactID, 
type.DESCRIPTION AS ContactType, 
s.REFRL_REFNO AS referralID, 
s.START_DTTM AS StartDateTime, 
s.END_DTTM AS endDatetime, 
DATEDIFF(minute, s.START_DTTM, s.END_DTTM) AS Duration, 
CASE cancr.main_code WHEN ''C'' THEN ''Cancelled'' ELSE (CASE scocm.DESCRIPTION WHEN ''Planned'' THEN ''Planned Contact'' WHEN ''Occurred'' THEN ''Actual Contact'' ELSE ''Planned Contact'' END) END AS Status, 
clintype.MAIN_CODE AS ClinicianIDType, 
pc.MAIN_IDENT AS ClinicianID, 
scocm.DESCRIPTION AS outcome, 
ho.MAIN_IDENT AS Facility
FROM         dbo.SCHEDULES AS s WITH (nolock) INNER JOIN
              dbo.PATIENTS AS p WITH (nolock) ON s.PATNT_REFNO = p.PATNT_REFNO INNER JOIN
              dbo.REFERENCE_VALUES AS sctyp WITH (nolock) ON s.SCTYP_REFNO = sctyp.RFVAL_REFNO INNER JOIN
              dbo.REFERENCE_VALUES AS scocm WITH (nolock) ON s.SCOCM_REFNO = scocm.RFVAL_REFNO INNER JOIN
              dbo.REFERENCE_VALUES AS lotyp WITH (nolock) ON s.LOTYP_REFNO = lotyp.RFVAL_REFNO INNER JOIN
              dbo.REFERENCE_VALUES AS type WITH (nolock) ON s.CONTY_REFNO = type.RFVAL_REFNO INNER JOIN
              dbo.REFERENCE_VALUES AS cancr WITH (nolock) ON s.CANCR_REFNO = cancr.RFVAL_REFNO INNER JOIN
              dbo.HEALTH_ORGANISATIONS AS ho WITH (nolock) ON s.OWNER_HEORG_REFNO = ho.HEORG_REFNO INNER JOIN
              dbo.SCHEDULES AS schedproca WITH (nolock) ON s.SCHDL_REFNO = schedproca.PARNT_REFNO INNER JOIN
              dbo.PROF_CARERS AS pc WITH (nolock) ON schedproca.PROCA_REFNO = pc.PROCA_REFNO INNER JOIN
              dbo.REFERENCE_VALUES AS clintype WITH (nolock) ON pc.PRTYP_REFNO = clintype.RFVAL_REFNO
WHERE     (sctyp.MAIN_CODE = ''CNTCT'') 
AND (s.REFRL_REFNO IS NOT NULL) 
AND (ho.MAIN_IDENT IN (''DHHCC'', ''ACTCC'', ''CHCACT'')) 
AND (ISNULL(s.ARCHV_FLAG, ''N'') = ''N'') 
AND (ISNULL(p.ARCHV_FLAG, ''N'') = ''N'') 
AND (ISNULL(schedproca.ARCHV_FLAG, ''N'') IN (''N'', ''D'', ''C'')) 
AND (ISNULL(pc.ARCHV_FLAG, ''N'') IN (''N'', ''D'', ''C'')) 
AND (ISNULL(ho.ARCHV_FLAG, ''N'') = ''N'')
AND (s.START_DTTM >= DATEADD(d, - 7, CONVERT(datetime, CONVERT(varchar, GETDATE(), 103), 103)))
'
GO
/****** Object:  View [dbo].[orion_CWSCurrentClinicianStaffTeams]    Script Date: 06/17/2015 14:54:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[orion_CWSCurrentClinicianStaffTeams]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[orion_CWSCurrentClinicianStaffTeams]
AS
/*
View [dbo].[orion_CWSCurrentClinicianStaffTeams]
[Description] Contains for a clinician the current Clinicians Staff Team relationship that are in ACTPAS. This view is used mainly for searches in the Clinical Portal where clinicians want to find their staff team codes. This view is designed to link a referral to a clincians staff team in Referrals. To find all Clinicians and associated specialities i.e. if I work at Tuggeranong as a nurse and educator as a clinician I want to see this association.

Usage	Homepages and Patient Context
Clause	Joins on Clinic / Specialty / Staff Teams
 
@author: Orion Health [Tim Panoho]
@created: 2015-05-01
@reference: CCR-102
 
 !!!  Important Notes  !!! 
 This view is restricted to current clincians that do not have an End Date.
 
*/ 
SELECT     
pcsteam.PROCA_REFNO, 
pcsteam.START_DTTM as startDate, 
pcsteam.STEAM_REFNO as staffTeamID,   
ho.MAIN_IDENT as facility 
FROM         PROF_CARER_STAFF_TEAMS AS pcsteam with (nolock) INNER JOIN
             HEALTH_ORGANISATIONS as ho with (nolock) on pcsteam.OWNER_HEORG_REFNO = ho.HEORG_REFNO
where   (ISNULL(pcsteam.ARCHV_FLAG, ''N'') = ''N'')
		AND (ho.MAIN_IDENT IN (''DHHCC'', ''ACTCC'', ''CHCACT''))	
		and (pcsteam.END_DTTM IS NULL or pcsteam.END_DTTM > GetDate())
'
GO
/****** Object:  View [dbo].[Orion_CWSCurrentClinicians]    Script Date: 06/17/2015 14:54:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Orion_CWSCurrentClinicians]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[Orion_CWSCurrentClinicians]
AS
/*
View [dbo].[Orion_CWSCurrentClinicians]
[Description] Contains for a clinician the current Clinicians that are in ACTPAS. This view is used mainly for searches in the Clinical Portal where clinicians want to find other clinician codes. This view is designed to link a referral to a clincian in Referrals. ACTPAS clinician ID details do not map cleanly to the current Portal user in all scenarios from input from SSICT.
In order to create Clinical Referrals for the currently logged in user which can then also be used to create ACTPAS linked referrals we need to map the Portal user to their ACTPAS clinician ID.
This will be achieved by adding an additional Parameter to the ACTPAS Users group which will allow the user to select their Clinicain Details from the popup search of the configured ACTPAS Clinicians. 
This field will be named "ACTPAS Clinician ID" , and will be available as a parameter to processes executing which require this information ia template processing.


Usage	Referrals Windowlets 
@author: Orion Health [Tim Panoho]
@created: 2015-05-01
@reference: CCR-510
 
 !!!  Important Notes  !!!  
 The source for the popup search for clinicians to retrieve their code will use the view : [ACTPAS_CDR_VIEWS].[dbo].[Orion_CWSCurrentClinicians] as the source for the data ( given the user should only be retrieving the code for themselves as a current clinician.
*/ 
SELECT      pc.PROCA_REFNO, 
			pc.MAIN_IDENT AS ClinicianID, 
			prtyp.MAIN_CODE AS ClinicianIDType, 
			title.MAIN_CODE AS title, 
			pc.SURNAME AS familyname, 
			ISNULL(pc.FORENAME, '''') AS givenname, 
			pc.START_DTTM as StartDate,
			ho.MAIN_IDENT as facility
FROM         PROF_CARERS AS pc WITH (nolock) INNER JOIN
                      REFERENCE_VALUES AS prtyp WITH (nolock) ON pc.PRTYP_REFNO = prtyp.RFVAL_REFNO INNER JOIN
                      HEALTH_ORGANISATIONS AS ho  WITH (nolock) ON pc.OWNER_HEORG_REFNO = ho.HEORG_REFNO INNER JOIN
                      REFERENCE_VALUES AS title WITH (nolock) ON pc.TITLE_REFNO = title.RFVAL_REFNO
WHERE       (ISNULL(pc.ARCHV_FLAG, ''N'') = ''N'') 
			AND (ISNULL(ho.ARCHV_FLAG, ''N'') = ''N'')
			AND (ho.MAIN_IDENT IN (''DHHCC'', ''ACTCC'', ''CHCACT''))
			AND (pc.END_DTTM IS NULL or pc.END_DTTM > GetDate())
'
GO
/****** Object:  View [dbo].[Orion_CWSCurrentAppointments]    Script Date: 06/17/2015 14:54:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Orion_CWSCurrentAppointments]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[Orion_CWSCurrentAppointments]
as
/*
View [dbo].[Orion_CWSCurrentAppointments]
[Description] Contains for a clinician the current patient appointments that are in ACTPAS. This view is used mainly for searches in the Clinical Portal where clinicians want to find patient appointments. This view is designed to link a referral to a clincians staff team in Referrals. To find all the appointments that are associated to a clinic i.e. if I work at Tuggeranong as a clinician I want to see a list of my clinic appointments

Usage	Homepages and Patient Context
Clause	Joins on Clinic / Specialty / Appointment Date / Patient ID / Staff Teams
 
@author: Orion Health [Tim Panoho]
@created: 2015-05-01
@reference: CCR-100
 
 !!!  Important Notes  !!!   
*/ 
SELECT p.PASID AS PatientId, 
        pc.Proca_refno,
        s.REFRL_REFNO AS referralID,
        pc.MAIN_IDENT AS ClinicianID, 
		prtyp.MAIN_CODE AS ClinicianIDType,
		s.SCHDL_REFNO AS AppointmentNumber, 
		s.START_DTTM AS AppointmentDttm, 
		s.END_DTTM AS AppointmentEndDttm, 
        [type].[DESCRIPTION] AS AppointmentType, 
        SP.CODE AS clinicCode,         
        sp.NAME AS ClinicName,
        spec.[DESCRIPTION] AS ClinicSpecialty, 
        spsess.CODE as sessionCode, 
        AtStat.[DESCRIPTION] AS AttendStatus, 
        s.COMMENTS AS Comments, 
        s.USER_MODIF AS LastModifiedBy, 
        ho.MAIN_IDENT AS Facility,
        sctyp.MAIN_CODE as scheduletype,
        cancr.[DESCRIPTION] as cancelstatus
FROM    SCHEDULES AS s with(nolock) 
		INNER JOIN PATIENTS AS p  with(nolock) 
			ON s.PATNT_REFNO = p.PATNT_REFNO
		INNER JOIN REFERENCE_VALUES AS sctyp  with(nolock) 
			ON s.SCTYP_REFNO = sctyp.RFVAL_REFNO 
		INNER JOIN PROF_CARERS AS PC  with(nolock) 
			ON s.PROCA_REFNO = PC.PROCA_REFNO 
		INNER JOIN SERVICE_POINTS AS SP  with(nolock) 
			ON s.SPONT_REFNO = SP.SPONT_REFNO 
		INNER JOIN REFERENCE_VALUES AS [type]  with(nolock) 
			ON s.VISIT_REFNO = type.RFVAL_REFNO 
		INNER JOIN SPECIALTIES AS spec  with(nolock) 
			ON s.SPECT_REFNO = spec.SPECT_REFNO 
		INNER JOIN REFERENCE_VALUES AS AtStat  with(nolock) 
			ON s.ATTND_REFNO = AtStat.RFVAL_REFNO 
		INNER JOIN HEALTH_ORGANISATIONS AS ho  with(nolock) 
			ON s.OWNER_HEORG_REFNO = ho.HEORG_REFNO 
		INNER JOIN SERVICE_POINT_SESSIONS AS spsess  with(nolock) 
			ON s.SPSSN_REFNO = spsess.SPSSN_REFNO 
		INNER JOIN REFERENCE_VALUES AS prtyp WITH (nolock) 
			ON pc.PRTYP_REFNO = prtyp.RFVAL_REFNO   
		INNER JOIN REFERENCE_VALUES AS cancr  with(nolock) 
			ON s.CANCR_REFNO = cancr.RFVAL_REFNO    
WHERE   sctyp.MAIN_CODE=''OTPAT''
		and ho.MAIN_IDENT IN (''DHHCC'',''ACTCC'',''CHCACT'')
		and (ISNULL(s.ARCHV_FLAG, ''N'') = ''N'')
		AND (ISNULL(p.ARCHV_FLAG, ''N'') = ''N'')
		AND (ISNULL(pc.ARCHV_FLAG, ''N'') = ''N'')
		AND (ISNULL(sp.ARCHV_FLAG, ''N'') = ''N'')
		AND (ISNULL(spec.ARCHV_FLAG, ''N'') = ''N'')
		AND (ISNULL(ho.ARCHV_FLAG, ''N'') = ''N'')
		AND (ISNULL(spsess.ARCHV_FLAG, ''N'') = ''N'')
		AND (s.START_DTTM >= DATEADD(d, - 7, CONVERT(datetime, CONVERT(varchar, GETDATE(), 103), 103)))
'
GO
/****** Object:  View [dbo].[Orion_CWSContacts]    Script Date: 06/17/2015 14:54:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Orion_CWSContacts]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[Orion_CWSContacts]
AS
/*
View [dbo].[Orion_CWSContacts]
[Description] Contains for a clinician all patient contacts for that week that are in ACTPAS. This view is used mainly for contacts and are displayed on the Clinical Portal homepage for any clinical user.
 
@author: Orion Health [Tim Panoho]
@created: 2015-05-01
@reference: CCR-101, CCR-1152
 
 !!!  Important Notes  !!! 
*/ 
  
SELECT     p.PASID AS PatientId, s.SCHDL_REFNO AS contactID, type.DESCRIPTION AS ContactType, s.REFRL_REFNO AS referralID, s.START_DTTM AS StartDateTime, 
                      s.END_DTTM AS endDatetime, DATEDIFF(minute, s.START_DTTM, s.END_DTTM) AS Duration, 
                      CASE cancr.main_code WHEN ''C'' THEN ''Cancelled'' ELSE (CASE scocm.DESCRIPTION WHEN ''Planned'' THEN ''Planned Contact'' WHEN ''Occurred'' THEN ''Actual Contact''
                       ELSE ''Planned Contact'' END) END AS Status, clintype.MAIN_CODE AS ClinicianIDType, pc.MAIN_IDENT AS ClinicianID, scocm.DESCRIPTION AS outcome, 
                      ho.MAIN_IDENT AS Facility
FROM         dbo.SCHEDULES AS s WITH (nolock) INNER JOIN
                      dbo.PATIENTS AS p WITH (nolock) ON s.PATNT_REFNO = p.PATNT_REFNO INNER JOIN
                      dbo.REFERENCE_VALUES AS sctyp WITH (nolock) ON s.SCTYP_REFNO = sctyp.RFVAL_REFNO INNER JOIN
                      dbo.REFERENCE_VALUES AS scocm WITH (nolock) ON s.SCOCM_REFNO = scocm.RFVAL_REFNO INNER JOIN
                      dbo.REFERENCE_VALUES AS lotyp WITH (nolock) ON s.LOTYP_REFNO = lotyp.RFVAL_REFNO INNER JOIN
                      dbo.REFERENCE_VALUES AS type WITH (nolock) ON s.CONTY_REFNO = type.RFVAL_REFNO INNER JOIN
                      dbo.REFERENCE_VALUES AS cancr WITH (nolock) ON s.CANCR_REFNO = cancr.RFVAL_REFNO INNER JOIN
                      dbo.HEALTH_ORGANISATIONS AS ho WITH (nolock) ON s.OWNER_HEORG_REFNO = ho.HEORG_REFNO INNER JOIN
                      dbo.SCHEDULES AS schedproca WITH (nolock) ON s.SCHDL_REFNO = schedproca.PARNT_REFNO INNER JOIN
                      dbo.PROF_CARERS AS pc WITH (nolock) ON schedproca.PROCA_REFNO = pc.PROCA_REFNO INNER JOIN
                      dbo.REFERENCE_VALUES AS clintype WITH (nolock) ON pc.PRTYP_REFNO = clintype.RFVAL_REFNO
WHERE     (sctyp.MAIN_CODE = ''CNTCT'') AND (s.REFRL_REFNO IS NOT NULL) AND (ho.MAIN_IDENT IN (''DHHCC'', ''ACTCC'', ''CHCACT'')) AND (ISNULL(s.ARCHV_FLAG, ''N'') = ''N'') 
                      AND (ISNULL(p.ARCHV_FLAG, ''N'') = ''N'') AND (ISNULL(schedproca.ARCHV_FLAG, ''N'') IN (''N'', ''D'', ''C'')) AND (ISNULL(pc.ARCHV_FLAG, ''N'') IN (''N'', ''D'', ''C'')) AND 
                      (ISNULL(ho.ARCHV_FLAG, ''N'') = ''N'')
'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'Orion_CWSContacts', NULL,NULL))
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
         Top = -192
         Left = 0
      End
      Begin Tables = 
         Begin Table = "s"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 264
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "p"
            Begin Extent = 
               Top = 114
               Left = 38
               Bottom = 222
               Right = 276
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "sctyp"
            Begin Extent = 
               Top = 222
               Left = 38
               Bottom = 330
               Right = 237
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "scocm"
            Begin Extent = 
               Top = 222
               Left = 275
               Bottom = 330
               Right = 474
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "lotyp"
            Begin Extent = 
               Top = 330
               Left = 38
               Bottom = 438
               Right = 237
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "type"
            Begin Extent = 
               Top = 330
               Left = 275
               Bottom = 438
               Right = 474
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "cancr"
            Begin Extent = 
               Top = 438
               Left = 38
               Bottom = 546
               Right = 237
            End
            DisplayFlags = 280
            TopColu' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Orion_CWSContacts'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane2' , N'SCHEMA',N'dbo', N'VIEW',N'Orion_CWSContacts', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'mn = 0
         End
         Begin Table = "ho"
            Begin Extent = 
               Top = 438
               Left = 275
               Bottom = 546
               Right = 478
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "schedproca"
            Begin Extent = 
               Top = 546
               Left = 38
               Bottom = 654
               Right = 264
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "pc"
            Begin Extent = 
               Top = 654
               Left = 38
               Bottom = 762
               Right = 248
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "clintype"
            Begin Extent = 
               Top = 762
               Left = 38
               Bottom = 870
               Right = 237
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Orion_CWSContacts'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'Orion_CWSContacts', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Orion_CWSContacts'
GO
/****** Object:  View [dbo].[Orion_CWSStaffTeams]    Script Date: 06/17/2015 14:54:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Orion_CWSStaffTeams]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[Orion_CWSStaffTeams]
AS

/*
View [dbo].[Orion_CWSStaffTeams]
[Description] Contains all Staff Teams that are in ACTPAS. This view is used mainly for Referrals when users want to find a staff team for the Referred To Staff Team component.
 
@author: Orion Health [Tim Panoho]
@created: 2015-05-01
@reference: CCR-1054, CCR-449, CCR-1076
 
 !!!  Important Notes  !!! 
*/ 

SELECT    
		steam.STEAM_REFNO as staffTeamID, 
		steam.CODE, 
		steam.[DESCRIPTION], 
		steamtype.[DESCRIPTION] as teamType,
		steam.START_DTTM as startDateTime, 
		steam.END_DTTM as endDateTime, 
		ho.MAIN_IDENT as healthOrgCode, 
		ho.DESCRIPTION  as healthOrg,
		ownerho.DESCRIPTION  as facility
FROM         STAFF_TEAMS as steam INNER JOIN
             HEALTH_ORGANISATIONS as ho ON steam.HEORG_REFNO = ho.HEORG_REFNO INNER JOIN
             HEALTH_ORGANISATIONS as ownerho ON steam.OWNER_HEORG_REFNO = ownerho.HEORG_REFNO INNER JOIN
             REFERENCE_VALUES AS steamtype WITH (nolock) ON steam.STTYP_REFNO = steamtype.RFVAL_REFNO
where 		
(ISNULL(steam.ARCHV_FLAG, ''N'') = ''N'')
AND (ISNULL(ho.ARCHV_FLAG, ''N'') = ''N'')
AND (ISNULL(ownerho.ARCHV_FLAG, ''N'') = ''N'')
and (ISNULL(steamtype.ARCHV_FLAG, ''N'') = ''N'')
AND	(ownerho.MAIN_IDENT IN (''DHHCC'', ''ACTCC'', ''CHCACT''))
'
GO
/****** Object:  View [dbo].[Orion_CWSSpecialty]    Script Date: 06/17/2015 14:54:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Orion_CWSSpecialty]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[Orion_CWSSpecialty]
AS
/*
View [dbo].[Orion_CWSSpecialty]
[Description] To find all specialities i.e. if I work at Tuggeranong as a nurse and educator as a clinician I want to see this specialities for these. The view contains specialties. This is currently used in the Clinical Portal for Referrals.

Usage	Homepages and Patient Context
Clause	Joins on Clinic / Specialty / Staff Teams

@author: Orion Health [Tim Panoho]
@created: 2015-05-01
@reference: CCR-101, CCR-102
 
 !!!  Important Notes  !!! 
*/ 
SELECT  DISTINCT 
			spec.MAIN_IDENT AS SpecialtyCode, 
			spec.[DESCRIPTION] AS Specialty
FROM        SPECIALTIES AS spec
     INNER JOIN  HEALTH_ORGANISATIONS AS ho  WITH (nolock) ON spec.OWNER_HEORG_REFNO = ho.HEORG_REFNO 
WHERE     spec.END_DTTM is null
AND  (ISNULL(spec.ARCHV_FLAG, ''N'') = ''N'')  
			AND (ISNULL(spec.ARCHV_FLAG, ''N'') = ''N'') 
			AND (ISNULL(ho.ARCHV_FLAG, ''N'') = ''N'')
			AND (ho.MAIN_IDENT IN (''DHHCC'', ''ACTCC'', ''CHCACT''))

'
GO
/****** Object:  View [dbo].[Orion_CWSReferrers]    Script Date: 06/17/2015 14:54:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Orion_CWSReferrers]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[Orion_CWSReferrers] 
as
/*
View [dbo].[Orion_CWSReferrers]
[Description] Contains all Referrers that are in ACTPAS. This view is used mainly for Referrals when users want to find a staff team for the Clincians that are referring the patient to a service.
 
@author: Orion Health [Tim Panoho]
@created: 2015-05-01
@reference: No References. 
 
 !!!  Important Notes  !!! 
*/ 
SELECT	    pc.proca_refno, 
			pc.MAIN_IDENT AS pcpClinicianId,
			clintype.MAIN_CODE AS pcpclinicianidtype, 
			title.DESCRIPTION as title,
			pc.SURNAME,
			pc.FORENAME as firstName
			
FROM                  PROF_CARERS AS pc   with(nolock) INNER JOIN
                      REFERENCE_VALUES AS title   with(nolock) ON pc.TITLE_REFNO = title.RFVAL_REFNO INNER JOIN
                      REFERENCE_VALUES AS clintype WITH (nolock) ON pc.PRTYP_REFNO = clintype.RFVAL_REFNO 
WHERE      (ISNULL(pc.ARCHV_FLAG, ''N'') = ''N'')and pc.MAIN_IDENT is not null
'
GO
/****** Object:  View [dbo].[Orion_CWSReferralAdminCategory]    Script Date: 06/17/2015 14:54:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Orion_CWSReferralAdminCategory]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[Orion_CWSReferralAdminCategory]
AS
/*
View [dbo].[Orion_CWSReferralAdminCategory]
[Description] Used in the prepopulation of the Referral form, this view is for adding additional information into the Admin Category section of the Referral. It is designed to show a HACC flag if the client has been identified with HACC.
 
@author: Orion Health [Tim Panoho]
@created: 2015-05-01
@reference: CCR-92
 
 !!!  Important Notes  !!!  
 Used in DAS CWS Prepopulation for the referal adaptor.
*/
SELECT     
	ref.PATNT_REFNO, 
	pat.PASID as patientID, 
	ref.REFRL_REFNO AS referralID, 
	rv.DESCRIPTION AS AdminCatDesc, 
	rv.MAIN_CODE AS AdminCatCode, 
	ho.MAIN_IDENT AS facility
FROM         REFERRALS AS ref with (nolock) INNER JOIN
                      REFERENCE_VALUES AS rv  with (nolock) ON ref.ADCAT_REFNO = rv.RFVAL_REFNO INNER JOIN
                      HEALTH_ORGANISATIONS AS ho  with (nolock) ON ref.OWNER_HEORG_REFNO = ho.HEORG_REFNO INNER JOIN
                      PATIENTS AS pat  with (nolock) ON ref.PATNT_REFNO = pat.PATNT_REFNO
WHERE       (ISNULL(ref.ARCHV_FLAG, ''N'') = ''N'') 
			AND (ISNULL(rv.ARCHV_FLAG, ''N'') = ''N'') 
			AND (ISNULL(pat.ARCHV_FLAG, ''N'') = ''N'') 
			AND (ISNULL(ho.ARCHV_FLAG, ''N'') = ''N'') 
			AND (ho.MAIN_IDENT IN (''DHHCC'', ''ACTCC'', ''CHCACT'')) 
			AND (pat.MERGE_MINOR_FLAG = ''N'')
'
GO
/****** Object:  View [dbo].[Orion_CWSReferenceValues]    Script Date: 06/17/2015 14:54:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Orion_CWSReferenceValues]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[Orion_CWSReferenceValues]
as
/*
View [dbo].[Orion_CWSReferenceValues]
[Description] Used in the webservices and provides the correct reference values for the codes in ACTPAS.
 
@author: Orion Health [Tim Panoho]
@created: 2015-05-01
@reference: CCR-103
 
 !!!  Important Notes  !!!  
 This view is required for understanding the values for the lookups in ACTPAS e.g. Source of Referral = GP = 3.
 
*/
SELECT RFVDM_CODE
, DESCRIPTION
, MAIN_CODE
, OWNER_HEORG_REFNO
FROM REFERENCE_VALUES
WHERE  (ISNULL(ARCHV_FLAG, ''N'') = ''N'')
'
GO
/****** Object:  View [dbo].[Orion_CWSPatLivingArrangements]    Script Date: 06/17/2015 14:54:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Orion_CWSPatLivingArrangements]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[Orion_CWSPatLivingArrangements]
AS
/*
View [dbo].[Orion_CWSPatLivingArrangements]
[Description] Used in the prepopulation of the Social History form, this view is for adding additional information into the living arragement section of the Social History. It is designed to show the patients current living arrangements record in ACTPAS.
 
@author: Orion Health [Tim Panoho]
@created: 2015-05-01
@reference: CCR-92
 
 !!!  Important Notes  !!!  
 Used in DAS CWS Prepopulation for the social history adaptor.
*/
SELECT      patliv.PATNT_REFNO, 
			rv.DESCRIPTION AS LivingArrangement, 
			patliv.START_DTTM AS StartDate, 
			patliv.END_DTTM AS EndDate
FROM        PATNT_LIVING_ARRANGEMENTS AS patliv 
				INNER JOIN  REFERENCE_VALUES AS rv  with (nolock) ON patliv.MPILA_REFNO = rv.RFVAL_REFNO 
WHERE   (ISNULL(patliv.ARCHV_FLAG, ''N'') = ''N'') 
		AND (ISNULL(rv.ARCHV_FLAG, ''N'') = ''N'')
'
GO
/****** Object:  View [dbo].[orion_CWSPatientPersonalContacts]    Script Date: 06/17/2015 14:54:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[orion_CWSPatientPersonalContacts]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[orion_CWSPatientPersonalContacts]
AS
/*
View [dbo].[orion_CWSPatientPersonalContacts]
[Description] Used in the prepopulation of the Referral form, this view is for adding additional information into the Patient Demographic of the Referral Form. It is designed to show the patients current Patient Demographic in ACTPAS.
 
@author: Orion Health [Tim Panoho]
@created: 2015-05-01
@reference: CCR-92
 
 !!!  Important Notes  !!!  
 Used in DAS CWS Prepopulation for the Referral adaptor.
*/
SELECT		        ppc.PATNT_REFNO, 
					p.PASID, 
					petyp.MAIN_CODE AS contactType, 
					title.DESCRIPTION AS title, 
					ISNULL(pc.FORENAME, '''') AS firstName, 
					ISNULL(pc.SURNAME, '''') AS surname, 
					reltn.DESCRIPTION AS relationship, 
					spokl.DESCRIPTION AS preferredLanguage, 
					ISNULL(pc.INTRP_REQD_FLAG, ''N'') AS interpreterRequired, 
					PHONE.LINE1 AS homePhone, 
					MOBIL.LINE1 AS mobilePhone, 
					WKTEL.LINE1 AS workPhone, 
					POSTL.LINE1 AS addressLine1, 
					postl.LINE2 as addressLine2,
					POSTL.PCODE as pcode, 
					POSTL.Suburb, 
					POSTL.STATE_CODE as state, 
					POSTL.cntry as country, 
					ppc.START_DTTM, 
					ppc.END_DTTM
FROM         PATIENT_PERSONAL_CARERS AS ppc WITH (nolock) LEFT OUTER JOIN
                      Orion_PERCA_addresses AS POSTL WITH (nolock) ON ppc.PERCA_REFNO = POSTL.perca_refno AND POSTL.adtyp_code = ''POSTL'' LEFT OUTER JOIN
                      Orion_PERCA_addresses AS MOBIL WITH (nolock) ON ppc.PERCA_REFNO = MOBIL.perca_refno AND MOBIL.adtyp_code = ''MOB'' INNER JOIN
                      Orion_PERCA_addresses AS PHONE WITH (nolock) ON ppc.PERCA_REFNO = PHONE.perca_refno AND PHONE.adtyp_code = ''PHONE'' LEFT OUTER JOIN
                      Orion_PERCA_addresses AS WKTEL WITH (nolock) ON ppc.PERCA_REFNO = WKTEL.perca_refno AND WKTEL.adtyp_code = ''WKTEL'' INNER JOIN
                      REFERENCE_VALUES AS petyp WITH (nolock) ON ppc.PETYP_REFNO = petyp.RFVAL_REFNO INNER JOIN
                      PERSONAL_CARERS AS pc WITH (nolock) ON ppc.PERCA_REFNO = pc.PERCA_REFNO INNER JOIN
                      REFERENCE_VALUES AS reltn WITH (nolock) ON ppc.RELTN_REFNO = reltn.RFVAL_REFNO INNER JOIN
                      REFERENCE_VALUES AS title WITH (nolock) ON pc.TITLE_REFNO = title.RFVAL_REFNO INNER JOIN
                      REFERENCE_VALUES AS spokl WITH (nolock) ON pc.SPOKL_REFNO = spokl.RFVAL_REFNO INNER JOIN
                      PATIENTS AS p WITH (nolock) ON ppc.PATNT_REFNO = p.PATNT_REFNO
WHERE     (ISNULL(ppc.ARCHV_FLAG, ''N'') = ''N'') AND (petyp.MAIN_CODE = ''EMERG'' OR petyp.MAIN_CODE = ''NOK'')
'
GO
/****** Object:  View [dbo].[Orion_CWSReferrals]    Script Date: 06/17/2015 14:54:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Orion_CWSReferrals]'))
EXEC dbo.sp_executesql @statement = N'

CREATE VIEW [dbo].[Orion_CWSReferrals]
as

/*
View [dbo].[Orion_CWSReferrals]
[Description] Used in the Rhapsody routes to lookup a currently created referral from ACTPAS. This is for a limitation in the webservice where a referral Id is not returned. This view will be extended to a Clinical Portal worklist.
 
@author: Orion Health [Tim Panoho]
@created: 2015-05-01
@reference: 
 
 !!!  Important Notes  !!!  
*/ 

SELECT p.PASID AS PatientId,
		   r.REFRL_REFNO AS referralID, 
		   r.RECVD_DTTM AS RecievedDate, 
		   prity.DESCRIPTION AS Priority, 
		   steam.CODE AS ReferredToTeamCode, 
		   steam.DESCRIPTION AS ReferredToTeam, 
           PC.MAIN_IDENT AS ReferredToClinicianID,
           clintype.MAIN_CODE AS ReferredToClinicanIDType, 
           SP.MAIN_IDENT AS ReferredtoSpecialtyCode,
           SP.DESCRIPTION AS ReferredtoSpecialty, 
           GP.MAIN_IDENT AS ReferredByID, 
           GPtype.MAIN_CODE AS ReferredByIDType, 
           r.CLOSR_DATE AS CompletedDate, 
           r.CANCD_DTTM AS CancelledDate, 
           retyp.DESCRIPTION AS ReferralType, 
           dbo.Orion_refl_notes.note AS comment, 
           r.EXPIRY_DTTM AS ExpiryDate, 
           r.USER_MODIF AS LastModifiedBy, 
           ho.MAIN_IDENT AS Facility 
           
FROM         STAFF_TEAMS AS steam with(nolock) RIGHT OUTER JOIN
                      HEALTH_ORGANISATIONS AS ho  with(nolock) INNER JOIN
                      REFERRALS AS r  with(nolock) INNER JOIN
                      PATIENTS AS p  with(nolock) ON r.PATNT_REFNO = p.PATNT_REFNO INNER JOIN
                      REFERENCE_VALUES AS retyp  with(nolock) ON r.RETYP_REFNO = retyp.RFVAL_REFNO LEFT OUTER JOIN
                      SPECIALTIES AS SP  with(nolock) ON r.REFTO_SPECT_REFNO = SP.SPECT_REFNO INNER JOIN
                      REFERENCE_VALUES AS prity  with(nolock) ON r.PRITY_REFNO = prity.RFVAL_REFNO ON ho.HEORG_REFNO = r.OWNER_HEORG_REFNO LEFT OUTER JOIN
                      Orion_refl_notes  with(nolock) ON r.REFRL_REFNO = dbo.Orion_refl_notes.sorce_refno ON steam.STEAM_REFNO = r.REFTO_STEAM_REFNO LEFT OUTER JOIN
                      REFERENCE_VALUES  AS clintype  with(nolock) INNER JOIN
                      PROF_CARERS AS PC with(nolock)  ON clintype.RFVAL_REFNO = PC.PRTYP_REFNO ON r.REFTO_PROCA_REFNO = PC.PROCA_REFNO LEFT OUTER JOIN
                      REFERENCE_VALUES AS GPtype with(nolock)  INNER JOIN
                      PROF_CARERS AS GP with(nolock)  ON GPtype.RFVAL_REFNO = GP.PRTYP_REFNO ON r.REFBY_PROCA_REFNO = GP.PROCA_REFNO
WHERE     (ISNULL(r.ARCHV_FLAG, ''N'') = ''N'')
AND ho.MAIN_IDENT IN (''DHHCC'',''ACTCC'',''CHCACT'')
and     (ISNULL(steam.ARCHV_FLAG, ''N'') = ''N'')
and     (ISNULL(sp.ARCHV_FLAG, ''N'') = ''N'')
and     (ISNULL(p.ARCHV_FLAG, ''N'') = ''N'')
AND     (ISNULL(pc.ARCHV_FLAG, ''N'') in (''N'',''D'',''C'')) -- added 6/2/13 to include providers marked for deletion but haven''t been deletes as yet, as they still appear on ACTPAS with a archive_flag=''D''
and     (ISNULL(gp.ARCHV_FLAG, ''N'') in (''N'',''D'',''C'')) -- added 6/2/13 to include providers marked for deletion but haven''t been deletes as yet, as they still appear on ACTPAS with a archive_flag=''D''
and     (ISNULL(ho.ARCHV_FLAG, ''N'') = ''N'')
 
'
GO
/****** Object:  View [dbo].[Orion_CWSCommunityReferrals]    Script Date: 06/17/2015 14:54:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Orion_CWSCommunityReferrals]'))
EXEC dbo.sp_executesql @statement = N'
CREATE view [dbo].[Orion_CWSCommunityReferrals]
as
/*
View [dbo].[Orion_CWSCommunityReferrals]
[Description] To display all referrals in ACTPAS via a view, this is to capture what is an existing referral in ACTPAS to that that is not captured in the CCR solution i.e. I have created a referral in ACTPAS not CCR workflow - I will see 2 lists in the CCR community solution.

Usage	Homepages and Patient Context
Clause	 

@author: Orion Health [Tim Panoho]
@created: 2015-05-01
@reference: CCR-1431
 
 !!!  Important Notes  !!! 
 
 There maybe performance hits on this as it attempts to find all appointments and is a very large number of records to scan. Care is required when implementing with this view.
 
*/

SELECT p.PASID AS PatientId,
		   r.REFRL_REFNO AS referralID, 
		   r.RECVD_DTTM AS RecievedDate, 
		   prity.DESCRIPTION AS Priority, 
		   steam.DESCRIPTION AS ReferredToTeam, 
           PC.MAIN_IDENT AS ReferredToClinicianID,
           clintype.MAIN_CODE AS ReferredToClinicanIDType, 
           SP.DESCRIPTION AS ReferredtoSpecialty, 
           GP.MAIN_IDENT AS ReferredByID, 
           GPtype.MAIN_CODE AS ReferredByIDType, 
           r.CLOSR_DATE AS CompletedDate, 
           r.CANCD_DTTM AS CancelledDate, 
           retyp.DESCRIPTION AS ReferralType, 
           dbo.Orion_refl_notes.note AS comment, 
           r.EXPIRY_DTTM AS ExpiryDate, 
           r.USER_MODIF AS LastModifiedBy, 
           ho.MAIN_IDENT AS Facility
           
FROM         STAFF_TEAMS AS steam with(nolock) RIGHT OUTER JOIN
                      HEALTH_ORGANISATIONS AS ho  with(nolock) INNER JOIN
                      REFERRALS AS r  with(nolock) INNER JOIN
                      PATIENTS AS p  with(nolock) ON r.PATNT_REFNO = p.PATNT_REFNO INNER JOIN
                      REFERENCE_VALUES AS retyp  with(nolock) ON r.RETYP_REFNO = retyp.RFVAL_REFNO LEFT OUTER JOIN
                      SPECIALTIES AS SP  with(nolock) ON r.REFTO_SPECT_REFNO = SP.SPECT_REFNO INNER JOIN
                      REFERENCE_VALUES AS prity  with(nolock) ON r.PRITY_REFNO = prity.RFVAL_REFNO ON ho.HEORG_REFNO = r.OWNER_HEORG_REFNO LEFT OUTER JOIN
                      Orion_refl_notes  with(nolock) ON r.REFRL_REFNO = dbo.Orion_refl_notes.sorce_refno ON steam.STEAM_REFNO = r.REFTO_STEAM_REFNO LEFT OUTER JOIN
                      REFERENCE_VALUES  AS clintype  with(nolock) INNER JOIN
                      PROF_CARERS AS PC with(nolock)  ON clintype.RFVAL_REFNO = PC.PRTYP_REFNO ON r.REFTO_PROCA_REFNO = PC.PROCA_REFNO LEFT OUTER JOIN
                      REFERENCE_VALUES AS GPtype with(nolock)  INNER JOIN
                      PROF_CARERS AS GP with(nolock)  ON GPtype.RFVAL_REFNO = GP.PRTYP_REFNO ON r.REFBY_PROCA_REFNO = GP.PROCA_REFNO
WHERE     (ISNULL(r.ARCHV_FLAG, ''N'') = ''N'')
AND ho.MAIN_IDENT IN (''DHHCC'',''ACTCC'',''CHCACT'')
and     (ISNULL(steam.ARCHV_FLAG, ''N'') = ''N'')
and     (ISNULL(sp.ARCHV_FLAG, ''N'') = ''N'')
and     (ISNULL(p.ARCHV_FLAG, ''N'') = ''N'')
AND     (ISNULL(pc.ARCHV_FLAG, ''N'') in (''N'',''D'',''C'')) -- added 6/2/13 to include providers marked for deletion but haven''t been deletes as yet, as they still appear on ACTPAS with a archive_flag=''D''
and     (ISNULL(gp.ARCHV_FLAG, ''N'') in (''N'',''D'',''C'')) -- added 6/2/13 to include providers marked for deletion but haven''t been deletes as yet, as they still appear on ACTPAS with a archive_flag=''D''
and     (ISNULL(ho.ARCHV_FLAG, ''N'') = ''N'')

'
GO
/****** Object:  View [dbo].[Orion_CWSPatientDemographics]    Script Date: 06/17/2015 14:54:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Orion_CWSPatientDemographics]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[Orion_CWSPatientDemographics]
AS
/*
View [dbo].[Orion_CWSPatientDemographics]
[Description] Used in the prepopulation of the Referral form, this view is for adding additional information into the Patient Demographic of the Referral Form. It is designed to show the patients current Patient Demographic in ACTPAS.
 
@author: Orion Health [Tim Panoho]
@created: 2015-05-01
@reference: CCR-92
 
 !!!  Important Notes  !!!  
 Used in DAS CWS Prepopulation for the Referral adaptor.
*/
SELECT     p.PATNT_REFNO AS patnt_refno, 
			p.PASID AS patientID, 
			p.SURNAME AS familyName, 
			ISNULL(p.SECOND_FORENAME, '''') + '' '' + ISNULL(p.THIRD_FORENAME, '''') + '' '' + ISNULL(p.FOURTH_FORENAME, '''') AS middleInitialOrName, 
			p.FORENAME AS givenName, 
			p.DTTM_OF_BIRTH AS dateTimeOfBirth, 
			 CASE p.sexxx_refno WHEN 1978 THEN ''M'' WHEN 1976 THEN ''F'' ELSE ''U'' END AS sex, 
			 phone.LINE1 AS phone, 
			 mobile.LINE1 AS Mobile, 
			WKTEL.LINE1 AS WorkPhone, 
			postl.LINE1 AS streetaddress1, 
			postl.LINE2 AS streetaddress2, 
			postl.Suburb AS city, 
			postl.STATE_CODE AS stateorprovince, 
			postl.PCODE AS ziporpostalcode, 
			postl.cntry AS country, 
			ISNULL(pids.IDENTIFIER, ''NONE'') AS MedicareNo, 
			spokl.DESCRIPTION AS preferredLanguage, 
			ISNULL(p.INTRP_REQD_FLAG, ''N'') AS interpreterRequired, 
			indig.DESCRIPTION AS IndigenousStatus, 
			marital.DESCRIPTION AS MaritalStatus, 
			p.DECSD_FLAG AS Deceased
FROM         PATIENTS AS p WITH (nolock) INNER JOIN
                      REFERENCE_VALUES AS indig WITH (nolock) ON p.ETHGR_REFNO = indig.RFVAL_REFNO LEFT OUTER JOIN
                      REFERENCE_VALUES AS marital WITH (nolock) ON p.MARRY_REFNO = marital.RFVAL_REFNO LEFT OUTER JOIN
                      Orion_PATNT_POSTL_addresses AS postl WITH (nolock) ON p.PATNT_REFNO = postl.PATNT_REFNO AND postl.ROLES_REFNO IN
                          (SELECT     TOP (1) ROLES_REFNO
                            FROM          Orion_PATNT_POSTL_addresses WITH (nolock)
                            WHERE      (PATNT_REFNO = postl.PATNT_REFNO)
                            ORDER BY START_DTTM DESC) LEFT OUTER JOIN
                      Orion_PATNT_PHONE_addresses AS phone WITH (nolock) ON p.PATNT_REFNO = phone.PATNT_REFNO AND phone.ROLES_REFNO IN
                          (SELECT     TOP (1) ROLES_REFNO
                            FROM          Orion_PATNT_PHONE_addresses WITH (nolock)
                            WHERE      (PATNT_REFNO = phone.PATNT_REFNO)
                            ORDER BY START_DTTM DESC) LEFT OUTER JOIN
                      REFERENCE_VALUES AS spokl WITH (nolock) ON p.SPOKL_REFNO = spokl.RFVAL_REFNO LEFT OUTER JOIN
                      Orion_PATNT_WKTEL_addresses AS WKTEL WITH (nolock) ON p.PATNT_REFNO = WKTEL.PATNT_REFNO AND WKTEL.ROLES_REFNO IN
                          (SELECT     TOP (1) ROLES_REFNO
                            FROM          Orion_PATNT_WKTEL_addresses WITH (nolock)
                            WHERE      (PATNT_REFNO = WKTEL.PATNT_REFNO)
                            ORDER BY START_DTTM DESC) LEFT OUTER JOIN
                      Orion_PATNT_MOBILE_addresses AS mobile WITH (nolock) ON p.PATNT_REFNO = mobile.PATNT_REFNO AND mobile.ROLES_REFNO IN
                          (SELECT     TOP (1) ROLES_REFNO
                            FROM          Orion_PATNT_MOBILE_addresses WITH (nolock)
                            WHERE      (PATNT_REFNO = mobile.PATNT_REFNO)
                            ORDER BY START_DTTM DESC) LEFT OUTER JOIN
                      PATIENT_IDS AS pids WITH (nolock) ON p.PATNT_REFNO = pids.PATNT_REFNO AND pids.PATID_REFNO in 
							(select top (1) PATID_REFNO 
							 from PATIENT_IDS WITH (nolock)
							 where PATNT_REFNO=p.PATNT_REFNO 
							 AND PITYP_REFNO = 1450 
							 AND END_DTTM IS NULL 
							 AND (ISNULL(ARCHV_FLAG, ''N'') = ''N'') 
							 ORDER BY START_DTTM DESC)
							 WHERE     (ISNULL(p.ARCHV_FLAG, ''N'') = ''N'') 
							 AND (p.MERGE_MINOR_FLAG = ''N'')

'
GO
/****** Object:  View [dbo].[orion_CWSCurrentPatientPersonalContacts]    Script Date: 06/17/2015 14:54:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[orion_CWSCurrentPatientPersonalContacts]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[orion_CWSCurrentPatientPersonalContacts]
AS
/*
View [dbo].[orion_CWSCurrentPatientPersonalContacts]
[Description] Used in the prepopulation of the Referral form, this view is for adding additional information into the Patient Demographic of the Referral Form. It is designed to show the patients current Patient Demographic in ACTPAS.
 
@author: Orion Health [Tim Panoho]
@created: 2015-05-01
@reference: CCR-92
 
 !!!  Important Notes  !!!  
 Used in DAS CWS Prepopulation for the Referral adaptor.
*/
SELECT		ppc.PATNT_REFNO, 
					p.PASID, 
					petyp.MAIN_CODE AS contactType, 
					title.DESCRIPTION AS title, 
					ISNULL(pc.FORENAME, '''') AS firstName, 
					ISNULL(pc.SURNAME, '''') AS surname, 
					reltn.DESCRIPTION AS relationship, 
					spokl.DESCRIPTION AS preferredLanguage, 
					ISNULL(pc.INTRP_REQD_FLAG, ''N'') AS interpreterRequired, 
					PHONE.LINE1 AS homePhone, 
					MOBIL.LINE1 AS mobilePhone, 
					WKTEL.LINE1 AS workPhone, 
					POSTL.LINE1 AS addressLine1, 
					postl.LINE2 as addressLine2,
					POSTL.PCODE as pcode, 
					POSTL.Suburb, 
					POSTL.STATE_CODE as state, 
					POSTL.cntry as country, 
					ppc.START_DTTM,
					ppc.END_DTTM
FROM         PATIENT_PERSONAL_CARERS AS ppc WITH (nolock) LEFT OUTER JOIN
                      Orion_PERCA_addresses AS POSTL WITH (nolock) ON ppc.PERCA_REFNO = POSTL.perca_refno AND POSTL.adtyp_code = ''POSTL'' LEFT OUTER JOIN
                      Orion_PERCA_addresses AS MOBIL WITH (nolock) ON ppc.PERCA_REFNO = MOBIL.perca_refno AND MOBIL.adtyp_code = ''MOB'' INNER JOIN
                      Orion_PERCA_addresses AS PHONE WITH (nolock) ON ppc.PERCA_REFNO = PHONE.perca_refno AND PHONE.adtyp_code = ''PHONE'' LEFT OUTER JOIN
                      Orion_PERCA_addresses AS WKTEL WITH (nolock) ON ppc.PERCA_REFNO = WKTEL.perca_refno AND WKTEL.adtyp_code = ''WKTEL'' INNER JOIN
                      REFERENCE_VALUES AS petyp WITH (nolock) ON ppc.PETYP_REFNO = petyp.RFVAL_REFNO INNER JOIN
                      PERSONAL_CARERS AS pc WITH (nolock) ON ppc.PERCA_REFNO = pc.PERCA_REFNO INNER JOIN
                      REFERENCE_VALUES AS reltn WITH (nolock) ON ppc.RELTN_REFNO = reltn.RFVAL_REFNO INNER JOIN
                      REFERENCE_VALUES AS title WITH (nolock) ON pc.TITLE_REFNO = title.RFVAL_REFNO INNER JOIN
                      REFERENCE_VALUES AS spokl WITH (nolock) ON pc.SPOKL_REFNO = spokl.RFVAL_REFNO INNER JOIN
                      PATIENTS AS p WITH (nolock) ON ppc.PATNT_REFNO = p.PATNT_REFNO
WHERE     (ISNULL(ppc.ARCHV_FLAG, ''N'') = ''N'') AND (petyp.MAIN_CODE = ''EMERG'' OR petyp.MAIN_CODE = ''NOK'')
		and (ppc.END_DTTM IS NULL or ppc.END_DTTM > GetDate())
'
GO
/****** Object:  View [dbo].[Orion_CWSGPReferrerAddresses]    Script Date: 06/17/2015 14:54:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Orion_CWSGPReferrerAddresses]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[Orion_CWSGPReferrerAddresses] 
as
/*
View [dbo].[Orion_CWSGPReferrerAddresses]
[Description] Used in the prepopulation of the Referral form, this view is for adding additional information into the Patient Demographic of the Referral Form. It is designed to show the patients current Patient Demographic in ACTPAS.
 
@author: Orion Health [Tim Panoho]
@created: 2015-05-01
@reference: CCR-92
 
 !!!  Important Notes  !!!  
 Used in DAS CWS Prepopulation for the Referral adaptor.
*/
SELECT	     		  ho.MAIN_IDENT AS pcpClinicId, 
					  ho.DESCRIPTION  AS pcpclinicname, 
                      postl.line1  AS streetaddress1, 
                      postl.line2  AS streetaddress2, 
                      postl.suburb AS city, 
                      postl.state_code AS stateorprovince, 
                      postl.pcode AS ziporpostalcode, 
                      postl.cntry  AS country, 
                      phone.line1  AS phone, 
                      fax.line1 AS fax, 
                      ho.END_DTTM as healthOrg_enddttm
FROM         dbo.REFERENCE_VALUES AS hotyp with(nolock)  INNER JOIN
                      dbo.HEALTH_ORGANISATIONS AS ho  with(nolock) LEFT OUTER JOIN
                      dbo.Orion_HEORG_addresses AS postl  with(nolock) ON ho.HEORG_REFNO = postl.heorg_refno AND postl.adtyp_code = ''POSTL'' LEFT OUTER JOIN
                      dbo.Orion_HEORG_addresses AS phone  with(nolock) ON ho.HEORG_REFNO = phone.heorg_refno AND phone.adtyp_code = ''PHONE'' LEFT OUTER JOIN
                      dbo.Orion_HEORG_addresses AS fax  with(nolock) ON ho.HEORG_REFNO = fax.heorg_refno AND fax.adtyp_code = ''FAX'' 
                       ON  hotyp.RFVAL_REFNO = ho.HOTYP_REFNO
WHERE     (ISNULL(ho.ARCHV_FLAG, ''N'') = ''N'')
'
GO
/****** Object:  View [dbo].[Orion_CWSGPLookup]    Script Date: 06/17/2015 14:54:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Orion_CWSGPLookup]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[Orion_CWSGPLookup]
AS
/*
View [dbo].[Orion_CWSGPLookup]
[Description] To find all GPs in ACTPAS. This is currently used in the Clinical Portal for Referral GP lookup.

Usage	Homepages and Patient Context
Clause	Joins on Clinician / Specialty / Staff Teams

@author: Orion Health [Tim Panoho]
@created: 2015-05-01
@reference: CCR-1460
 
 !!!  Important Notes  !!! 
*/
SELECT ClinicianClinicList.ClinicianId as ClinicianId , 
ClinicianClinicList.ClinicianIdType as ClinicianIdType , 
clinicianView.roleCode as RoleType , 
substring(clinicianView.familyName,1,35) as Surname , 
substring(clinicianView.givenName,1,30) as FirstGivenName , 
substring(clinicianView.middleInitialOrName,1,30) as SecondGivenName ,  
CASE title WHEN ''Associate Professor'' THEN ''A/Prof'' ELSE substring(clinicianView.Title,1,10) END AS Title, 
ClinicianClinicList.ClinicId ClinicId , 
substring(ClinicView.clinicName,1,30) as ClinicName , 
--removed for SMT6.6 testing: substring(ClinicView.streetAddress1,1, 20) as AddressLine1 , 
ClinicView.streetAddress1 as AddressLine1 , 
-- removed for SMT6.6 testing: substring(ClinicView.streetAddress2,1,20) as AddressLine2 , 
ClinicView.streetAddress2 as AddressLine2 ,   
ClinicView.city as City , 
ClinicView.stateOrProvince as State , 
ClinicView.zipOrPostalCode as PostCode ,  
ClinicView.email as Email , 
ClinicView.phone as Phone , 
ClinicView.Fax as Fax , 
ClinicView.HealthLinkMailbox as HealthLinkMailbox  

FROM 
(
select clinicianId,clinicianIDType,facilityCode as clinicID 
from Orion_Clinician_Facility with(nolock)
union
select pcpClinicianID  as clinicianId,pcpClinicianIDType as clinicianIDType, pcpClinicID as clinicID from 
Orion_PCP_PCPClinic with(nolock)

) ClinicianClinicList 

INNER JOIN
(
select ClinicianID, ClinicianIDType, Title, FamilyName, MiddleInitialOrName, GivenName, RoleCode from Orion_Clinicians with(nolock)
union
select pcpClinicianID, pcpClinicianIDType, Title, FamilyName, MiddleInitialOrName, GivenName, RoleCode from Orion_PCPs with(nolock)
) clinicianView
 on clinicianView.clinicianId=ClinicianClinicList.clinicianId
 and clinicianView.clinicianIdType=ClinicianClinicList.clinicianIdType

INNER JOIN
(
 select code as clinicID,
 description as clinicName,
 '''' as streetAddress1 ,'''' as streetAddress2,
 '''' as stateOrProvince, '''' as city,
 '''' as zipOrPostalCode, '''' as country,
 '''' as Phone, '''' as Fax,'''' as email,'''' as HealthLinkMailbox
 from Orion_Facilities with(nolock)
 union
 select pcpClinicID as clinicID,
 pcpClinicName as clinicName,
 streetAddress1  ,
 streetAddress2 ,
 stateOrProvince ,
 city ,
 zipOrPostalCode ,
 country ,
 phone ,fax ,email,HealthLinkMailbox
 from Orion_PCPClinics with(nolock)

) ClinicView
 ON ClinicView.clinicID=ClinicianClinicList.clinicID


'
GO

