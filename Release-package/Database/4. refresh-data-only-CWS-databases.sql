/*
[4. refresh-data-only-CWS-databases.sql]
[Description] Deletes records from the Referral databases and refreshes the system to a base line configuration. The script also adds missing values and should only be run when migrating.
 
@author: Orion Health [Tim Panoho]
@created: 2015-05-01
@reference: Specific CCR Solution deletes and creates tables and views that are located on the OH_CM_Clinical OH_CM_Task and OH_CM_Custom Databases
 
 !!!  Important Notes  !!!
 To ONLY be run for Migration Purposes.
 
*/

use OH_CM_clinical;

delete from RefRequest.ERF_ReferralRequest
GO

delete from RefRequest.ERF_ReceivedMessage;
GO

delete from RefRequest.ERF_ExternalId;
GO

delete from RefRequest.ERF_LK_RequestReceiver;
GO

delete from RefRequest.ERF_LK_RequestSource;
GO

delete from RefRequest.ERF_LK_RequestRejectReason;
GO



delete from Referral.ERF_ActionHistory
GO

delete from Referral.ERF_Event
GO

delete from Referral.ERF_Note
GO

delete from Referral.ERF_AssociatedReceiver
GO

delete from Referral.ERF_Referral
GO

delete from Referral.ERF_ReferralMetaData
GO

delete from Referral.ERF_Deferment
GO

delete from Referral.ERF_LK_Acuity
GO

delete from Referral.ERF_LK_Status
GO

delete from Referral.ERF_LK_ReferralReceiver
GO

delete from Referral.ERF_LK_Priority
GO

delete from Referral.ERF_LK_ReferralSource
GO
 

delete from PathwayEnrollment.PES_PathwayEnrollment
GO  


use OH_CM_task;



delete from dbo.PersistentTask




use OH_CM_Custom

DELETE FROM dbo.PathwayToSubpathway_Mapping
DELETE FROM dbo.PathwayToSubpathwayMappingHistory
DELETE FROM dbo.ReferralToPathwayMapping
DELETE FROM dbo.ReferralToPathwayMappingHistory

GO 

use OH_CM_Clinical -- issue to add closed status into referrals
GO
INSERT INTO OH_CM_Clinical.Referral.ERF_LK_Status ([code]
           ,[codingSystem]) 
           VALUES ( 'int_cr_closed' , 'Orion' )












