/*
[2. create-CWS-databases.sql]
[Description] Creates CWS databases specific for the CCR solution. Used in the Clinical Portal, for the CCR WIC and Referrals Solution.  There are some references also with in the Rhapsody Engine specific to Referrals.
 
@author: Orion Health [Tim Panoho]
@created: 2015-05-01
@reference: Specific CCR Solution views OH_CM_ Databases
 
 !!!  Important Notes  !!!
1. OrionPortal requires access to these views so that we are able to access them from the Clinical Portal.
2. The Databases are set to isolation mode on and is required.

*/
USE [master]
GO  
/****** Object:  Database [OH_CM_Application]    Script Date: 02/05/2015 11:31:52 ******/
IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'OH_CM_Application')
ALTER database [OH_CM_Application] set single_user with rollback immediate
DROP DATABASE [OH_CM_Application]
GO 
/****** Object:  Database [OH_CM_Authentication]    Script Date: 02/05/2015 11:31:52 ******/
IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'OH_CM_Authentication')
ALTER database [OH_CM_Authentication] set single_user with rollback immediate
DROP DATABASE [OH_CM_Authentication]
GO
/****** Object:  Database [OH_CM_cDocumentRegistry]    Script Date: 02/05/2015 11:31:52 ******/
IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'OH_CM_cDocumentRegistry')
ALTER database [OH_CM_cDocumentRegistry] set single_user with rollback immediate
DROP DATABASE [OH_CM_cDocumentRegistry]
GO
/****** Object:  Database [OH_CM_cDocumentRepository]    Script Date: 02/05/2015 11:31:52 ******/
IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'OH_CM_cDocumentRepository')
ALTER database [OH_CM_cDocumentRepository] set single_user with rollback immediate
DROP DATABASE [OH_CM_cDocumentRepository]
GO
/****** Object:  Database [OH_CM_cForms]    Script Date: 02/05/2015 11:31:52 ******/
IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'OH_CM_cForms')
ALTER database [OH_CM_cForms] set single_user with rollback immediate
DROP DATABASE [OH_CM_cForms]
GO
/****** Object:  Database [OH_CM_Clinical]    Script Date: 02/05/2015 11:31:52 ******/
IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'OH_CM_Clinical')
ALTER database [OH_CM_Clinical] set single_user with rollback immediate
DROP DATABASE [OH_CM_Clinical]
GO
/****** Object:  Database [OH_CM_Configuration]    Script Date: 02/05/2015 11:31:52 ******/
IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'OH_CM_Configuration')
ALTER database [OH_CM_Configuration] set single_user with rollback immediate
DROP DATABASE [OH_CM_Configuration]
GO
/****** Object:  Database [OH_CM_cRepository]    Script Date: 02/05/2015 11:31:52 ******/
IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'OH_CM_cRepository')
ALTER database [OH_CM_cRepository] set single_user with rollback immediate
DROP DATABASE [OH_CM_cRepository]
GO
/****** Object:  Database [OH_CM_cDictionary]    Script Date: 02/05/2015 11:31:52 ******/
IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'OH_CM_cDictionary')
ALTER database [OH_CM_cDictionary] set single_user with rollback immediate
DROP DATABASE [OH_CM_cDictionary]
GO
/****** Object:  Database [OH_CM_Custom]    Script Date: 02/05/2015 11:31:52 ******/
IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'OH_CM_Custom')
ALTER database [OH_CM_Custom] set single_user with rollback immediate
DROP DATABASE [OH_CM_Custom]
GO
/****** Object:  Database [OH_CM_medicationManagement]    Script Date: 02/05/2015 11:31:52 ******/
IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'OH_CM_medicationManagement')
ALTER database [OH_CM_medicationManagement] set single_user with rollback immediate
DROP DATABASE [OH_CM_medicationManagement]
GO

/****** Object:  Database [OH_CM_MessageLog]    Script Date: 02/05/2015 11:31:52 ******/
IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'OH_CM_MessageLog')
ALTER database [OH_CM_MessageLog] set single_user with rollback immediate
DROP DATABASE [OH_CM_MessageLog]
GO

/****** Object:  Database [OH_CM_RelationshipStore]    Script Date: 02/05/2015 11:31:52 ******/
IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'OH_CM_RelationshipStore')
ALTER database [OH_CM_RelationshipStore] set single_user with rollback immediate
DROP DATABASE [OH_CM_RelationshipStore]
GO

/****** Object:  Database [OH_CM_Task]    Script Date: 02/05/2015 11:31:52 ******/
IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'OH_CM_Task')
ALTER database [OH_CM_Task] set single_user with rollback immediate
DROP DATABASE [OH_CM_Task]
GO
/****** Object:  Database [OH_cWhiteboard]    Script Date: 02/05/2015 11:31:52 ******/
IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'OH_cWhiteboard')
ALTER database [OH_cWhiteboard] set single_user with rollback immediate
DROP DATABASE [OH_cWhiteboard]
GO 
/****** Object:  Database [OH_CM_Audit]    Script Date: 02/05/2015 11:31:52 ******/
IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'OH_CM_Audit')
ALTER database [OH_CM_Audit] set single_user with rollback immediate
DROP DATABASE [OH_CM_Audit]
GO
USE [master]
GO

 
/****** Object:  Database [OH_CM_Audit]    Script Date: 01/29/2015 21:35:01 ******/
CREATE DATABASE [OH_CM_Audit]

ALTER DATABASE [OH_CM_Audit] SET COMPATIBILITY_LEVEL = 100
GO
USE [OH_CM_Audit]
GO 
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OH_CM_Audit].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE OH_CM_Audit SET READ_COMMITTED_SNAPSHOT ON


CREATE TABLE SchemaMetaData (
	id INTEGER IDENTITY (1, 1) NOT NULL,
	name nvarchar(255) NOT NULL,
	version nvarchar(50) NOT NULL,
	CONSTRAINT PK_SchemaMetaData PRIMARY KEY CLUSTERED (id),
	CONSTRAINT UC_SchemaMetaData UNIQUE(name, version)
);

CREATE TABLE SchemaMetaDataHistory (
	id INTEGER IDENTITY (1, 1) NOT NULL,
	name nvarchar(255),
	version nvarchar(50) NOT NULL,
	updatedBy nvarchar(255) NOT NULL,
	updatedAt datetime NOT NULL,
	comments nvarchar(255) NOT NULL,
	CONSTRAINT PK_SchemaMetaDataHistory PRIMARY KEY CLUSTERED (id)
);

INSERT INTO SchemaMetaData (name, version) VALUES ('SchemaMetaData', '2.0.0.0');
INSERT INTO SchemaMetaDataHistory (name, version, updatedBy, updatedAt, comments) VALUES ('SchemaMetaData', '2.0.0.0', 'Orion Health', GETDATE(), 'Initial Installation');
GO

CREATE TABLE AuditDatabaseKeys (
	tableName char (64) NOT NULL,
	currentKey int NOT NULL DEFAULT '1',
	CONSTRAINT PK_AuditDatabaseKeys PRIMARY KEY NONCLUSTERED (tableName)
);

INSERT INTO AuditDatabaseKeys VALUES ( 'AuditEvent', 1 );

CREATE TABLE AuditEvent (
	eventID int NOT NULL,
	serverID nvarchar (64) NOT NULL,
	loggedTime datetime NOT NULL,
	startTime datetime NOT NULL,
	endTime datetime NULL,
	terminalID nvarchar (64) NULL,
	sessionID nvarchar (64) NULL,
	userID nvarchar(64) NULL,
	eventSource nvarchar (128) NOT NULL,
	eventType nvarchar (128) NOT NULL,
	message nvarchar(512) NULL,
	eventResult nvarchar (3000) NULL,
	CONSTRAINT PK_AUDIT_EVENT PRIMARY KEY NONCLUSTERED (eventID)
);

CREATE CLUSTERED INDEX IX_AE_StartTime ON AuditEvent(startTime);
CREATE INDEX IX_AE_EventType ON AuditEvent(eventType);
CREATE INDEX IX_AE_UserID ON AuditEvent(UserID);

CREATE TABLE AuditEventParameter (
	eventID int NOT NULL REFERENCES AuditEvent(eventID),
	name nvarchar (448) NOT NULL,
	value nvarchar (2048) NULL,
	CONSTRAINT PK_AUDIT_EVENT_PARAMETER PRIMARY KEY NONCLUSTERED (eventID, name)
);

CREATE TABLE AuditEventSource (
	eventSource nvarchar (128) NOT NULL,
	CONSTRAINT PK_AUDIT_EVENT_SOURCE PRIMARY KEY CLUSTERED (eventSource)
);

CREATE TABLE AuditEventType (
	eventType nvarchar (128) NOT NULL,
	CONSTRAINT PK_AUDIT_EVENT_TYPE PRIMARY KEY CLUSTERED (eventType)
);

GO

CREATE VIEW CurrentAuditEventView AS SELECT * FROM AuditEvent WHERE (startTime IN (SELECT MAX(startTime) FROM AuditEvent WHERE startTime > (SELECT MAX(startTime) FROM AuditEvent WHERE eventType = 'Start Up') GROUP BY sessionID)) AND NOT (((eventType = 'Logout' OR eventType = 'Login') AND eventResult = 'Success') OR startTime < DATEADD(second, -300, GETDATE()));
GO 
-- update schema metadata
INSERT INTO SchemaMetaData (name, version) VALUES ('Audit', '1.1.0')
;
INSERT INTO SchemaMetaDataHistory (name, version, updatedBy, updatedAt, comments) VALUES ('Audit', '1.1.0', 'Orion Health', GETDATE(), 'Initial installation script run manually')
;



/****** Object:  Database [OH_CM_Application]    Script Date: 01/29/2015 21:35:01 ******/
CREATE DATABASE [OH_CM_Application]

ALTER DATABASE [OH_CM_Application] SET COMPATIBILITY_LEVEL = 100
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OH_CM_Application].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE OH_CM_Application SET READ_COMMITTED_SNAPSHOT ON
/*Creating Schemas*/
USE [OH_CM_Application]

CREATE TABLE SchemaMetaData (
	id INTEGER IDENTITY (1, 1) NOT NULL,
	name nvarchar(255) NOT NULL,
	version nvarchar(50) NOT NULL,
	CONSTRAINT PK_SchemaMetaData PRIMARY KEY CLUSTERED (id),
	CONSTRAINT UC_SchemaMetaData UNIQUE(name, version)
);

CREATE TABLE SchemaMetaDataHistory (
	id INTEGER IDENTITY (1, 1) NOT NULL,
	name nvarchar(255),
	version nvarchar(50) NOT NULL,
	updatedBy nvarchar(255) NOT NULL,
	updatedAt datetime NOT NULL,
	comments nvarchar(255) NOT NULL,
	CONSTRAINT PK_SchemaMetaDataHistory PRIMARY KEY CLUSTERED (id)
);

INSERT INTO SchemaMetaData (name, version) VALUES ('SchemaMetaData', '2.0.0.0');
INSERT INTO SchemaMetaDataHistory (name, version, updatedBy, updatedAt, comments) VALUES ('SchemaMetaData', '2.0.0.0', 'Orion Health', GETDATE(), 'Initial Installation');



    create table PRF_Attribute (
        id bigint identity not null,
        identityId bigint not null,
        nameId bigint not null,
        valueId bigint null,
        deleted tinyint not null,
        primary key (id)
    );

    create table PRF_AttributeName (
        id bigint identity not null,
        name nvarchar(128) not null unique,
        primary key (id)
    );

    create table PRF_Identity (
        id bigint identity not null,
        name nvarchar(50) not null,
        namespace nvarchar(100) not null,
        primary key (id),
        unique (name, namespace)
    );

    create table PRF_Value (
        id bigint identity not null,
        booleanValue tinyint null,
        doubleValue double precision null,
        longValue bigint null,
        parentValueId bigint null,
        stringValue nvarchar(1024) null,
        valueIndex int null,
        valueType int not null,
        primary key (id)
    );

    create index IX_PRF_Attribute_name on PRF_Attribute (nameId);

    create index IX_PRF_Attribute_owner on PRF_Attribute (identityId);

    alter table PRF_Attribute 
        add constraint FK_PRF_Attribute_nameId 
        foreign key (nameId) 
        references PRF_AttributeName;

    alter table PRF_Attribute 
        add constraint FK_PRF_Attribute_identityId 
        foreign key (identityId) 
        references PRF_Identity;

    alter table PRF_Attribute 
        add constraint FK_PRF_Attribute_valueId 
        foreign key (valueId) 
        references PRF_Value;

    alter table PRF_Value 
        add constraint FK_PRF_Value_parent 
        foreign key (parentValueId) 
        references PRF_Value;

-- update schema metadata
INSERT INTO SchemaMetaData (name, version) VALUES ('Preferences', '6.9.0')
;
INSERT INTO SchemaMetaDataHistory (name, version, updatedBy, updatedAt, comments) VALUES ('Preferences', '6.9.0', 'Orion Health', GETDATE(), 'Initial installation script run manually')
;




	create table ESW_TemporalTrigger (
		id bigint identity not null,
		expiration bigint null,
		subjectIdentifier nvarchar(512) not null,
		hash varbinary(20) not null
	)
GO

	alter table ESW_TemporalTrigger add constraint PK_ESW_TemporalTrigger primary key (id)
GO

	alter table ESW_TemporalTrigger add constraint UC_ESW_TemporalTrigger_hash unique (hash)
GO

	create index IX_ESW_TemporalTrigger_expir
		on ESW_TemporalTrigger (expiration)
GO  

-- update schema metadata
INSERT INTO SchemaMetaData (name, version) VALUES ('Expert System Workflow', '8.2.0')
;
INSERT INTO SchemaMetaDataHistory (name, version, updatedBy, updatedAt, comments) VALUES ('Expert System Workflow', '8.2.0', 'Orion Health', GETDATE(), 'Initial installation script run manually')
;

    create table FPW_Token (
        token varchar(255) not null,
        contextPath varchar(255) null,
        expiryDate datetime null,
        userId varchar(255) null,
        userNamespace varchar(255) null,
        primary key (token)
    );

-- update schema metadata
INSERT INTO SchemaMetaData (name, version) VALUES ('Forgot Password', '6.7.0')
;
INSERT INTO SchemaMetaDataHistory (name, version, updatedBy, updatedAt, comments) VALUES ('Forgot Password', '6.7.0', 'Orion Health', GETDATE(), 'Initial installation script run manually')
;

    create table Queue (
        id int IDENTITY (1, 1) not null,
        name nvarchar(255) not null unique,
        primary key (id)
    );

    create table QueueEntry (
        id int IDENTITY (1, 1) not null constraint PK__QueueEntry primary key nonclustered,
        longKey bigint not null,
        node int null,
        queue int not null,
        stringKey nvarchar(255) null,
        userData varbinary(max) null,
        emptyData bit not null,
        suspendDescription nvarchar(255) null,
        createDateTime datetime null
    );

	create clustered index CX_QueueEntry_queue on QueueEntry (queue ASC, id ASC)

    create index IX_QueueEntry_longKey on QueueEntry (longKey);

    create index IX_QueueEntry_strKey on QueueEntry (stringKey);

    create unique index IX_QueueEntry_id_queue on QueueEntry (id, queue);

    create index IX_QueueEntry_suspend on QueueEntry (suspendDescription);
    
    create index IX_QueueEntry_node on QueueEntry (node);

    alter table QueueEntry 
        add constraint FK_QueueEntry_queue 
        foreign key (queue) 
        references Queue;

-- update schema metadata
INSERT INTO SchemaMetaData (name, version) VALUES ('Persistent Queue', '7.2.0')
;
INSERT INTO SchemaMetaDataHistory (name, version, updatedBy, updatedAt, comments) VALUES ('Persistent Queue', '7.2.0', 'Orion Health', GETDATE(), 'Initial installation script run manually')
;

    create table TranslationImport (
        id numeric(19,0) identity not null,
        errorDetail nvarchar(255) null,
        filename nvarchar(255) not null,
        importDate datetime not null,
        status nvarchar(255) not null,
        primary key (id)
    );

    create table TranslationKey (
        id numeric(19,0) identity not null,
        configuration tinyint not null,
        name nvarchar(255) not null,
        primary key (id),
        unique (name)
    );

    create table TranslationLocale (
        id numeric(19,0) identity not null,
        localeString nvarchar(255) not null,
        primary key (id),
        unique (localeString)
    );

    create table TranslationText (
        id numeric(19,0) identity not null,
        defaultTranslationText ntext null,
        keyId numeric(19,0) not null,
        lastModifiedDate datetime null,
        localeId numeric(19,0) not null,
        translationText ntext not null,
        primary key (id),
        unique (keyId, localeId)
    );

    create index IX_TranslationText_keyId on TranslationText (keyId);

    create index IX_TranslationText_lastModDate on TranslationText (lastModifiedDate);

    create index IX_TranslationText_localeId on TranslationText (localeId);

    alter table TranslationText 
        add constraint FK_TranslationText_keyId 
        foreign key (keyId) 
        references TranslationKey;

    alter table TranslationText 
        add constraint FK_TranslationText_localeId 
        foreign key (localeId) 
        references TranslationLocale;

-- update schema metadata
INSERT INTO SchemaMetaData (name, version) VALUES ('Translation', '6.4.0')
;
INSERT INTO SchemaMetaDataHistory (name, version, updatedBy, updatedAt, comments) VALUES ('Translation', '6.4.0', 'Orion Health', GETDATE(), 'Initial installation script run manually')
;
    create table Identifier (
        identifierName nvarchar(255) not null,
        nextValue numeric(19,0),
        primary key ( identifierName ) 
    ) ;

-- update schema metadata
INSERT INTO SchemaMetaData (name, version) VALUES ('Id Generator', '6.4.0')
;
INSERT INTO SchemaMetaDataHistory (name, version, updatedBy, updatedAt, comments) VALUES ('Id Generator', '6.4.0', 'Orion Health', GETDATE(), 'Initial installation script run manually')
;

    create table IDN_AttributeValue (
        uniqueId numeric(19,0) not null PRIMARY KEY IDENTITY,
        attributeName nvarchar(255) not null,
        owner numeric(19,0) not null,
        schemaName nvarchar(255) not null,
        stringValue ntext null,
        searchableValue nvarchar(255) null,
        lowerSearchableValue AS lower(searchableValue), /* column for indexing only */
        version int not null
    );

    create table IDN_GroupDefinition (
        uniqueId numeric(19,0) not null PRIMARY KEY IDENTITY,
        name nvarchar(255) not null unique,
        version int not null
    );

    create table IDN_GroupMembership (
        groupDefinition numeric(19,0) not null,
        internalIdentity numeric(19,0) not null,
        transitive tinyint not null,
        primary key (InternalIdentity, GroupDefinition)
    );

    create table IDN_Identifiers (
        identifier nvarchar(255) not null,
        lowerIdentifier AS lower(identifier), /* column for indexing only */
        internalIdentity numeric(19,0) not null,
        isCurrent tinyint not null,
        namespace nvarchar(255) not null,
        primary key (internalIdentity, identifier, isCurrent, namespace)
    );

    create table IDN_IdentityParents (
        organization numeric(19,0) not null,
        parent numeric(19,0) not null,
        primary key (organization, parent)
    );

    create table IDN_InternalIdentity (
        uniqueId numeric(19,0) not null PRIMARY KEY IDENTITY,
        DTYPE nvarchar(31) not null,
        individual numeric(19,0) null,
        organization numeric(19,0) null,
        primaryNamespace nvarchar(255) not null,
        identitySource numeric(19,0), 
        version int not null,
        versionId numeric(19,0) not null
    );

    create table IDN_IdentitySource (
        uniqueId numeric(19,0) not null PRIMARY KEY IDENTITY,
        identitySourceId nvarchar(255) not null unique 
    );

    alter table IDN_AttributeValue 
        add constraint FK_IDN_AttributeValue_Id 
        foreign key (owner) 
        references IDN_InternalIdentity;

    alter table IDN_GroupMembership 
        add constraint FK_IDN_GroupMembership_Group 
        foreign key (groupDefinition) 
        references IDN_GroupDefinition;

    alter table IDN_GroupMembership 
        add constraint FK_IDN_GroupMembership_Id 
        foreign key (internalIdentity) 
        references IDN_InternalIdentity;

    alter table IDN_Identifiers 
        add constraint FK_IDN_Identifiers_Id 
        foreign key (internalIdentity) 
        references IDN_InternalIdentity;

    alter table IDN_IdentityParents 
        add constraint FK_IDN_IdentityParents_org 
        foreign key (organization) 
        references IDN_InternalIdentity;

    alter table IDN_IdentityParents 
        add constraint FK_IDN_IdentityParents_par 
        foreign key (parent) 
        references IDN_InternalIdentity;

    alter table IDN_InternalIdentity 
        add constraint FK_IDN_Identity_individual 
        foreign key (individual) 
        references IDN_InternalIdentity;

    alter table IDN_InternalIdentity 
        add constraint FK_IDN_Identity_org 
        foreign key (organization) 
        references IDN_InternalIdentity;

    alter table IDN_InternalIdentity 
        add constraint FK_IDN_Identity_source
        foreign key (identitySource) 
        references IDN_IdentitySource;

SET ANSI_PADDING ON
GO

    create index IX_IDN_AttributeValue_owner on IDN_AttributeValue (owner);

    create index IX_IDN_AttributeValue_string on IDN_AttributeValue (searchableValue);

    create index IX_IDN_AttributeValue_lower on IDN_AttributeValue (lowerSearchableValue);

    create index IX_IDN_Identifier_id on IDN_Identifiers (identifier);

    create index IX_IDN_Identifier_id_lower on IDN_Identifiers (lowerIdentifier);

    create index IX_IDN_Identifier_ns on IDN_Identifiers (namespace);

    create index IX_IDN_Identity_individual on IDN_InternalIdentity (individual);

    create index IX_IDN_Identity_org on IDN_InternalIdentity (organization);

    create index IX_IDN_InternalId_dtype on IDN_InternalIdentity (DTYPE);
        
    create unique index IX_IDN_AttributeValue_OSNAN on IDN_AttributeValue (owner, schemaName, attributeName);

SET ANSI_PADDING OFF
GO
-- update schema metadata
INSERT INTO SchemaMetaData (name, version) VALUES ('Identity', '7.3.0')
;
INSERT INTO SchemaMetaDataHistory (name, version, updatedBy, updatedAt, comments) VALUES ('Identity', '7.3.0', 'Orion Health', GETDATE(), 'Initial installation script run manually')
;

GO
USE [master]
GO  
/****** Object:  Database [OH_CM_Authentication]    Script Date: 01/29/2015 21:35:01 ******/
CREATE DATABASE [OH_CM_Authentication]

ALTER DATABASE [OH_CM_Authentication] SET COMPATIBILITY_LEVEL = 100
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OH_CM_Authentication].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE OH_CM_Authentication SET READ_COMMITTED_SNAPSHOT ON

GO

USE [OH_CM_Authentication]
CREATE TABLE SchemaMetaData (
	id INTEGER IDENTITY (1, 1) NOT NULL,
	name nvarchar(255) NOT NULL,
	version nvarchar(50) NOT NULL,
	CONSTRAINT PK_SchemaMetaData PRIMARY KEY CLUSTERED (id),
	CONSTRAINT UC_SchemaMetaData UNIQUE(name, version)
);

CREATE TABLE SchemaMetaDataHistory (
	id INTEGER IDENTITY (1, 1) NOT NULL,
	name nvarchar(255),
	version nvarchar(50) NOT NULL,
	updatedBy nvarchar(255) NOT NULL,
	updatedAt datetime NOT NULL,
	comments nvarchar(255) NOT NULL,
	CONSTRAINT PK_SchemaMetaDataHistory PRIMARY KEY CLUSTERED (id)
);

INSERT INTO SchemaMetaData (name, version) VALUES ('SchemaMetaData', '2.0.0.0');
INSERT INTO SchemaMetaDataHistory (name, version, updatedBy, updatedAt, comments) VALUES ('SchemaMetaData', '2.0.0.0', 'Orion Health', GETDATE(), 'Initial Installation');


    create table ATK_AuthToken (
        token nvarchar(36) not null,
        alias nvarchar(255) not null,
        lastAccess datetime not null,
        username nvarchar(255) not null,
        primary key (token)
    );

    create index IX_ATK_AuthToken_token_alias on ATK_AuthToken (token, alias);

-- update schema metadata
INSERT INTO SchemaMetaData (name, version) VALUES ('Authentication Token', '6.10.0')
;
INSERT INTO SchemaMetaDataHistory (name, version, updatedBy, updatedAt, comments) VALUES ('Authentication Token', '6.10.0', 'Orion Health', GETDATE(), 'Initial installation script run manually')
;

GO

USE [master]
GO

/****** Object:  Database [OH_CM_cDictionary]    Script Date: 01/29/2015 21:35:02 ******/
CREATE DATABASE [OH_CM_cDictionary]

ALTER DATABASE [OH_CM_cDictionary] SET COMPATIBILITY_LEVEL = 100
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OH_CM_cDictionary].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO


ALTER DATABASE OH_CM_cDictionary SET READ_COMMITTED_SNAPSHOT ON

GO

USE [OH_CM_cDictionary]
GO
CREATE TABLE SchemaMetaData (
	id INTEGER IDENTITY (1, 1) NOT NULL,
	name nvarchar(255) NOT NULL,
	version nvarchar(50) NOT NULL,
	CONSTRAINT PK_SchemaMetaData PRIMARY KEY CLUSTERED (id),
	CONSTRAINT UC_SchemaMetaData UNIQUE(name, version)
);

CREATE TABLE SchemaMetaDataHistory (
	id INTEGER IDENTITY (1, 1) NOT NULL,
	name nvarchar(255),
	version nvarchar(50) NOT NULL,
	updatedBy nvarchar(255) NOT NULL,
	updatedAt datetime NOT NULL,
	comments nvarchar(255) NOT NULL,
	CONSTRAINT PK_SchemaMetaDataHistory PRIMARY KEY CLUSTERED (id)
);

INSERT INTO SchemaMetaData (name, version) VALUES ('SchemaMetaData', '2.0.0.0');
INSERT INTO SchemaMetaDataHistory (name, version, updatedBy, updatedAt, comments) VALUES ('SchemaMetaData', '2.0.0.0', 'Orion Health', GETDATE(), 'Initial Installation');


    create table AspectReference (
        uniqueId numeric(19,0) not null,
        DTYPE varchar(31) not null,
        aspectClassName varchar(255) not null,
        aspectData nvarchar(4000) null,
        attributeId varchar(255) null,
        dataType numeric(19,0) not null,
        fromVersion numeric(19,0) not null,
        isLarge tinyint not null,
        largeAspectData text null,
        toVersion numeric(19,0) not null,
        primary key (uniqueId)
    )
GO

    create table Attribute (
        uniqueId numeric(19,0) not null,
        attributeIndex int not null,
        dataType numeric(19,0) not null,
        fromVersion numeric(19,0) not null,
        id varchar(255) null,
        name nvarchar(255) not null,
        ordered tinyint not null,
        owner numeric(19,0) not null,
        repeating tinyint not null,
        required tinyint not null,
        toVersion numeric(19,0) not null,
        primary key (uniqueId)
    )
GO

    create table AutoImport (
        uniqueId numeric(19,0) not null,
        bundleName varchar(255) not null,
        dependency varchar(255) null,
        fileName nvarchar(255) not null,
        hash varchar(255) not null,
        importDate datetime not null,
        name varchar(255) not null,
        optLock numeric(19,0) not null,
        primary key (uniqueId)
    )
GO

    create table DataType (
        uniqueId numeric(19,0) not null,
        DTYPE varchar(31) not null,
        currentVersionId numeric(19,0) not null,
        id varchar(255) not null unique,
        optLock numeric(19,0) not null,
        overlay tinyint not null,
        primary key (uniqueId)
    )
GO

    create table DataTypeVersion (
        uniqueId numeric(19,0) not null,
        DTYPE varchar(31) not null,
        dataType numeric(19,0) not null,
        fromVersion numeric(19,0) not null,
        lookupType int null,
        name nvarchar(255) not null,
        parent numeric(19,0) null,
        terminology nvarchar(255) null,
        toVersion numeric(19,0) not null,
        primary key (uniqueId)
    )
GO

    create table TerminologyLookup (
        uniqueId numeric(19,0) not null,
        lookup varchar(255) not null unique,
        primary key (uniqueId)
    )
GO

    create table TerminologyValue (
        uniqueId numeric(19,0) not null,
        code varchar(255) not null,
        codingSystem varchar(255) not null,
        description nvarchar(255) null,
        indexedDescription nvarchar(255) null,
        ordering int not null,
        terminologyLookup numeric(19,0) not null,
        primary key (uniqueId)
    )
GO

    alter table AspectReference 
        add constraint FK_Aspect_dataType 
        foreign key (dataType) 
        references DataType
GO

    alter table Attribute 
        add constraint FK_Attribute_dataType 
        foreign key (dataType) 
        references DataType
GO

    alter table Attribute 
        add constraint FK_Attribute_owner 
        foreign key (owner) 
        references DataType
GO

    create index IDX_DataTypeVersion_parent on DataTypeVersion (parent)
GO

    alter table DataTypeVersion 
        add constraint FK_DataTypeVersion_dataType 
        foreign key (dataType) 
        references DataType
GO

    alter table DataTypeVersion 
        add constraint FK_DataTypeVersion_parent 
        foreign key (parent) 
        references DataType
GO

    create index IX_Lookup_Code_CodingSystem on TerminologyValue (code, codingSystem, terminologyLookup)
GO

    create index IX_Lookup_IndexedDescription on TerminologyValue (indexedDescription)
GO

    create index IX_TermlogyValue_TermlgyLookup on TerminologyValue (terminologyLookup)
GO

    alter table TerminologyValue 
        add constraint FK_TermlogyValue_TermlgyLookup 
        foreign key (terminologyLookup) 
        references TerminologyLookup
GO

    create table hibernate_sequences (
         sequence_name varchar(255) not null ,
         next_val numeric(19,0),
        primary key ( sequence_name ) 
    ) 
GO

-- update schema metadata
INSERT INTO SchemaMetaData (name, version) VALUES ('cDictionary', '8.6.0')
;
INSERT INTO SchemaMetaDataHistory (name, version, updatedBy, updatedAt, comments) VALUES ('cDictionary', '8.6.0', 'Orion Health', GETDATE(), 'Initial installation script run manually')
;
    create table XFM_SharedFormItem (
        uniqueId numeric(19,0) PRIMARY KEY IDENTITY not null,
        dataTypeId varchar(255) null,
        dataTypeName varchar(255) null,
        itemType varchar(31) not null,
        status  varchar(20),
        title varchar(255) null,
        constraint IX_XFM_SharedFormItem_dTypeId unique (dataTypeId)
    );
    
    create table XFM_DictionarySchemaKey (
        dictionarySchemaKey varchar(32) not null
    );

    insert into XFM_DictionarySchemaKey (dictionarySchemaKey) values (replace(newid(), '-', ''));

-- update schema metadata
INSERT INTO SchemaMetaData (name, version) VALUES ('Form Definition', '6.4.0')
;
INSERT INTO SchemaMetaDataHistory (name, version, updatedBy, updatedAt, comments) VALUES ('Form Definition', '6.4.0', 'Orion Health', GETDATE(), 'Initial installation script run manually')
;

USE [master]
GO

/****** Object:  Database [OH_CM_cDocumentRegistry]    Script Date: 01/29/2015 21:35:02 ******/
CREATE DATABASE [OH_CM_cDocumentRegistry]

ALTER DATABASE [OH_CM_cDocumentRegistry] SET COMPATIBILITY_LEVEL = 100
GO

ALTER DATABASE OH_CM_cDocumentRegistry SET READ_COMMITTED_SNAPSHOT ON

GO


USE [OH_CM_cDocumentRegistry]
GO

CREATE TABLE SchemaMetaData (
	id INTEGER IDENTITY (1, 1) NOT NULL,
	name nvarchar(255) NOT NULL,
	version nvarchar(50) NOT NULL,
	CONSTRAINT PK_SchemaMetaData PRIMARY KEY CLUSTERED (id),
	CONSTRAINT UC_SchemaMetaData UNIQUE(name, version)
);

CREATE TABLE SchemaMetaDataHistory (
	id INTEGER IDENTITY (1, 1) NOT NULL,
	name nvarchar(255),
	version nvarchar(50) NOT NULL,
	updatedBy nvarchar(255) NOT NULL,
	updatedAt datetime NOT NULL,
	comments nvarchar(255) NOT NULL,
	CONSTRAINT PK_SchemaMetaDataHistory PRIMARY KEY CLUSTERED (id)
);

INSERT INTO SchemaMetaData (name, version) VALUES ('SchemaMetaData', '2.0.0.0');
INSERT INTO SchemaMetaDataHistory (name, version, updatedBy, updatedAt, comments) VALUES ('SchemaMetaData', '2.0.0.0', 'Orion Health', GETDATE(), 'Initial Installation');

    create table Author (
        id numeric(19,0) not null,
        identityId numeric(19,0) null,
        person nvarchar(128) null,
		CONSTRAINT PK_Author PRIMARY KEY CLUSTERED (id)
    );

CREATE NONCLUSTERED INDEX IX_Author_identityId on Author (identityId);

    create table AuthorInstitution (
        authorId numeric(19,0) not null,
        institutionId numeric(19,0) not null,
		CONSTRAINT PK_AuthorInstitution PRIMARY KEY CLUSTERED (authorId, institutionId)
    );
    
CREATE NONCLUSTERED INDEX IX_AuthInstitution_institution on AuthorInstitution (institutionId);

    create table AuthorRole (
        authorId numeric(19,0) not null,
        roleId numeric(19,0) not null,
		CONSTRAINT PK_AuthorRole PRIMARY KEY CLUSTERED (authorId, roleId)
    );

CREATE NONCLUSTERED INDEX IX_AuthorRole_roleId on AuthorRole (roleId);

    create table AuthorSpeciality (
        authorId numeric(19,0) not null,
        specialityId numeric(19,0) not null,
		CONSTRAINT PK_AuthorSpeciality PRIMARY KEY CLUSTERED (authorId, specialityId)
    );

CREATE NONCLUSTERED INDEX IX_AuthSpeciality_specialityId on AuthorSpeciality (specialityId);

    create table AvailabilityStatus (
        id numeric(19,0) not null,
        item nvarchar(30) not null,
		CONSTRAINT PK_AvailabilityStatus PRIMARY KEY CLUSTERED (id),
		CONSTRAINT UC_AvailabilityStatus01 UNIQUE NONCLUSTERED (item)
    );

    create table DocumentEntry (
        id numeric(19,0) not null,
        archived tinyint not null,
        isStable tinyint not null,
        availabilityStatusId numeric(19,0) not null,
        businessId nvarchar(256) null,
        classCodeId numeric(19,0) null,
        [comment] nvarchar(255) null,
        creationTime datetime null,
        creationTimePrecision int null,
        creationTimeZone nvarchar(255) null,
        entryUuid nvarchar(128) not null,
        externalPatientId numeric(19,0) null,
        formatCodeId numeric(19,0) null,
        healthcareFacilityTypeCodeId numeric(19,0) null,
        languageCodeId numeric(19,0) null,
        legalAuthenticator nvarchar(128) null,
        mimeTypeId numeric(19,0) null,
        parentAssociation nvarchar(20) null,
        parentDocumentId numeric(19,0) null,
        practiceSettingCodeId numeric(19,0) null,
        repositoryUniqueId nvarchar(250) not null,
        repositoryUrl nvarchar(255) null,
        serviceStartTime datetime null,
        serviceStartTimePrecision int null,
        serviceStartTimeZone nvarchar(255) null,
        serviceStopTime datetime null,
        serviceStopTimePrecision int null,
        serviceStopTimeZone nvarchar(255) null,
        sourcePatientId numeric(19,0) null,
        sourcePatientInfoId numeric(19,0) null,
        sourceUniqueId nvarchar(250) not null,
        submissionSetId numeric(19,0) not null,
        title nvarchar(256) null,
        typeCodeId numeric(19,0) null,
        workflowStatusCodeId numeric(19,0) null,
        xdshash nvarchar(40),
        xdssize numeric(19,0),
		CONSTRAINT PK_DocumentEntry PRIMARY KEY NONCLUSTERED (id),
		CONSTRAINT UC_DocumentEntry01 UNIQUE NONCLUSTERED (entryUuid)
    );

CREATE NONCLUSTERED INDEX IX_DocEntry_archived on DocumentEntry (archived);

CREATE NONCLUSTERED INDEX IX_DocEntry_association on DocumentEntry (parentAssociation);

CREATE NONCLUSTERED INDEX IX_DocEntry_availStatusId on DocumentEntry (availabilityStatusId);

CREATE NONCLUSTERED INDEX IX_DocEntry_businessId on DocumentEntry (businessId);

CREATE CLUSTERED INDEX IX_DocEntry_externalPatientId on DocumentEntry (externalPatientId);

CREATE NONCLUSTERED INDEX IX_DocEntry_parentDocId on DocumentEntry (parentDocumentId);

CREATE NONCLUSTERED INDEX IX_DocEntry_sourcePatientId on DocumentEntry (sourcePatientId);

CREATE NONCLUSTERED INDEX IX_DocEntry_submissionSet on DocumentEntry (submissionSetId);

CREATE NONCLUSTERED INDEX IX_DocEntry_sourceUniqueId on DocumentEntry (sourceUniqueId);

    create table DocumentEntryAuthor (
        authorId numeric(19,0) not null,
        documentEntryId numeric(19,0) not null,
		CONSTRAINT PK_DocumentEntryAuthor PRIMARY KEY CLUSTERED (documentEntryId, authorId)
    );

CREATE NONCLUSTERED INDEX IX_DocEntryAuthor_authorId on DocumentEntryAuthor (authorId);

    create table DocumentEntryCategory (
        categoryId numeric(19,0) not null,
        documentEntryId numeric(19,0) not null,
		CONSTRAINT PK_DocumentEntryCategory PRIMARY KEY CLUSTERED (documentEntryId, categoryId)
    );

CREATE NONCLUSTERED INDEX IX_DocEntryCategory_categoryId on DocumentEntryCategory (categoryId);

    create table DocumentEntryConfCode (
        confidentialityCodesId numeric(19,0) not null,
        documentEntryId numeric(19,0) not null,
		CONSTRAINT PK_DocumentEntryConfCode PRIMARY KEY CLUSTERED (documentEntryId, confidentialityCodesId)
    );

CREATE NONCLUSTERED INDEX IX_DocEntryConfCode_confCodes on DocumentEntryConfCode (confidentialityCodesId);

    create table DocumentEntryEventCode (
        documentEntryId numeric(19,0) not null,
        eventCodesId numeric(19,0) not null,
		CONSTRAINT PK_DocumentEntryEventCode PRIMARY KEY CLUSTERED (documentEntryId, eventCodesId)
    );

CREATE NONCLUSTERED INDEX IX_DocEntryEventCode_eventCode on DocumentEntryEventCode (eventCodesId);

    create table DocumentEntryMetadata (
        documentEntryId numeric(19,0) not null,
        property nvarchar(100) not null,
        value nvarchar(255) null,
		CONSTRAINT PK_DocumentEntryMetadata PRIMARY KEY CLUSTERED (documentEntryId, property)
    );

    create table DocumentEntryRelationshipType (
        documentEntryId numeric(19,0) not null,
        relationshipTypeId numeric(19,0) not null,
		CONSTRAINT PK_DocEntryRelationshipType PRIMARY KEY CLUSTERED (documentEntryId, relationshipTypeId)
    );

CREATE NONCLUSTERED INDEX IX_DocEntryRelType_relTypeId on DocumentEntryRelationshipType (relationshipTypeId);

    create table DocumentEntryTag (
        documentEntryId numeric(19,0) not null,
        tagId numeric(19,0) not null,
		CONSTRAINT PK_DocEntryTag PRIMARY KEY CLUSTERED (documentEntryId, tagId)
    );

CREATE NONCLUSTERED INDEX IX_DocumentEntryTag_tagId on DocumentEntryTag (tagId);

    create table DocumentReadBy (
        documentEntryId numeric(19,0) not null,
        identityId numeric(19,0) not null,
		CONSTRAINT PK_DocumentReadBy PRIMARY KEY CLUSTERED (documentEntryId, identityId)
    );
    
CREATE NONCLUSTERED INDEX IX_DocumentReadBy_identityId on DocumentReadBy (identityId);

    create table [Identity] (
        id numeric(19,0) not null,
        [identity] nvarchar(50) not null,
        [identityCodingSystem] nvarchar(100) not null,
		CONSTRAINT PK_Identity PRIMARY KEY CLUSTERED (id),
        CONSTRAINT UC_Identity01 UNIQUE NONCLUSTERED ([identity], [identityCodingSystem])
    );

    create table Institution (
        id numeric(19,0) not null,
        institution nvarchar(128) not null,
		CONSTRAINT PK_Institution PRIMARY KEY CLUSTERED (id),
		CONSTRAINT UC_Institution01 UNIQUE NONCLUSTERED (institution)
    );

    create table LK_Category (
        id numeric(19,0) not null,
        code nvarchar(50) not null,
        codingSystem nvarchar(100) not null,
        description nvarchar(128) null,
		CONSTRAINT PK_Category PRIMARY KEY CLUSTERED (id),
		CONSTRAINT UC_Category01 UNIQUE NONCLUSTERED (code, codingSystem)
    );

    create table LK_ClassCode (
        id numeric(19,0) not null,
        code nvarchar(50) not null,
        codingSystem nvarchar(100) not null,
        description nvarchar(128) null,
		CONSTRAINT PK_ClassCode PRIMARY KEY CLUSTERED (id),
        CONSTRAINT UC_ClassCode01 UNIQUE NONCLUSTERED (code, codingSystem)
    );

    create table LK_ConfidentialityCode (
        id numeric(19,0) not null,
        code nvarchar(50) not null,
        codingSystem nvarchar(100) not null,
        description nvarchar(2000) null,
		CONSTRAINT PK_ConfidentialityCode PRIMARY KEY CLUSTERED (id),
        CONSTRAINT UC_ConfidentialityCode01 UNIQUE NONCLUSTERED (code, codingSystem)
    );

    create table LK_ContentTypeCode (
        id numeric(19,0) not null,
        code nvarchar(100) not null,
        codingSystem nvarchar(100) not null,
        description nvarchar(128) null,
		CONSTRAINT PK_ContentTypeCode PRIMARY KEY CLUSTERED (id),
        CONSTRAINT UC_ContentTypeCode01 UNIQUE NONCLUSTERED (code, codingSystem)
    );

    create table LK_EventCode (
        id numeric(19,0) not null,
        code nvarchar(50) not null,
        codingSystem nvarchar(100) not null,
        description nvarchar(2000) null,
		CONSTRAINT PK_EventCode PRIMARY KEY CLUSTERED (id),
        CONSTRAINT UC_EventCode01 UNIQUE NONCLUSTERED (code, codingSystem)
    );

    create table LK_FormatCode (
        id numeric(19,0) not null,
        code nvarchar(50) not null,
        codingSystem nvarchar(100) not null,
        description nvarchar(128) null,
		CONSTRAINT PK_FormatCode PRIMARY KEY CLUSTERED (id),
        CONSTRAINT UC_FormatCode01 UNIQUE NONCLUSTERED (code, codingSystem)
    );

    create table LK_HealthFacilityTypeCode (
        id numeric(19,0) not null,
        code nvarchar(50) not null,
        codingSystem nvarchar(100) not null,
        description nvarchar(128) null,
		CONSTRAINT PK_HealthFacilityTypeCode PRIMARY KEY CLUSTERED (id),
        CONSTRAINT UC_HealthFacilityTypeCode01 UNIQUE NONCLUSTERED (code, codingSystem)
    );

    create table LK_OrionHealthWorkflowCode (
        id numeric(19,0) not null,
        code nvarchar(50) not null,
        codingSystem nvarchar(100) not null,
        description nvarchar(128) null,
		CONSTRAINT PK_OrionHealthWorkflowCode PRIMARY KEY CLUSTERED (id),
        CONSTRAINT UC_OrionHealthWorkflowCode01 UNIQUE NONCLUSTERED (code, codingSystem)
    );

    create table LK_PracticeSettingCode (
        id numeric(19,0) not null,
        code nvarchar(50) not null,
        codingSystem nvarchar(100) not null,
        description nvarchar(2000) null,
		CONSTRAINT PK_PracticeSettingCode PRIMARY KEY CLUSTERED (id),
        CONSTRAINT UC_PracticeSettingCode01 UNIQUE NONCLUSTERED (code, codingSystem)
    );

    create table LK_Tag (
        id numeric(19,0) not null,
        code nvarchar(50) not null,
        codingSystem nvarchar(100) not null,
        description nvarchar(128) null,
		CONSTRAINT PK_Tag PRIMARY KEY CLUSTERED (id),
        CONSTRAINT UC_Tag01 UNIQUE NONCLUSTERED (code, codingSystem)
    );

    create table LK_TypeCode (
        id numeric(19,0) not null,
        code nvarchar(50) not null,
        codingSystem nvarchar(100) not null,
        description nvarchar(128) null,
		CONSTRAINT PK_TypeCode PRIMARY KEY CLUSTERED (id),
        CONSTRAINT UC_TypeCode01 UNIQUE NONCLUSTERED (code, codingSystem)
    );

    create table LanguageCode (
        id numeric(19,0) not null,
        item nvarchar(30) not null,
		CONSTRAINT PK_LanguageCode PRIMARY KEY CLUSTERED (id),
		CONSTRAINT UC_LanguageCode01 UNIQUE NONCLUSTERED (item)
    );

    create table MimeType (
        id numeric(19,0) not null,
        item nvarchar(100) not null,
		CONSTRAINT PK_MimeType PRIMARY KEY CLUSTERED (id),
		CONSTRAINT UC_MimeType01 UNIQUE NONCLUSTERED (item)
    );

    create table RelationshipType (
        id numeric(19,0) not null,
        relationshipType nvarchar(100) not null,
		CONSTRAINT PK_RelationshipType PRIMARY KEY CLUSTERED (id),
		CONSTRAINT UC_RelationshipType01 UNIQUE NONCLUSTERED (relationshipType)
    );

    create table Role (
        id numeric(19,0) not null,
        role nvarchar(128) not null,
		CONSTRAINT PK_Role PRIMARY KEY CLUSTERED (id),
		CONSTRAINT UC_Role01 UNIQUE NONCLUSTERED (role)
    );

    create table SourcePatientInfo (
        id numeric(19,0) not null,
        address nvarchar(128) null,
        dateOfBirth datetime null,
        dateOfBirthString nvarchar(30) null,
        gender nvarchar(128) null,
        --See CDR Doki. The name column should be in this format: Surname^GivenName^MiddleInitialOrName^Suffix^Prefix^^^
		--340 characters for Surname, GivenName, MiddleName, Suffix and Prefix. 7 for the ^ characters
        name nvarchar(347) null,
        sourcePatientIdentityId numeric(19,0) null,
		CONSTRAINT PK_SourcePatientInfo PRIMARY KEY CLUSTERED (id),
        CONSTRAINT UC_SourcePatientInfo01 UNIQUE NONCLUSTERED (name, address, dateOfBirth, dateOfBirthString, gender, sourcePatientIdentityId)
    );

CREATE NONCLUSTERED INDEX IX_SrcPatientInfo_srcPatientId on SourcePatientInfo (sourcePatientIdentityId);

    create table Speciality (
        id numeric(19,0) not null,
        speciality nvarchar(128) not null,
		CONSTRAINT PK_Speciality PRIMARY KEY CLUSTERED (id),
		CONSTRAINT UC_Speciality01 UNIQUE NONCLUSTERED (speciality)
    );

    create table SubmissionSet (
        id numeric(19,0) not null,
        authorId numeric(19,0) null,
        availabilityStatusId numeric(19,0) not null,
        comments nvarchar(255) null,
        contentTypeId numeric(19,0) null,
        entryUuid nvarchar(128) not null,
        homeCommunityId nvarchar(128) null,
        patientIdentityId numeric(19,0) null,
        sourceId nvarchar(128) not null,
        submissionTime datetime null,
        submissionTimePrecision int null,
        submissionTimeZone nvarchar(255) null,
        title nvarchar(256) null,
        uniqueId nvarchar(100) not null,
		CONSTRAINT PK_SubmissionSet PRIMARY KEY CLUSTERED (id),
		CONSTRAINT UC_SubmissionSet01 UNIQUE NONCLUSTERED (entryUuid)
    );

CREATE NONCLUSTERED INDEX IX_SubmissionSet_patientId on SubmissionSet (patientIdentityId);

CREATE NONCLUSTERED INDEX IX_SubmissionSet_uniqueId on SubmissionSet (uniqueId);

    alter table Author 
        add constraint FK_Author_identityId 
        foreign key (identityId) 
        references [Identity];

    alter table AuthorInstitution 
        add constraint FK_AuthorInst_author 
        foreign key (authorId) 
        references Author;

    alter table AuthorInstitution 
        add constraint FK_AuthorInst_institution 
        foreign key (institutionId) 
        references Institution;

    alter table AuthorRole 
        add constraint FK_AuthorRole_author 
        foreign key (authorId) 
        references Author;

    alter table AuthorRole 
        add constraint FK_AuthorRole_role 
        foreign key (roleId) 
        references Role;

    alter table AuthorSpeciality 
        add constraint FK_AuthorSpeciality_author 
        foreign key (authorId) 
        references Author;

    alter table AuthorSpeciality 
        add constraint FK_AuthorSpeciality_speciality 
        foreign key (specialityId) 
        references Speciality;

    alter table DocumentEntry 
        add constraint FK_DocEntry_availabilityStatus 
        foreign key (availabilityStatusId) 
        references AvailabilityStatus;

    alter table DocumentEntry 
        add constraint FK_DocEntry_parentDocId 
        foreign key (parentDocumentId) 
        references DocumentEntry;

    alter table DocumentEntry 
        add constraint FK_DocEntry_externalPatientId 
        foreign key (externalPatientId) 
        references [Identity];

    alter table DocumentEntry 
        add constraint FK_DocEntry_sourcePatientId 
        foreign key (sourcePatientId) 
        references [Identity];

    alter table DocumentEntry 
        add constraint FK_DocEntry_classCode 
        foreign key (classCodeId) 
        references LK_ClassCode;

    alter table DocumentEntry 
        add constraint FK_DocEntry_formatCode 
        foreign key (formatCodeId) 
        references LK_FormatCode;

    alter table DocumentEntry 
        add constraint FK_DocEntry_healthcareFacility 
        foreign key (healthcareFacilityTypeCodeId) 
        references LK_HealthFacilityTypeCode;

    alter table DocumentEntry 
        add constraint FK_DocEntry_workflowStatusCode 
        foreign key (workflowStatusCodeId) 
        references LK_OrionHealthWorkflowCode;

    alter table DocumentEntry 
        add constraint FK_DocEntry_practiceSettingCde 
        foreign key (practiceSettingCodeId) 
        references LK_PracticeSettingCode;

    alter table DocumentEntry 
        add constraint FK_DocEntry_typeCode 
        foreign key (typeCodeId) 
        references LK_TypeCode;

    alter table DocumentEntry 
        add constraint FK_DocEntry_languageCodeId 
        foreign key (languageCodeId) 
        references LanguageCode;

    alter table DocumentEntry 
        add constraint FK_DocEntry_mimeTypeId 
        foreign key (mimeTypeId) 
        references MimeType;

    alter table DocumentEntry 
        add constraint FK_DocEntry_sourcePatientInfo 
        foreign key (sourcePatientInfoId) 
        references SourcePatientInfo;

    alter table DocumentEntry 
        add constraint FK_DocEntry_submissionSet 
        foreign key (submissionSetId) 
        references SubmissionSet;

    alter table DocumentEntryAuthor 
        add constraint FK_DocEntryAuthor_authorId 
        foreign key (authorId) 
        references Author;

    alter table DocumentEntryAuthor 
        add constraint FK_DocEntryAuthor_docEntryId 
        foreign key (documentEntryId) 
        references DocumentEntry;

    alter table DocumentEntryCategory 
        add constraint FK_DocCategory_docEntryId 
        foreign key (documentEntryId) 
        references DocumentEntry;

    alter table DocumentEntryCategory 
        add constraint FK_DocCategory_categoryId 
        foreign key (categoryId) 
        references LK_Category;

    alter table DocumentEntryConfCode 
        add constraint FK_DocEntryConfCode_docEntryId 
        foreign key (documentEntryId) 
        references DocumentEntry;

    alter table DocumentEntryConfCode 
        add constraint FK_DocEntryConfCode_confCodes 
        foreign key (confidentialityCodesId) 
        references LK_ConfidentialityCode;

    alter table DocumentEntryEventCode 
        add constraint FK_DocEntryEvntCode_docEntryId 
        foreign key (documentEntryId) 
        references DocumentEntry;

    alter table DocumentEntryEventCode 
        add constraint FK_DocEntryEvntCode_eventCodes 
        foreign key (eventCodesId) 
        references LK_EventCode;

    alter table DocumentEntryMetadata 
        add constraint FK_DocMetadata_docEntryId 
        foreign key (documentEntryId) 
        references DocumentEntry;

    alter table DocumentEntryRelationshipType 
        add constraint FK_DocRlnshpType_docEntryId 
        foreign key (documentEntryId) 
        references DocumentEntry;

    alter table DocumentEntryRelationshipType 
        add constraint FK_DocRlnshpType_rlnshpTypeId 
        foreign key (relationshipTypeId) 
        references RelationshipType;

    alter table DocumentEntryTag 
        add constraint FK_DocEntryTag_docEntryId 
        foreign key (documentEntryId) 
        references DocumentEntry;

    alter table DocumentEntryTag 
        add constraint FK_DocEntryTag_tagId 
        foreign key (tagId) 
        references LK_Tag;

    alter table DocumentReadBy 
        add constraint FK_DocReadBy_docEntry 
        foreign key (documentEntryId) 
        references DocumentEntry;

    alter table DocumentReadBy 
        add constraint FK_DocReadBy_identityId 
        foreign key (identityId) 
        references [Identity];

    alter table SourcePatientInfo 
        add constraint FK_SrcPatientInfo_srcPatientId 
        foreign key (sourcePatientIdentityId) 
        references [Identity];

    alter table SubmissionSet 
        add constraint FK_SubmissionSet_author 
        foreign key (authorId) 
        references Author;

    alter table SubmissionSet 
        add constraint FK_SubmissionSet_availability 
        foreign key (availabilityStatusId) 
        references AvailabilityStatus;

    alter table SubmissionSet 
        add constraint FK_SubmissionSet_patientId 
        foreign key (patientIdentityId) 
        references [Identity];

    alter table SubmissionSet 
        add constraint FK_SubmissionSet_contentType 
        foreign key (contentTypeId) 
        references LK_ContentTypeCode;

    create table hibernate_sequences (
         sequence_name nvarchar(255) not null,
        next_val numeric(19,0),
		CONSTRAINT PK_hibernate_sequences PRIMARY KEY CLUSTERED (sequence_name) 
    );

	CREATE INDEX IX_DocEntConfCode_docEntId ON DocumentEntryConfCode (documentEntryId);

CREATE INDEX IX_DocEntAuthor_docEntId ON DocumentEntryAuthor (documentEntryId);

-- update schema metadata
INSERT INTO SchemaMetaData (name, version) VALUES ('Document Registry', '8.5.0')
;
INSERT INTO SchemaMetaDataHistory (name, version, updatedBy, updatedAt, comments) VALUES ('Document Registry', '8.5.0', 'Orion Health', GETDATE(), 'Initial installation script run manually')
;



	create table MSR_Catalogue (
		id bigint identity not null,
		documentStoreIdentifier bigint not null,
		formStoreIdentifier bigint not null,
		name nvarchar(255) not null,
		owner nvarchar(64)
	)
GO

	alter table MSR_Catalogue
		add constraint PK_MSR_Catalogue
		primary key (id)
GO

	alter table MSR_Catalogue
		add constraint UC_MSR_Catalogue_001
		unique (name)
GO

	alter table MSR_Catalogue
		add constraint UC_MSR_Catalogue_002
		unique (documentStoreIdentifier, formStoreIdentifier, name)
GO

	create table MSR_Document (
		id bigint identity not null,
		catalogueIdentifier bigint not null,
		documentIdentifier bigint not null,
		mimeTypeIdentifier bigint not null,
		parentIdentifier bigint,
		stereotypeIdentifier bigint not null
	)
GO

	alter table MSR_Document
		add constraint PK_MSR_Document
		primary key (id)
GO

	alter table MSR_Document
		add constraint UC_MSR_Document
		unique (catalogueIdentifier, documentIdentifier)
GO

	create table MSR_DocumentIdentifier (
		id bigint identity not null,
		parentIdentifier bigint not null,
		sourceIdentifier bigint not null,
		value nvarchar(512) not null
	)
GO

	alter table MSR_DocumentIdentifier
		add constraint PK_MSR_DocumentIdentifier
		primary key (id)
GO

	alter table MSR_DocumentIdentifier
		add constraint UC_MSR_DocumentIdentifier
		unique (parentIdentifier, sourceIdentifier, value)
GO

	create table MSR_DocumentMetadata (
		id bigint identity not null,
		documentIdentifier bigint not null,
		metadataKeyIdentifier bigint not null,
		value ntext not null
	)
GO

	alter table MSR_DocumentMetadata
		add constraint PK_MSR_DocumentMetadata
		primary key (id)
GO

	create table MSR_DocumentSourceRef (
		id bigint identity not null,
		value nvarchar(256) not null
	)
GO

	alter table MSR_DocumentSourceRef
		add constraint PK_MSR_DocumentSourceRef
		primary key (id)
GO

	alter table MSR_DocumentSourceRef
		add constraint UC_MSR_DocumentSourceRef
		unique (value)
GO

	create table MSR_Form (
		id bigint identity not null,
		documentIdentifier bigint not null,
		mimeTypeIdentifier bigint not null,
		variantIdentifier bigint not null
	)
GO

	alter table MSR_Form
		add constraint PK_MSR_Form
		primary key (id)
GO

	alter table MSR_Form
		add constraint UC_MSR_Form
		unique (documentIdentifier, mimeTypeIdentifier, variantIdentifier)
GO

	create table MSR_FormIdentifier (
		id bigint identity not null,
		formStoreIdentifier bigint not null,
		value nvarchar(512) not null
	)
GO

	alter table MSR_FormIdentifier
		add constraint PK_MSR_FormIdentifier
		primary key (id)
GO

	alter table MSR_FormIdentifier
		add constraint UC_MSR_FormIdentifier
		unique (formStoreIdentifier, value)
GO

	create table MSR_FormMetadata (
		id bigint identity not null,
		formIdentifier bigint not null,
		metadataKeyIdentifier bigint not null,
		value ntext not null
	)
GO

	alter table MSR_FormMetadata
		add constraint PK_MSR_FormMetadata
		primary key (id)
GO

	create table MSR_FormStoreRef (
		id bigint identity not null,
		value nvarchar(256) not null
	)
GO

	alter table MSR_FormStoreRef
		add constraint PK_MSR_FormStoreRef
		primary key (id)
GO

	alter table MSR_FormStoreRef
		add constraint UC_MSR_FormStoreRef
		unique (value)
GO

	create table MSR_MetadataKey (
		id bigint identity not null,
		value nvarchar(256) not null
	)
GO

	alter table MSR_MetadataKey
		add constraint PK_MSR_MetadataKey
		primary key (id)
GO

	alter table MSR_MetadataKey
		add constraint UC_MSR_MetadataKey
		unique (value)
GO

	create table MSR_MimeType (
		id bigint identity not null,
		mimeType nvarchar(256) not null
	)
GO

	alter table MSR_MimeType
		add constraint PK_MSR_MimeType
		primary key (id)
GO

	alter table MSR_MimeType
		add constraint UC_MSR_MimeType
		unique (mimeType)
GO

	create table MSR_Stereotype (
		id bigint identity not null,
		stereotype nvarchar(128) not null
	)
GO

	alter table MSR_Stereotype
		add constraint PK_MSR_Stereotype
		primary key (id)
GO

	alter table MSR_Stereotype
		add constraint UC_MSR_Stereotype
		unique (stereotype)
GO

	create table MSR_Variant (
		id bigint identity not null,
		variant nvarchar(128) not null
	)
GO

	alter table MSR_Variant
		add constraint PK_MSR_Variant
		primary key (id)
GO

	alter table MSR_Variant
		add constraint UC_MSR_Variant
		unique (variant)
GO

	alter table MSR_Catalogue 
		add constraint FK_MSR_Catalogue_001
		foreign key (documentStoreIdentifier) references MSR_DocumentSourceRef
GO

	alter table MSR_Catalogue 
		add constraint FK_MSR_Catalogue_002
		foreign key (formStoreIdentifier) references MSR_FormStoreRef
GO

	alter table MSR_Document 
		add constraint FK_MSR_Document_001
		foreign key (catalogueIdentifier) references MSR_Catalogue
		on delete cascade
GO

	alter table MSR_Document 
		add constraint FK_MSR_Document_002
		foreign key (parentIdentifier) references MSR_Document
GO

	alter table MSR_Document 
		add constraint FK_MSR_Document_003
		foreign key (documentIdentifier) references MSR_DocumentIdentifier
GO

	alter table MSR_Document 
		add constraint FK_MSR_Document_004
		foreign key (mimeTypeIdentifier) references MSR_MimeType
GO

	alter table MSR_Document 
		add constraint FK_MSR_Document_005
		foreign key (stereotypeIdentifier) references MSR_Stereotype
GO

	alter table MSR_DocumentIdentifier 
		add constraint FK_MSR_DocumentIdentifier_002
		foreign key (parentIdentifier) references MSR_DocumentIdentifier
GO

	alter table MSR_DocumentIdentifier 
		add constraint FK_MSR_DocumentIdentifier_003
		foreign key (sourceIdentifier) references MSR_DocumentSourceRef
GO

	alter table MSR_DocumentMetadata 
		add constraint FK_MSR_DocumentMetadata_001
		foreign key (documentIdentifier) references MSR_Document
		on delete cascade
GO

	alter table MSR_DocumentMetadata 
		add constraint FK_MSR_DocumentMetadata_002
		foreign key (metadataKeyIdentifier) references MSR_MetadataKey
GO

	alter table MSR_Form 
		add constraint FK_MSR_Form_001
		foreign key (documentIdentifier) references MSR_Document
		on delete cascade
GO

	alter table MSR_Form 
		add constraint FK_MSR_Form_002
		foreign key (mimeTypeIdentifier) references MSR_MimeType
GO

	alter table MSR_Form 
		add constraint FK_MSR_Form_003
		foreign key (variantIdentifier) references MSR_Variant
GO

	alter table MSR_FormIdentifier 
		add constraint FK_MSR_FormIdentifier_001
		foreign key (formStoreIdentifier) references MSR_FormStoreRef
GO

	alter table MSR_FormMetadata 
		add constraint FK_MSR_FormMetadata_001
		foreign key (formIdentifier) references MSR_Form
		on delete cascade
GO

	alter table MSR_FormMetadata 
		add constraint FK_MSR_FormMetadata_002
		foreign key (metadataKeyIdentifier) references MSR_MetadataKey
GO

	insert into MSR_FormStoreRef(value) values('internal:none') 
GO

	insert into MSR_DocumentSourceRef(value) values('internal:none')
GO

	insert into MSR_Catalogue(documentStoreIdentifier, formStoreIdentifier, name) values(1, 1, 'internal:none') 
GO

	insert into MSR_DocumentIdentifier(parentIdentifier, sourceIdentifier, value) values(1, 1, 'internal:root') 
GO


-- update schema metadata
INSERT INTO SchemaMetaData (name, version) VALUES ('Media', '8.3.0')
;
INSERT INTO SchemaMetaDataHistory (name, version, updatedBy, updatedAt, comments) VALUES ('Media', '8.3.0', 'Orion Health', GETDATE(), 'Initial installation script run manually')
;



USE [master]
GO
/****** Object:  Database [OH_CM_cDocumentRepository]    Script Date: 01/29/2015 21:35:02 ******/
CREATE DATABASE [OH_CM_cDocumentRepository]

ALTER DATABASE [OH_CM_cDocumentRepository] SET COMPATIBILITY_LEVEL = 100
GO

ALTER DATABASE OH_CM_cDocumentRepository SET READ_COMMITTED_SNAPSHOT ON

GO

USE [OH_CM_cDocumentRepository]
GO

CREATE TABLE SchemaMetaData (
	id INTEGER IDENTITY (1, 1) NOT NULL,
	name nvarchar(255) NOT NULL,
	version nvarchar(50) NOT NULL,
	CONSTRAINT PK_SchemaMetaData PRIMARY KEY CLUSTERED (id),
	CONSTRAINT UC_SchemaMetaData UNIQUE(name, version)
);

CREATE TABLE SchemaMetaDataHistory (
	id INTEGER IDENTITY (1, 1) NOT NULL,
	name nvarchar(255),
	version nvarchar(50) NOT NULL,
	updatedBy nvarchar(255) NOT NULL,
	updatedAt datetime NOT NULL,
	comments nvarchar(255) NOT NULL,
	CONSTRAINT PK_SchemaMetaDataHistory PRIMARY KEY CLUSTERED (id)
);

INSERT INTO SchemaMetaData (name, version) VALUES ('SchemaMetaData', '2.0.0.0');
INSERT INTO SchemaMetaDataHistory (name, version, updatedBy, updatedAt, comments) VALUES ('SchemaMetaData', '2.0.0.0', 'Orion Health', GETDATE(), 'Initial Installation');
GO
    CREATE SCHEMA DocumentRepository;
GO 
    CREATE TABLE DocumentRepository.DRP_Document (
        id BIGINT IDENTITY(1,1) NOT NULL,
        documentIdentifier VARCHAR(128) NOT NULL,
        content VARBINARY(MAX) NOT NULL,
        mimeType VARCHAR(100) NOT NULL,
        PRIMARY KEY (id)
    );

    CREATE UNIQUE INDEX IX_DRP_Document_documentId ON DocumentRepository.DRP_Document(documentIdentifier);
-- update schema metadata
INSERT INTO SchemaMetaData (name, version) VALUES ('Document Repository', '7.5.0')
;
INSERT INTO SchemaMetaDataHistory (name, version, updatedBy, updatedAt, comments) VALUES ('Document Repository', '7.5.0', 'Orion Health', GETDATE(), 'Initial installation script run manually')
;

USE [master]
GO

/****** Object:  Database [OH_CM_cForms]    Script Date: 01/29/2015 21:35:03 ******/
CREATE DATABASE [OH_CM_cForms]

ALTER DATABASE [OH_CM_cForms] SET COMPATIBILITY_LEVEL = 100
GO

ALTER DATABASE OH_CM_cForms SET READ_COMMITTED_SNAPSHOT ON

USE [OH_CM_cForms]
GO

CREATE TABLE SchemaMetaData (
	id INTEGER IDENTITY (1, 1) NOT NULL,
	name nvarchar(255) NOT NULL,
	version nvarchar(50) NOT NULL,
	CONSTRAINT PK_SchemaMetaData PRIMARY KEY CLUSTERED (id),
	CONSTRAINT UC_SchemaMetaData UNIQUE(name, version)
);

CREATE TABLE SchemaMetaDataHistory (
	id INTEGER IDENTITY (1, 1) NOT NULL,
	name nvarchar(255),
	version nvarchar(50) NOT NULL,
	updatedBy nvarchar(255) NOT NULL,
	updatedAt datetime NOT NULL,
	comments nvarchar(255) NOT NULL,
	CONSTRAINT PK_SchemaMetaDataHistory PRIMARY KEY CLUSTERED (id)
);

INSERT INTO SchemaMetaData (name, version) VALUES ('SchemaMetaData', '2.0.0.0');
INSERT INTO SchemaMetaDataHistory (name, version, updatedBy, updatedAt, comments) VALUES ('SchemaMetaData', '2.0.0.0', 'Orion Health', GETDATE(), 'Initial Installation');
    create table ActiveUser (
        uniqueId numeric(19,0) identity not null,
        lastAccessTime datetime not null,
        sessionId varchar(255) not null,
        userId varchar(255) not null,
        primary key (uniqueId),
        unique (userId, sessionId)
    );

    create table ResumableObject (
        uniqueId numeric(19,0) identity not null,
        applicationName varchar(255) not null,
        entityId varchar(255) not null,
        lastStored datetime not null,
        patientId varchar(255) null,
        patientIdType varchar(255) null,
        userId varchar(255) not null,
        primary key (uniqueId),
        unique (applicationName, entityId)
    );

    create table ResumableObjectFacet (
        facetName varchar(255) not null,
        resumableObjectId numeric(19,0) not null,
        facetValue varchar(255) null,
        primary key (resumableObjectId, facetName)
    );

    create table ResumableText (
        resumableObjectId numeric(19,0) not null,
        content text not null,
        primary key (resumableObjectId)
    );

    create table SendTo (
        id numeric(19,0) identity not null,
        recipient varchar(255) not null,
        recipientDisplayName varchar(255) not null,
        recipientFamilyName varchar(255) null,
        recipientGivenNames varchar(255) null,
        sender varchar(255) not null unique,
        primary key (id)
    );

    create table SharedQuickText (
        sharedQuickTextId numeric(19,0) identity not null,
        code varchar(255) not null unique,
        commentValue varchar(255) null,
        owner varchar(255) not null,
        text text not null,
        primary key (sharedQuickTextId)
    );

    create table UserLookupFilter (
        uniqueId numeric(19,0) identity not null,
        lookupId varchar(255) not null,
        userId varchar(255) not null,
        primary key (uniqueId),
        unique (userId, lookupId)
    );

    create table UserLookupFilterItem (
        lookupId varchar(255) null,
        userLookupFilterId numeric(19,0) not null,
        unique (userLookupFilterId, lookupId)
    );

    create table UserQuickText (
        userQuickTextId numeric(19,0) identity not null,
        code varchar(255) not null,
        sharedQuickText numeric(19,0) null,
        text text null,
        userId varchar(255) not null,
        primary key (userQuickTextId),
        unique (userId, code)
    );

    create index IDX_ActiveUser_sessionId on ActiveUser (sessionId);

    create index IDX_ActiveUser_userId on ActiveUser (userId);

    create index IDX_Resume_Application on ResumableObject (applicationName);

    create index IDX_Resume_entityId on ResumableObject (entityId);

    create index IDX_Resume_userId on ResumableObject (userId);

    alter table ResumableObjectFacet 
        add constraint FK_ResumableObjectFacet 
        foreign key (resumableObjectId) 
        references ResumableObject;

    alter table ResumableText 
        add constraint FK72F5A8BF8ACC8806 
        foreign key (resumableObjectId) 
        references ResumableObject;

    alter table UserLookupFilterItem 
        add constraint FK155221D082A29C0C 
        foreign key (userLookupFilterId) 
        references UserLookupFilter;

    alter table UserQuickText 
        add constraint FKF237990FA70ACFCC 
        foreign key (sharedQuickText) 
        references SharedQuickText;

create table Edit (
    uniqueId numeric(19,0) identity not null,
    entity varchar(255) not null,
    agent varchar(255) not null,
    displayName varchar(255) not null,
    previousEndTime datetime null,
    startTime datetime not null,
    lastKeepAlive datetime not null,
    inProgress tinyint not null,
    endTime datetime null,
    primary key (uniqueId),
    unique (entity, inProgress)
);

create index IDX_Edit_entity_agent_inProgress on Edit (entity, agent, inProgress);

create index IDX_Edit_entity on Edit (entity);

create index IDX_Edit_inProgress on Edit (inProgress);

create index IDX_Edit_agent on Edit (agent);

-- update schema metadata
INSERT INTO SchemaMetaData (name, version) VALUES ('cForms', '6.3.0.0')
;
INSERT INTO SchemaMetaDataHistory (name, version, updatedBy, updatedAt, comments) VALUES ('cForms', '6.3.0.0', 'Orion Health', GETDATE(), 'Initial installation script run manually')
;

USE [master]
GO

GO
/****** Object:  Database [OH_CM_Clinical]    Script Date: 01/29/2015 21:35:03 ******/
CREATE DATABASE [OH_CM_Clinical]

ALTER DATABASE [OH_CM_Clinical] SET COMPATIBILITY_LEVEL = 100
GO

ALTER DATABASE OH_CM_Clinical SET READ_COMMITTED_SNAPSHOT ON

GO


USE [OH_CM_Clinical]
GO

CREATE TABLE SchemaMetaData (
	id INTEGER IDENTITY (1, 1) NOT NULL,
	name nvarchar(255) NOT NULL,
	version nvarchar(50) NOT NULL,
	CONSTRAINT PK_SchemaMetaData PRIMARY KEY CLUSTERED (id),
	CONSTRAINT UC_SchemaMetaData UNIQUE(name, version)
);

CREATE TABLE SchemaMetaDataHistory (
	id INTEGER IDENTITY (1, 1) NOT NULL,
	name nvarchar(255),
	version nvarchar(50) NOT NULL,
	updatedBy nvarchar(255) NOT NULL,
	updatedAt datetime NOT NULL,
	comments nvarchar(255) NOT NULL,
	CONSTRAINT PK_SchemaMetaDataHistory PRIMARY KEY CLUSTERED (id)
);

INSERT INTO SchemaMetaData (name, version) VALUES ('SchemaMetaData', '2.0.0.0');
INSERT INTO SchemaMetaDataHistory (name, version, updatedBy, updatedAt, comments) VALUES ('SchemaMetaData', '2.0.0.0', 'Orion Health', GETDATE(), 'Initial Installation');

GO
CREATE SCHEMA Referral
GO

CREATE TABLE Referral.ERF_LK_Acuity(
    id int IDENTITY not null,
    code nvarchar(50) not null,
    codingSystem nvarchar(100) not null,
    CONSTRAINT PK_ERF_LK_Acuity PRIMARY KEY (id)
)
GO

CREATE UNIQUE NONCLUSTERED INDEX IX_ERF_LK_Acuity_01 ON Referral.ERF_LK_Acuity(code, codingSystem)
GO

CREATE TABLE Referral.ERF_LK_Priority(
	id int IDENTITY not null,
	code nvarchar(50) not null,
	codingSystem nvarchar(100) not null,
	CONSTRAINT PK_ERF_LK_Priority PRIMARY KEY (id)
)
GO

CREATE UNIQUE NONCLUSTERED INDEX IX_ERF_LK_Priority_01 ON Referral.ERF_LK_Priority(code, codingSystem)
GO

CREATE TABLE Referral.ERF_LK_ReferralReceiver(
	id int IDENTITY not null,
	code nvarchar(50) not null,
	codingSystem nvarchar(100) not null,
	CONSTRAINT PK_ERF_LK_ReferralReceiver PRIMARY KEY (id)
)
GO

CREATE UNIQUE NONCLUSTERED INDEX IX_ERF_LK_ReferralReceiver_01 ON Referral.ERF_LK_ReferralReceiver(code, codingSystem)
GO

CREATE TABLE Referral.ERF_LK_ReferralSource(
	id int IDENTITY not null,
	code nvarchar(50) not null,
	codingSystem nvarchar(100) not null,
	CONSTRAINT PK_ERF_LK_ReferralSource PRIMARY KEY (id)
)
GO

CREATE UNIQUE NONCLUSTERED INDEX IX_ERF_LK_ReferralSource_01 ON Referral.ERF_LK_ReferralSource(code, codingSystem)
GO

CREATE TABLE Referral.ERF_LK_Status(
    id int IDENTITY not null,
    code nvarchar(50) not null,
    codingSystem nvarchar(100) not null,
    CONSTRAINT PK_ERF_LK_Status PRIMARY KEY (id)
)
GO

CREATE UNIQUE NONCLUSTERED INDEX IX_ERF_LK_Status_01 ON Referral.ERF_LK_Status(code, codingSystem)
GO

CREATE TABLE Referral.ERF_Referral(
	id int IDENTITY not null,
	identifier nvarchar(50) not null,
	version int not null,
	receivedDate datetime not null,
	receivedDateTimeZone varchar(50) not null,
	optLock integer null,
	patientIdentifier nvarchar(50) not null,
	patientNamespace nvarchar(50) not null,
	referralRequestId int not null,
	referralType nvarchar(50) not null,
	referralService nvarchar(50) not null,
	requestCreatorIdentifier nvarchar(50) not null,
	requestCreatorNamespace nvarchar(50) not null,
	sourceReferralId nvarchar(225),
	sourceSystemId nvarchar(225),
	submitterIdentifier nvarchar(50) not null,
	submitterNamespace nvarchar(50) not null,
	referringClinicianIdentifier nvarchar(50) not null,
	referringClinicianNamespace nvarchar(50) not null,
	lastModifiedDate datetime not null,
	lastModifiedDateTimeZone varchar(50) not null,
	lastModifiedByIdentifier nvarchar(50) not null,
	lastModifiedByNamespace nvarchar(50) not null,
	metaDataId int not null,
	sourceId int not null,
	reviewState varchar(50) not null,
	CONSTRAINT PK_ERF_Referral PRIMARY KEY (id)
)
GO

CREATE UNIQUE NONCLUSTERED INDEX IX_ERF_Referral_01 ON Referral.ERF_Referral(identifier)
GO

CREATE NONCLUSTERED INDEX IX_ERF_Referral_02 ON Referral.ERF_Referral(patientIdentifier, patientNamespace)
GO

CREATE UNIQUE NONCLUSTERED INDEX IX_ERF_Referral_03 ON Referral.ERF_Referral(referralRequestId)
GO

CREATE UNIQUE NONCLUSTERED INDEX IX_ERF_Referral_04 ON Referral.ERF_Referral(metaDataId)
GO

CREATE NONCLUSTERED INDEX IX_ERF_Referral_05 ON Referral.ERF_Referral(sourceReferralId, sourceSystemId)
GO

CREATE NONCLUSTERED INDEX IX_ERF_Referral_06 ON Referral.ERF_Referral(sourceId)
GO

CREATE NONCLUSTERED INDEX IX_ERF_Referral_07 ON Referral.ERF_Referral(reviewState)
GO

CREATE TABLE Referral.ERF_ReferralMetaData(
	id int IDENTITY not null,
	modelId varchar(255) not null,
	modelVersion numeric(19,0) not null,
	dataId varchar(255) not null,
	dataVersion numeric(19,0) not null,
	eventDate datetime null,
	eventDateTimeZone varchar(50) null,
	statusId int not null,
	statusReasonCode nvarchar(50) null,
	statusReasonCodingSystem nvarchar(100) null,
	statusReasonDiscriminator nvarchar(100) null,
	acuityId int null,
	receiverId int not null,
	urgent tinyint not null,
	providerIdentifier nvarchar(50),
	providerNamespace nvarchar(100),
	priorityId int,
	pasReferralId nvarchar(225),
	pasReferralIdNamespace nvarchar(225),
	CONSTRAINT PK_ERF_ReferralMetaData PRIMARY KEY (id)
)
GO

CREATE NONCLUSTERED INDEX IX_ERF_ReferralMetaData_01 ON Referral.ERF_ReferralMetaData(priorityId)
GO

ALTER TABLE Referral.ERF_ReferralMetaData
ADD CONSTRAINT FK_ERF_ReferralMetaData_01
FOREIGN KEY (priorityId)
REFERENCES Referral.ERF_LK_Priority
GO

CREATE NONCLUSTERED INDEX IX_ERF_ReferralMetaData_02 ON Referral.ERF_ReferralMetaData(receiverId)
GO

ALTER TABLE Referral.ERF_ReferralMetaData
ADD CONSTRAINT FK_ERF_ReferralMetaData_02
FOREIGN KEY (receiverId)
REFERENCES Referral.ERF_LK_ReferralReceiver
GO

CREATE NONCLUSTERED INDEX IX_ERF_ReferralMetaData_05 ON Referral.ERF_ReferralMetaData(acuityId)
GO

ALTER TABLE Referral.ERF_ReferralMetaData
	ADD CONSTRAINT FK_ERF_ReferralMetaData_05
    FOREIGN KEY (acuityId)
    REFERENCES Referral.ERF_LK_Acuity(id)
GO

CREATE NONCLUSTERED INDEX IX_ERF_ReferralMetaData_06 ON Referral.ERF_ReferralMetaData(statusId)
GO

ALTER TABLE Referral.ERF_ReferralMetaData
	ADD CONSTRAINT FK_ERF_ReferralMetaData_06
    FOREIGN KEY (statusId)
    REFERENCES Referral.ERF_LK_Status(id)
GO

CREATE NONCLUSTERED INDEX IX_ERF_ReferralMetaData_07 ON Referral.ERF_ReferralMetaData(pasReferralId, pasReferralIdNamespace)
GO

ALTER TABLE Referral.ERF_Referral
ADD CONSTRAINT FK_ERF_Referral_01
FOREIGN KEY (metaDataId)
REFERENCES Referral.ERF_ReferralMetaData
GO

ALTER TABLE Referral.ERF_Referral
ADD CONSTRAINT FK_ERF_Referral_02
FOREIGN KEY (sourceId)
REFERENCES Referral.ERF_LK_ReferralSource
GO

CREATE TABLE Referral.ERF_Deferment(
	id int IDENTITY not null,
	validFromVersion int not null,
	validToVersion int not null,
	startDate datetime not null,
	startDateTimeZone varchar(50) not null,
	endDate datetime,
	endDateTimeZone varchar(50),
	reviewDate datetime not null,
	reviewDateTimeZone varchar(50) not null,
	deferReasonCode nvarchar(50) not null,
	deferReasonCodingSystem nvarchar(100) not null,
	referralId int not null,
	CONSTRAINT PK_ERF_Deferment PRIMARY KEY (id)
)
GO

CREATE NONCLUSTERED INDEX IX_ERF_Deferment_01 ON Referral.ERF_Deferment(referralId)
GO

ALTER TABLE Referral.ERF_Deferment
ADD CONSTRAINT FK_ERF_Deferment_01
FOREIGN KEY (referralId) 
REFERENCES Referral.ERF_Referral
GO

CREATE TABLE Referral.ERF_Event(
	id int IDENTITY not null,
	eventTypeIdentifier nvarchar(50) not null,
	eventDate datetime not null,
	eventDateTimeZone varchar(50) not null,
	referralId int not null,
	validFromVersion int not null,
	validToVersion int not null,
	CONSTRAINT PK_ERF_Event PRIMARY KEY (id)
)
GO

CREATE NONCLUSTERED INDEX IX_ERF_Event_01 ON Referral.ERF_Event(referralId)
GO

ALTER TABLE Referral.ERF_Event
ADD CONSTRAINT FK_ERF_Event_01
FOREIGN KEY (referralId) 
REFERENCES Referral.ERF_Referral
GO

CREATE TABLE Referral.ERF_Note(
    id int IDENTITY not null,
    noteCode nvarchar(50) not null,
    noteCodingSystem nvarchar(100) not null,
    referralId int not null,
	validFromVersion int not null,
	validToVersion int not null,
    CONSTRAINT PK_ERF_Note PRIMARY KEY (id)
)
GO

CREATE INDEX IX_ERF_Note_01 ON Referral.ERF_Note(referralId)
GO

ALTER TABLE Referral.ERF_Note
ADD CONSTRAINT FK_ERF_Note_01 
FOREIGN KEY (referralId) 
REFERENCES Referral.ERF_Referral
GO

CREATE TABLE Referral.ERF_ActionHistory(
	id int IDENTITY not null,
	actionDate datetime not null,
	actionDateTimeZone varchar(50) not null,
	actionIdentifier nvarchar(50) not null,
	actionReasonCode nvarchar(50) null,
	actionReasonCodingSystem nvarchar(100) null,
	actionReasonDiscriminator nvarchar(100) null,
	actionComment nvarchar(max) null,
	metaDataId int not null,
	referralId int not null,
	referralVersion int not null,
	userIdentifier nvarchar(50) not null,
	userNamespace nvarchar(50) not null,
	defermentId int null,
	eventId int null,
	noteId int null,
	reviewState varchar(50) not null,
	reviewId int null,
	CONSTRAINT PK_ERF_ActionHistory PRIMARY KEY (id)
)
GO

CREATE NONCLUSTERED INDEX IX_ERF_ActionHistory_01 ON Referral.ERF_ActionHistory(referralId)
GO

ALTER TABLE Referral.ERF_ActionHistory
ADD CONSTRAINT FK_ERF_ActionHistory_01
FOREIGN KEY (referralId)
REFERENCES Referral.ERF_Referral
GO

CREATE NONCLUSTERED INDEX IX_ERF_ActionHistory_02 ON Referral.ERF_ActionHistory(metaDataId)
GO

ALTER TABLE Referral.ERF_ActionHistory
ADD CONSTRAINT FK_ERF_ActionHistory_02
FOREIGN KEY (metaDataId)
REFERENCES Referral.ERF_ReferralMetaData
GO

CREATE NONCLUSTERED INDEX IX_ERF_ActionHistory_03 ON Referral.ERF_ActionHistory(defermentId)
GO

ALTER TABLE Referral.ERF_ActionHistory
ADD CONSTRAINT FK_ERF_ActionHistory_03
FOREIGN KEY (defermentId)
REFERENCES Referral.ERF_Deferment
GO

CREATE INDEX IX_ERF_ActionHistory_04 ON Referral.ERF_ActionHistory(eventId)
GO

ALTER TABLE Referral.ERF_ActionHistory
ADD CONSTRAINT FK_ERF_ActionHistory_04
FOREIGN KEY (eventId)
REFERENCES Referral.ERF_Event
GO

CREATE INDEX IX_ERF_ActionHistory_05 ON Referral.ERF_ActionHistory(noteId)
GO

ALTER TABLE Referral.ERF_ActionHistory 
	ADD CONSTRAINT FK_ERF_ActionHistory_05
	FOREIGN KEY (noteId) 
	REFERENCES Referral.ERF_Note
GO

CREATE INDEX IX_ERF_ERF_ActionHistory_06 ON Referral.ERF_ActionHistory(reviewId)
GO

ALTER TABLE Referral.ERF_ActionHistory
	ADD CONSTRAINT FK_ERF_ActionHistory_06
	FOREIGN KEY (reviewId) 
	REFERENCES Referral.ERF_ActionHistory
GO

CREATE INDEX IX_ERF_ERF_ActionHistory_07 ON Referral.ERF_ActionHistory(reviewState)
GO

CREATE INDEX IX_ERF_ERF_ActionHistory_08 ON Referral.ERF_ActionHistory(referralId, referralVersion, reviewState)
GO

ALTER TABLE Referral.ERF_ActionHistory
ADD CONSTRAINT CK_ERF_ActionHistory_01 
CHECK( reviewState IN ('REVIEW_NOT_REQUIRED', 'REVIEW_REQUIRED', 'REVIEWED') )
GO

CREATE TABLE Referral.ERF_AssociatedReceiver(
	associatedReceiverId int not null,
	referralId int not null
	CONSTRAINT PK_ERF_AssociatedReceiver PRIMARY KEY (referralId, associatedReceiverId)
)
GO

CREATE NONCLUSTERED INDEX IX_ERF_AssociatedReceiver_01 ON Referral.ERF_AssociatedReceiver(associatedReceiverId)
GO

ALTER TABLE Referral.ERF_AssociatedReceiver
ADD CONSTRAINT FK_ERF_AssociatedReceiver_01
FOREIGN KEY (associatedReceiverId)
REFERENCES Referral.ERF_LK_ReferralReceiver
GO

ALTER TABLE Referral.ERF_AssociatedReceiver
ADD CONSTRAINT FK_ERF_AssociatedReceiver_02
FOREIGN KEY (referralId)
REFERENCES Referral.ERF_Referral
GO

CREATE VIEW Referral.ERF_ReferralView AS
SELECT
	r.id AS referralViewId,
	r.identifier AS identifier,
	r.version AS version,
	rmd.urgent AS urgent,
	slk.code AS statusCode,
	slk.codingSystem AS statusCodingSystem,
	rmd.statusreasoncode AS statusReasonCode,
	rmd.statusreasoncodingsystem AS statusReasonCodingSystem,
	plk.code AS priorityCode,
	plk.codingSystem AS priorityCodingSystem,
	alk.code AS acuityCode,
	alk.codingSystem AS acuityCodingSystem,
	rlk.code AS receiverCode,
	rlk.codingSystem AS receiverCodingSystem,
	r.receivedDate AS receivedDate,
	r.receivedDateTimeZone AS receivedDateTimeZone,
	r.patientIdentifier AS patientIdentifier,
	r.patientNamespace AS patientNamespace,
	r.referralRequestID AS referralRequestId,
	r.referralService AS referralService,
	r.referralType AS referralType,
	r.requestCreatorIdentifier AS requestCreatorIdentifier,
	r.requestCreatorNamespace AS requestCreatorNamespace,
	r.referringClinicianIdentifier AS referringClinicianIdentifier,
	r.referringClinicianNamespace AS referringClinicianNamespace,
	r.sourceReferralId AS sourceReferralId,
	r.sourceSystemId AS sourceSystemId,
	r.submitterIdentifier AS submitterIdentifier,
	r.submitterNamespace AS submitterNamespace,
	rmd.providerIdentifier AS providerIdentifier,
	rmd.providerNamespace AS providerNamespace,
	r.lastModifiedDate AS lastModifiedDate,
	r.lastModifiedDateTimeZone AS lastModifiedDateTimeZone,
	r.lastModifiedByIdentifier AS lastModifiedByIdentifier,
	r.lastModifiedByNamespace AS lastModifiedByNamespace,
	CASE WHEN r.reviewState = 'REVIEW_REQUIRED' THEN 1 ELSE null END AS requiresReview,
	rslk.code AS sourceCode,
	rslk.codingSystem AS sourceCodingSystem,
	rmd.pasReferralId AS pasReferralId,
	rmd.pasReferralIdNamespace AS pasReferralIdNamespace

FROM Referral.ERF_Referral r
INNER JOIN Referral.ERF_ReferralMetaData rmd ON r.metadataId = rmd.id
LEFT OUTER JOIN Referral.ERF_LK_Priority plk ON plk.id = rmd.priorityId
LEFT OUTER JOIN Referral.ERF_LK_Acuity alk ON alk.id = rmd.acuityId
LEFT OUTER JOIN Referral.ERF_LK_Status slk ON slk.id = rmd.statusId
LEFT OUTER JOIN Referral.ERF_LK_ReferralReceiver rlk ON rlk.id = rmd.receiverId
LEFT OUTER JOIN Referral.ERF_LK_ReferralSource rslk ON rslk.id = r.sourceId
GO

CREATE VIEW Referral.ERF_ActionHistoryView AS
SELECT
	ah.id AS actionHistoryViewId,
	ah.referralId AS referralViewId,
	ah.actionIdentifier AS actionIdentifier,
	ah.actionDate AS actionDate,
	ah.actionDateTimezone AS actionDateTimezone,
	lks.code AS statusCode,
	lks.codingSystem AS statusCodingSystem,
	ah.actionReasonCode AS actionReasonCode,
	ah.actionReasonCodingSystem AS actionReasonCodingSystem,
	rmd.pasReferralId AS pasReferralId,
	rmd.pasReferralIdNamespace AS pasReferralIdNamespace
FROM Referral.ERF_ActionHistory ah
LEFT OUTER JOIN Referral.ERF_ReferralMetaData rmd ON ah.metaDataId = rmd.id
LEFT OUTER JOIN Referral.ERF_LK_Status lks ON rmd.statusId = lks.id
GO

CREATE VIEW Referral.ERF_EventView AS
SELECT
	e.id AS eventViewId,
	r.id AS referralViewId,
	ah.id AS actionHistoryViewId,
	e.eventTypeIdentifier AS eventTypeIdentifier,
	e.eventDate AS eventDate,
	e.eventDateTimezone AS eventDateTimezone,
	ah.actionReasonCode AS eventReasonCode,
	ah.actionReasonCodingSystem AS eventReasonCodingSystem
FROM Referral.ERF_Referral r
LEFT OUTER JOIN Referral.ERF_Event e ON e.referralId = r.id AND e.validToVersion >= r.version
INNER JOIN Referral.ERF_ActionHistory ah ON ah.eventId = e.id
GO
-- update schema metadata
INSERT INTO SchemaMetaData (name, version) VALUES ('Referral', '3.1.0.1')
;
INSERT INTO SchemaMetaDataHistory (name, version, updatedBy, updatedAt, comments) VALUES ('Referral', '3.1.0.1', 'Orion Health', GETDATE(), 'Initial installation script run manually')
;
GO
CREATE SCHEMA CodeSet
GO

create table CodeSet.CodeDefinition (
    id int IDENTITY(1, 1) not null,
    code nvarchar(50) not null,
    normalizedCode nvarchar(50) not null,
    codeSetId int not null,
    subSetId int,
    codingSystem nvarchar(100) not null,
    normalizedCodingSystem nvarchar(100) not null,
    description nvarchar(2000) null,
    shortDescription nvarchar(200) null,
    isFreeText tinyint not null,
    orderIndex int not null default 0,
    isDeleted tinyint not null default 0,
    primary key (id),
    unique (normalizedCode, normalizedCodingSystem, codeSetId)
)
GO

create table CodeSet.CodeSet (
    id int IDENTITY(1, 1) not null,
    identifier nvarchar(200) not null,
    primary key (id),
    unique (identifier)
)
GO

create table CodeSet.SubSet (
    id int IDENTITY(1, 1) not null,
    codeSetId int not null,
    codeDefinitionId int not null,
    primary key (id),
    unique (codeSetId,codeDefinitionId)
)
GO

create table CodeSet.CodeSetImport (
	importId nvarchar(200) not null,
	primary key(importId)
)
GO

alter table CodeSet.CodeDefinition 
    add constraint FK_CodeSetId 
    foreign key (codeSetId) 
    references CodeSet.CodeSet
GO

alter table CodeSet.CodeDefinition 
    add constraint FK_SubSetSetId 
    foreign key (subSetId) 
    references CodeSet.SubSet
GO

alter table CodeSet.SubSet 
    add constraint FK_SubSetCodeSetId 
    foreign key (codeSetId) 
    references CodeSet.CodeSet
GO

alter table CodeSet.SubSet 
    add constraint FK_SubSetCodeDefinitionId 
    foreign key (codeDefinitionId) 
    references CodeSet.CodeDefinition
GO


-- update schema metadata
INSERT INTO SchemaMetaData (name, version) VALUES ('Codeset', '7.2.0')
;
INSERT INTO SchemaMetaDataHistory (name, version, updatedBy, updatedAt, comments) VALUES ('Codeset', '7.2.0', 'Orion Health', GETDATE(), 'Initial installation script run manually')
;
GO
CREATE SCHEMA RefRequest
GO

CREATE TABLE RefRequest.ERF_LK_RequestReceiver (
	id int IDENTITY not null,
	code varchar(50) not null,
	codingSystem varchar(100) not null,
	CONSTRAINT PK_ERF_LK_RequestReceiver PRIMARY KEY (id)
)
GO

CREATE UNIQUE NONCLUSTERED INDEX IX_ERF_LK_RequestReceiver_01 ON RefRequest.ERF_LK_RequestReceiver(code, codingSystem)
GO

CREATE TABLE RefRequest.ERF_LK_RequestSource (
	id int IDENTITY not null,
	code varchar(50) not null,
	codingSystem varchar(100) not null,
	CONSTRAINT PK_ERF_LK_RequestSource PRIMARY KEY (id)
)
GO

CREATE UNIQUE NONCLUSTERED INDEX IX_ERF_LK_RequestSource_01 ON RefRequest.ERF_LK_RequestSource(code, codingSystem)
GO

CREATE TABLE RefRequest.ERF_LK_RequestRejectReason (
	id int IDENTITY not null,
	code varchar(50) not null,
	codingSystem varchar(100) not null,
	CONSTRAINT PK_ERF_RequestRejectReason PRIMARY KEY (id)
)
GO

CREATE UNIQUE NONCLUSTERED INDEX IX_ERF_LK_RejectReason_01 ON RefRequest.ERF_LK_RequestRejectReason(code, codingSystem)
GO

CREATE TABLE RefRequest.ERF_ReceivedMessage (
	id int IDENTITY not null,
	acuityCode nvarchar(255) null,
	acuityCodingSystem nvarchar(255) null,
	acuityText nvarchar(255) null,
	creatorId nvarchar(255) null,
	creatorIdNamespace nvarchar(255) null,
	initialReceiverCode nvarchar(255) null,
	initialReceiverCodingSystem nvarchar(255) null,
	initialReceiverName nvarchar(255) null,
	patientId nvarchar(255) null,
	patientIdNamespace nvarchar(255) null,
	patientAddress nvarchar(255) null,
	patientDateOfBirth nvarchar(255) null,
	patientFamilyName nvarchar(255) null,
	patientFirstName nvarchar(255) null,
	patientGender nvarchar(255) null,
	patientTitle nvarchar(255) null,
	receivedDate nvarchar(255) null,
	referralServiceId nvarchar(255) null,
	referralServiceName nvarchar(255) null,
	referralTypeId nvarchar(255) null,
	referralTypeName nvarchar(255) null,
	referringClinicianId nvarchar(255) null,
	referringClinicianIdNamespace nvarchar(255) null,
	referringClinicianName nvarchar(255) null,
	isUrgent nvarchar(255) null,
	urgencyText nvarchar(255) null,
	CONSTRAINT PK_ERF_ReceivedMessage PRIMARY KEY (id)
)
GO

CREATE TABLE RefRequest.ERF_ExternalId (
	id int IDENTITY not null,
	optLock int not null,
	sourceReferralId nvarchar(225),
	sourceSystemId nvarchar(225),
	CONSTRAINT PK_ERF_ExternalId PRIMARY KEY (id)
)
GO

CREATE UNIQUE NONCLUSTERED INDEX IX_ERF_ExternalId_01 ON RefRequest.ERF_ExternalId(sourceReferralId, sourceSystemId)
GO

CREATE TABLE RefRequest.ERF_ReferralRequest (
	id int IDENTITY not null,
	version int not null,
	optLock int not null,
	modelId varchar(255) not null,
	modelVersion numeric(19,0) not null,
	dataId varchar(255) not null,
	dataVersion numeric(19,0) not null,
	creationStamp datetime not null,
	creationStampTimeZone varchar(50) not null,
	eventDate datetime null,
	eventDateTimeZone varchar(50) null,
	creatorIdentifier nvarchar(50) not null,
	creatorNamespace nvarchar(50) not null,
	referringClinicianIdentifier nvarchar(50),
	referringClinicianNamespace nvarchar(50),
	patientIdentifier nvarchar(50),
	patientNamespace nvarchar(50),
	referralType nvarchar(50),
	referralService nvarchar(50),
	status nvarchar(50) null,
	urgent tinyint,
	submittedStamp datetime null,
	submittedStampTimeZone varchar(50) null,
	submitterIdentifier nvarchar(50) null,
	submitterNamespace nvarchar(50) null,
	acuityCode nvarchar(50),
	acuityCodingSystem nvarchar(50),
	referralRequestReceiverId int null,
	receivedMessageId int null,
	referralRequestSourceId int not null,
	rejectComment nvarchar(max) null,
	requestRejectReasonId int null,
	previousRejected int null,
	externalId int null,
	pasReferralId nvarchar(225),
	pasReferralIdNamespace nvarchar(225)
	CONSTRAINT PK_ERF_ReferralRequest PRIMARY KEY (id)
)
GO

CREATE NONCLUSTERED INDEX IX_ERF_ReferralRequest_04 ON RefRequest.ERF_ReferralRequest(externalId)
GO

CREATE NONCLUSTERED INDEX IX_ERF_ReferralRequest_05 ON RefRequest.ERF_ReferralRequest(pasReferralId,pasReferralIdNamespace)
GO

CREATE NONCLUSTERED INDEX IX_ERF_ReferralRequest_03 ON RefRequest.ERF_ReferralRequest(previousRejected)
GO

ALTER TABLE RefRequest.ERF_ReferralRequest 
	ADD CONSTRAINT FK_ERF_ReferralRequestReceiver_01 
	FOREIGN KEY (referralRequestReceiverId) 
	REFERENCES RefRequest.ERF_LK_RequestReceiver
GO

ALTER TABLE RefRequest.ERF_ReferralRequest 
	ADD CONSTRAINT FK_ERF_ReferralRequestSource_01 
	FOREIGN KEY (referralRequestSourceId) 
	REFERENCES RefRequest.ERF_LK_RequestSource
GO

ALTER TABLE RefRequest.ERF_ReferralRequest 
	ADD CONSTRAINT FK_ERF_ReceivedMessage 
	FOREIGN KEY (receivedMessageId) 
	REFERENCES RefRequest.ERF_ReceivedMessage
GO

ALTER TABLE RefRequest.ERF_ReferralRequest 
	ADD CONSTRAINT FK_ERF_ReferralRequest_02 
	FOREIGN KEY (previousRejected) 
	REFERENCES  RefRequest.ERF_ReferralRequest
GO

ALTER TABLE RefRequest.ERF_ReferralRequest
	ADD CONSTRAINT FK_ERF_ReferralRequestRejectReason_02
	FOREIGN KEY (requestRejectReasonId)
	REFERENCES RefRequest.ERF_LK_RequestRejectReason
GO

ALTER TABLE RefRequest.ERF_ReferralRequest 
	ADD CONSTRAINT FK_ERF_ExternalId_01 
	FOREIGN KEY (externalId) 
	REFERENCES RefRequest.ERF_ExternalId
GO

CREATE VIEW RefRequest.ERF_ReferralRequestView AS
SELECT
	rr.id AS referralRequestId,
	rr.version AS referralRequestVersion,
	rr.creationstamp AS creationDateTime,
	rr.creationstamptimezone AS creationDateTimeZone,
	rr.modelid AS modelIdentifier ,
	rr.modelversion AS modelVersion,
	rr.dataid AS modelDataId,
	rr.dataversion AS modelDataVersion,
	rr.eventdate AS eventDateTime,
	rr.eventdatetimezone AS eventDateTimeZone,
	rr.creatoridentifier AS creatorIdentifier,
	rr.creatornamespace AS creatorNamespace,
	rr.referringclinicianidentifier AS referringClinicianIdentifier,
	rr.referringcliniciannamespace AS referringClinicianNamespace,
	rr.patientidentifier AS patientId,
	rr.patientnamespace AS patientNamespace,
	rr.referraltype AS referralType,
	rr.referralservice AS referralService,
	rr.status AS status,
	rr.urgent AS urgent,
	ei.sourceReferralId AS sourceReferralId,
	ei.sourceSystemId AS sourceSystemId,
	rr.submittedstamp AS submittedDateTime,
	rr.submittedstamptimezone AS submittedDateTimeZone,
	rr.submitteridentifier AS submitterIdentifier,
	rr.submitternamespace AS submitterNamespace,
	rr.acuitycode AS acuityCode,
	rr.acuitycodingsystem AS acuityCodingSystem,
	rr.receivedmessageid AS receivedMessageId,
	rrlk.code AS rejectReasonCode,
	rrlk.codingSystem AS rejectReasonCodingSystem,
	rr.rejectComment AS rejectReasonComment,
	rlk.code AS receiverCode,
	rlk.codingsystem AS receiverCodingSystem,
	rslk.code AS sourceCode,
	rslk.codingSystem AS sourceCodingSystem,
	rr.previousRejected AS previousRejected,
	rr.pasReferralId AS pasReferralId,
	rr.pasReferralIdNamespace AS pasReferralIdNamespace
	
FROM RefRequest.ERF_ReferralRequest rr
LEFT OUTER JOIN Refrequest.ERF_LK_RequestReceiver rlk ON rlk.ID = rr.ReferralRequestReceiverId
LEFT OUTER JOIN Refrequest.ERF_LK_RequestRejectReason rrlk ON rrlk.ID = rr.requestRejectReasonId
LEFT OUTER JOIN RefRequest.ERF_LK_RequestSource rslk on rslk.id = rr.referralRequestSourceId
LEFT OUTER JOIN RefRequest.ERF_ExternalId ei on ei.id = rr.externalId
GO

CREATE VIEW RefRequest.ERF_ReceivedMessageView AS
SELECT
	rm.id AS receivedMessageId,
	rm.acuityCode AS acuityCode,
	rm.acuityCodingSystem AS acuityCodingSystem,
	rm.acuityText AS acuityText,
	rm.creatorId AS creatorId,
	rm.creatorIdNamespace AS creatorIdNamespace,
	rm.initialReceiverCode AS initialReceiverCode,
	rm.initialReceiverCodingSystem AS initialReceiverCodingSystem,
	rm.initialReceiverName AS initialReceiverName,
	rm.patientId AS patientId,
	rm.patientIdNamespace AS patientIdNamespace,
	rm.patientAddress AS patientAddress,
	rm.patientDateOfBirth AS patientDateOfBirth,
	rm.patientFamilyName AS patientFamilyName,
	rm.patientFirstName AS patientFirstName,
	rm.patientGender AS patientGender,
	rm.patientTitle AS patientTitle,
	rm.receivedDate AS receivedDate,
	rm.referralServiceId AS referralServiceId,
	rm.referralServiceName AS referralServiceName,
	rm.referralTypeId AS referralTypeId,
	rm.referralTypeName AS referralTypeName,
	rm.referringClinicianId AS referringClinicianId,
	rm.referringClinicianIdNamespace AS referringClinicianIdNamespace,
	rm.referringClinicianName AS referringClinicianName,
	rm.isUrgent AS isUrgent,
	rm.urgencyText AS urgencyText,
	rslk.code AS sourceCode,
	rslk.codingSystem AS sourceCodingSystem,
	ei.sourceReferralId AS sourceReferralId,
	ei.sourceSystemId AS sourceSystemId
FROM RefRequest.ERF_ReceivedMessage rm
LEFT OUTER JOIN RefRequest.ERF_ReferralRequest rr on rr.receivedmessageid = rm.id
LEFT OUTER JOIN RefRequest.ERF_LK_RequestSource rslk on rslk.id = rr.referralRequestSourceId
LEFT OUTER JOIN RefRequest.ERF_ExternalId ei on ei.id = rr.externalId
GO

-- update schema metadata
INSERT INTO SchemaMetaData (name, version) VALUES ('Referral Request', '3.1.0.1')
;
INSERT INTO SchemaMetaDataHistory (name, version, updatedBy, updatedAt, comments) VALUES ('Referral Request', '3.1.0.1', 'Orion Health', GETDATE(), 'Initial installation script run manually')
;
GO 
CREATE SCHEMA PathwayEnrollment
GO
create table PathwayEnrollment.PES_DeactivationReason (
	uniqueId int PRIMARY KEY IDENTITY not null,
	code varchar(50) not null,
	codingSystem varchar(100) not null,
	constraint uniqueCodeCodingSystem unique (code, codingSystem)
);

create index IDX_PES_code on PathwayEnrollment.PES_DeactivationReason (code);
create index IDX_PES_codingSystem on PathwayEnrollment.PES_DeactivationReason (codingSystem);

create table PathwayEnrollment.PES_PathwayEnrollment (
	uniqueId int PRIMARY KEY IDENTITY not null,
	enrollmentIdentifier varchar(255) not null,
	enrollmentStatus varchar(255) not null,
	enrollerUserId varchar(255),
	enrollerUserNamespace varchar(255),
	enrollmentTime datetime not null,
	enrollmentTimeZone varchar(255) not null,
	modifierUserId varchar(255),
	modifierUserNamespace varchar(255),
	modificationTime datetime not null,
	modificationTimeZone varchar(255) not null,
	pathwayIdentifier varchar(255) not null,
	patientId varchar(255) not null,
	patientNamespace varchar(255) not null,
	deactivationReasonId int,
	constraint uniqueEnrollmentIdentifier unique (enrollmentIdentifier),
	constraint fk_deactivationReasonId foreign key (deactivationReasonId) REFERENCES PathwayEnrollment.PES_DeactivationReason(uniqueId)
);

create index IDX_PES_enrollmentStatus on PathwayEnrollment.PES_PathwayEnrollment(enrollmentStatus);
create index IDX_PES_pathwayIdentifier on PathwayEnrollment.PES_PathwayEnrollment (pathwayIdentifier);
create index IDX_PES_patientId on PathwayEnrollment.PES_PathwayEnrollment (patientId);
create index IDX_PES_patientNamespace on PathwayEnrollment.PES_PathwayEnrollment (patientNamespace);

-- update schema metadata
INSERT INTO SchemaMetaData (name, version) VALUES ('Pathway Enrollment', '3.1.0.3')
;
INSERT INTO SchemaMetaDataHistory (name, version, updatedBy, updatedAt, comments) VALUES ('Pathway Enrollment', '3.1.0.3', 'Orion Health', GETDATE(), 'Initial installation script run manually')
;


USE [master]
GO


/****** Object:  Database [OH_CM_Configuration]    Script Date: 01/29/2015 21:35:03 ******/
CREATE DATABASE [OH_CM_Configuration]

ALTER DATABASE [OH_CM_Configuration] SET COMPATIBILITY_LEVEL = 100
GO

ALTER DATABASE OH_CM_Configuration SET READ_COMMITTED_SNAPSHOT ON

GO

/****** Object:  Database [OH_CM_cRepository]    Script Date: 01/29/2015 21:35:03 ******/
CREATE DATABASE [OH_CM_cRepository]

ALTER DATABASE [OH_CM_cRepository] SET COMPATIBILITY_LEVEL = 100
GO

ALTER DATABASE OH_CM_cRepository SET READ_COMMITTED_SNAPSHOT ON
GO
USE [OH_CM_cRepository]
GO
CREATE TABLE SchemaMetaData (
	id INTEGER IDENTITY (1, 1) NOT NULL,
	name nvarchar(255) NOT NULL,
	version nvarchar(50) NOT NULL,
	CONSTRAINT PK_SchemaMetaData PRIMARY KEY CLUSTERED (id),
	CONSTRAINT UC_SchemaMetaData UNIQUE(name, version)
);

CREATE TABLE SchemaMetaDataHistory (
	id INTEGER IDENTITY (1, 1) NOT NULL,
	name nvarchar(255),
	version nvarchar(50) NOT NULL,
	updatedBy nvarchar(255) NOT NULL,
	updatedAt datetime NOT NULL,
	comments nvarchar(255) NOT NULL,
	CONSTRAINT PK_SchemaMetaDataHistory PRIMARY KEY CLUSTERED (id)
);

INSERT INTO SchemaMetaData (name, version) VALUES ('SchemaMetaData', '2.0.0.0');
INSERT INTO SchemaMetaDataHistory (name, version, updatedBy, updatedAt, comments) VALUES ('SchemaMetaData', '2.0.0.0', 'Orion Health', GETDATE(), 'Initial Installation');

    create table Document (
        documentId numeric(19,0) not null,
        modelId nvarchar(256) not null
    );

    alter table Document add constraint PK_Document primary key (documentId);

    create table DocumentIdentifier (
        documentId numeric(19,0) not null,
        documentIdentifier nvarchar(256) not null,
	isPrimary bit not null
    );

    alter table DocumentIdentifier add constraint PK_DocumentIdentifier primary key (documentIdentifier);

    
    create table Message (
        uniqueId numeric(19,0) not null,
        documentVersionId numeric(19,0) not null,
        messageData image not null,
	compressionType nvarchar(256) not null,
        storageDate datetime not null
    );

    alter table Message add constraint PK_Message primary key (uniqueId);

    create table DocumentVersion (
        uniqueId numeric(19,0) not null,
        documentId numeric(19,0) not null,
        modelVersionDate datetime not null,
	metaDataModelVersionDate datetime not null,
        transactionFrom datetime not null,
        transactionTo datetime not null,
        [current] bit not null,
	hasVersion nvarchar(280) null,
	submitter nvarchar(256) null,
	modified datetime null,
	modified_Prcn char(1) null,
	modified_Ofst numeric(19,0) null,
	modified_Nano numeric(19,0) null,
	dateSubmitted datetime null,
	dateSubmitted_Prcn char(1) null,
	dateSubmitted_Ofst numeric(19,0) null,
	dateSubmitted_Nano numeric(19,0) null,
	isDeleted bit not null,
	status nvarchar(256) null,
	rootItemId numeric(19,0),
	metaDataId numeric(19,0)
    );

    alter table DocumentVersion add constraint PK_DocumentVersion primary key (uniqueId);

    create table DocumentVersionContributor(
	uniqueId numeric(19,0) not null,
	contributor nvarchar(256),
	documentVersionId numeric(19,0) not null,
	ordering numeric(19,0) not null
    );

    alter table DocumentVersionContributor add constraint PK_DocumentVersionContributor primary key (uniqueId);

    create table SignificantAncestor (
        objectId numeric(19,0) not null,
        ancestorId numeric(19,0) not null,
	attributeUUIDPathId numeric(19,0) not null,
	documentVersionId numeric(19,0) not null
    );

    alter table SignificantAncestor add constraint PK_SignificantAncestor primary key (documentVersionId, objectId, ancestorId);

    create table Parent (
        documentVersionId numeric(19,0) not null,
	documentId numeric(19,0) not null,
        parentId numeric(19,0) not null,
        childId numeric(19,0) not null,
	childDocumentId numeric(19,0) not null,
	attributeUUIDPathId numeric(19,0) not null,
        ordering int not null
    );
    alter table Parent add constraint PK_Parent primary key (documentVersionId, parentId, childId);
    
    create table NumericIdGenerator(
	uniqueId nvarchar(256) not null,
	nextId numeric(19,0) not null
    );

   alter table NumericIdGenerator add constraint PK_NumericIdGenerator primary key (uniqueId);

   create index IDX_DocIdentifierDocumentId on DocumentIdentifier (documentId);

   create index IDX_DocumentVersionDocumentId on DocumentVersion (documentId);
   
   create index IDX_DocumentVersionMetaDataId on DocumentVersion (metaDataId);
   
   create index IDX_DocumentVersionRootItemId on DocumentVersion (rootItemId);
   
   create index IDX_DocumentVerConDocVersId on DocumentVersionContributor (documentVersionId);
 
   create index IDX_SigAncAncestorId on SignificantAncestor (ancestorId);

   create index IDX_ParentChildId on Parent (childId);

   create index IDX_ParentDvIdPath on Parent (documentVersionId, attributeUUIDPathId);

   create index IDX_ParentParentIdPath on Parent (parentId, attributeUUIDPathId);

   create index IDX_DocumentVersionId on Message(DocumentVersionId);

   create index IDX_SigAncestor_ObjectId on SIGNIFICANTANCESTOR(OBJECTID);
    create table [VIEW] (
        uniqueId numeric(19,0) not null,
        name nvarchar(255) not null unique,
        type nchar not null,
        versioned bit not null,
	viewVersion numeric(19,0) not null,
        primary key (uniqueId)
    );

    create table ViewItem (
        uniqueId numeric(19,0) not null,
        itemUUID nvarchar (255) not null,
        viewId numeric(19,0) not null,
        primary key (uniqueId)
    );

    alter table ViewItem 
        add constraint "viewFK" foreign key (viewId) 
        references [VIEW](uniqueId);

		BEGIN
	EXECUTE ('IF EXISTS(SELECT id FROM sysobjects WHERE type = ''v'' AND name = ''v_AllDocumentIdentifier'') DROP VIEW v_AllDocumentIdentifier')
    
	EXECUTE ('CREATE VIEW v_AllDocumentIdentifier AS
			SELECT
				DI.documentId,
				DI.documentIdentifier,
				DI.isPrimary
			FROM DocumentIdentifier DI')
    END
    
    BEGIN
	EXECUTE ('IF EXISTS(SELECT id FROM sysobjects WHERE type = ''v'' AND name = ''v_Document'') DROP VIEW v_Document')
    
	EXECUTE ('CREATE VIEW v_Document AS
			SELECT
				D.documentId,
				DI.documentIdentifier,
				D.modelId,
				DV.modelVersionDate,
				DV.dateSubmitted,
				DV.dateSubmitted_Prcn,
				DV.dateSubmitted_Ofst,
				DV.dateSubmitted_Nano,
				DV.isDeleted,
				DV.rootItemId,
				DV.metaDataId
			 FROM Document D 
			 JOIN DocumentIdentifier DI on D.documentId = DI.documentId AND DI.isPrimary = 1
			 JOIN DocumentVersion DV on D.documentId = DV.documentId
			 WHERE DV.[CURRENT] = 1')
    END
    
    BEGIN
	EXECUTE ('IF EXISTS(SELECT id FROM sysobjects WHERE type = ''v'' AND name = ''w_Document'') DROP VIEW w_Document')
    
	EXECUTE ('CREATE VIEW w_Document AS
			SELECT
				DV.UNIQUEID AS documentVersionId,
				D.documentId,
				DI.documentIdentifier,
				D.modelId,         
				DV.transactionFrom,
				DV.transactionTo,
				DV.[CURRENT],
				DV.modelVersionDate,
				DV.dateSubmitted,
				DV.dateSubmitted_Prcn,
				DV.dateSubmitted_Ofst,
				DV.dateSubmitted_Nano,
				DV.isDeleted,
				DV.rootItemId,
				DV.metaDataId
			 FROM Document D
			 JOIN DocumentIdentifier DI on D.documentId = DI.documentId AND DI.isPrimary = 1
			 JOIN DocumentVersion DV on D.documentId = DV.documentId')
    END

    BEGIN
	EXECUTE ('IF EXISTS(SELECT id FROM sysobjects WHERE type = ''v'' AND name = ''v_DocumentContributor'') DROP VIEW v_DocumentContributor')

	EXECUTE ('CREATE VIEW v_DocumentContributor AS
			 SELECT
				DV.documentId,
				DVC.contributor,
				DVC.ordering
			 FROM DocumentVersionContributor DVC JOIN DocumentVersion DV on DVC.documentVersionId = DV.uniqueId
			 WHERE DV.[CURRENT] = 1')
    END
    
    BEGIN
	EXECUTE ('IF EXISTS(SELECT id FROM sysobjects WHERE type = ''v'' AND name = ''w_DocumentContributor'') DROP VIEW w_DocumentContributor')

	EXECUTE ('CREATE VIEW w_DocumentContributor AS
			 SELECT
				DVC.documentVersionId,
				DV.documentId,
				DVC.contributor,
				DVC.ordering
			 FROM DocumentVersionContributor DVC 
			 JOIN DocumentVersion DV on DVC.documentVersionId = DV.uniqueId' )
    END

    create table AttributeUuidPath (
        uniqueId numeric(19,0) not null,
        attributeUUIDPath varchar(4000) not null,
        childItemUuid nvarchar(36) not null,
        loadableItemMetaData numeric(19,0) not null,
        unique (attributeUUIDPath, loadableItemMetaData)
    );

    alter table AttributeUuidPath add constraint PK_AttributeUuidPath primary key (uniqueId);

    create table OptimisedStorageSchemaVersion (
        uniqueId numeric(19,0) not null,
        modelId nvarchar(36) not null,
        modelVersion datetime not null
    );

    alter table OptimisedStorageSchemaVersion add constraint PK_OptStorageSchemaVersion primary key (uniqueId);

    create table RetroPopulate (
        uniqueId numeric(19,0) identity not null,
        errorCount numeric(19,0) null,
        lastDocumentId nvarchar(256) null,
        modelUuid nvarchar(36) not null,
        status int not null,
        submitDate datetime not null,
        successCount numeric(19,0) not null,
        versionDate datetime null,
        versionUuid nvarchar(36) null
    );

    alter table RetroPopulate add constraint PK_RetroPopulate primary key (uniqueId);

    create table RetroPopulateLog (
        uniqueId numeric(19,0) identity not null,
        documentId nvarchar(256) null,
        message ntext null,
        retroPopulate numeric(19,0) not null
    );

    alter table RetroPopulateLog add constraint PK_RetroPopulateLog primary key (uniqueId);

    create table SchemaVersion (
        uniqueId numeric(19,0) not null,
        changesInProgress numeric(19,0) null,
        schemaVersion numeric(19,0) null
    );

    alter table SchemaVersion add constraint PK_SchemaVersion primary key (uniqueId);

    create table StorageMetaData (
        uniqueId numeric(19,0) not null,
        inOptimisedStorage tinyint null,
        inlined tinyint null,
        itemId nvarchar(36) null unique,
        mappingVersionId int null,
        modified tinyint null,
        sqlScriptVersionId int null
    );

    alter table StorageMetaData add constraint PK_StorageMetaData primary key (uniqueId);

    alter table AttributeUuidPath 
        add constraint FK_AttrUuidPath_LoadableItem 
        foreign key (loadableItemMetaData) 
        references StorageMetaData;

    alter table RetroPopulateLog 
        add constraint FK618BBC9C1CE27AE2 
        foreign key (retroPopulate) 
        references RetroPopulate;
GO 

CREATE PROCEDURE lockItemWithSqlScriptVersionId(@itemUuid nvarchar(36), @scriptVersionId int)
AS
BEGIN
	DECLARE @result int;
	DECLARE @uniqueId numeric(19,0);

	-- acquire an exclusive lock on the item
	EXECUTE @result = sp_getapplock @itemUuid, 'Exclusive';

	IF @result < 0
	BEGIN
		RAISERROR('Unable to acquire exclusive lock on ''%s''', 11, 1, @itemUuid);	
		RETURN;
	END
	
	-- ensure that it is for the correct scriptVersionId
	DECLARE metaDataCursor CURSOR FOR SELECT uniqueId FROM StorageMetaData WHERE itemId = @itemUuid AND sqlScriptVersionId = @scriptVersionId;

	OPEN metaDataCursor;

	-- fetch into a variable so that sql server doesn't output any results
	FETCH NEXT FROM metaDataCursor INTO @uniqueId;

	IF @@FETCH_STATUS <> 0
	BEGIN
		-- release the lock
		EXECUTE sp_releaseapplock @itemUuid;

		RAISERROR('Version %d of item ''%s'' not found', 11, 1, @scriptVersionId, @itemUuid);
	END

	CLOSE metaDataCursor;
	DEALLOCATE metaDataCursor;
END;
GO
begin transaction;
insert into NumericIdGenerator(uniqueId, nextId) values ('instanceId', 1);
insert into NumericIdGenerator(uniqueId, nextId) values ('documentId', 1);
insert into NumericIdGenerator(uniqueId, nextId) values ('versionId', 1);
insert into NumericIdGenerator(uniqueId, nextId) values ('metadataId', 1);
insert into SchemaVersion(uniqueId, changesInProgress, schemaVersion) values (0, 0, 0);
commit;
CREATE TABLE Invocation (
	uniqueId numeric(19,0) NOT NULL,
	name nvarchar(2000) NOT NULL,
	startTime numeric(20,0) NOT NULL,
	endTime numeric(20,0) NOT NULL,
	duration numeric(19,0) NOT NULL,
	threadId nvarchar(2000) NOT NULL,
	nodeId nvarchar(2000) NOT NULL
);

ALTER TABLE Invocation ADD CONSTRAINT PK_Invocation PRIMARY KEY (uniqueId);
-- update schema metadata
INSERT INTO SchemaMetaData (name, version) VALUES ('cRepository', '7.9.0.01')
;
INSERT INTO SchemaMetaDataHistory (name, version, updatedBy, updatedAt, comments) VALUES ('cRepository', '7.9.0.01', 'Orion Health', GETDATE(), 'Initial installation script run manually')
;
    create table FAS_Attachment (
        uniqueId numeric(19,0) PRIMARY KEY IDENTITY not null,
        identifier varchar(255) not null,
        filename varchar(255) null,
        mimeTypeFk numeric(19,0),
        data varbinary(max) null,
        constraint IX_FAS_Attachment_identifier unique (identifier)
    );
    
    create table FAS_MimeType (
       uniqueId numeric(19,0) PRIMARY KEY IDENTITY not null,
       mimeType varchar(255) not null,
       constraint IX_FAS_MimeType_mimeType unique (mimeType)
    );

-- update schema metadata
INSERT INTO SchemaMetaData (name, version) VALUES ('Forms Attachment', '6.3.0')
;
INSERT INTO SchemaMetaDataHistory (name, version, updatedBy, updatedAt, comments) VALUES ('Forms Attachment', '6.3.0', 'Orion Health', GETDATE(), 'Initial installation script run manually')
;

GO
USE [master]
GO
/****** Object:  Database [OH_CM_Custom]    Script Date: 01/29/2015 21:35:03 ******/
CREATE DATABASE [OH_CM_Custom]
GO 
ALTER DATABASE [OH_CM_Custom] SET COMPATIBILITY_LEVEL = 100
GO

ALTER DATABASE OH_CM_Custom SET READ_COMMITTED_SNAPSHOT ON
 USE [OH_CM_Custom]
GO
/****** Object:  Table [dbo].[WICInformationSheets]    Script Date: 05/22/2015 11:10:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WICInformationSheets](
	[ItemNo] [uniqueidentifier] NOT NULL,
	[InfoSheet] [varchar](100) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[WICInformationSheets] ([ItemNo], [InfoSheet]) VALUES (N'b34e837d-1d79-e411-8572-005056b42a5a', N'Allergic Conjunctivitis')
INSERT [dbo].[WICInformationSheets] ([ItemNo], [InfoSheet]) VALUES (N'b44e837d-1d79-e411-8572-005056b42a5a', N'Ankle Sprain or Strain')
INSERT [dbo].[WICInformationSheets] ([ItemNo], [InfoSheet]) VALUES (N'b54e837d-1d79-e411-8572-005056b42a5a', N'Asthma')
INSERT [dbo].[WICInformationSheets] ([ItemNo], [InfoSheet]) VALUES (N'b64e837d-1d79-e411-8572-005056b42a5a', N'Boils and Carbuncles')
INSERT [dbo].[WICInformationSheets] ([ItemNo], [InfoSheet]) VALUES (N'b74e837d-1d79-e411-8572-005056b42a5a', N'Bruising after an injury')
INSERT [dbo].[WICInformationSheets] ([ItemNo], [InfoSheet]) VALUES (N'b84e837d-1d79-e411-8572-005056b42a5a', N'Bruising or Muscle Strain after an injury')
INSERT [dbo].[WICInformationSheets] ([ItemNo], [InfoSheet]) VALUES (N'b94e837d-1d79-e411-8572-005056b42a5a', N'Burns')
INSERT [dbo].[WICInformationSheets] ([ItemNo], [InfoSheet]) VALUES (N'ba4e837d-1d79-e411-8572-005056b42a5a', N'Chickenpox')
INSERT [dbo].[WICInformationSheets] ([ItemNo], [InfoSheet]) VALUES (N'bb4e837d-1d79-e411-8572-005056b42a5a', N'Common Cold')
INSERT [dbo].[WICInformationSheets] ([ItemNo], [InfoSheet]) VALUES (N'bc4e837d-1d79-e411-8572-005056b42a5a', N'Contact Dermatitis')
INSERT [dbo].[WICInformationSheets] ([ItemNo], [InfoSheet]) VALUES (N'bd4e837d-1d79-e411-8572-005056b42a5a', N'Cuts and Grazes')
INSERT [dbo].[WICInformationSheets] ([ItemNo], [InfoSheet]) VALUES (N'be4e837d-1d79-e411-8572-005056b42a5a', N'Dog or Cat Bites')
INSERT [dbo].[WICInformationSheets] ([ItemNo], [InfoSheet]) VALUES (N'bf4e837d-1d79-e411-8572-005056b42a5a', N'Dry Eye Syndrome')
INSERT [dbo].[WICInformationSheets] ([ItemNo], [InfoSheet]) VALUES (N'c04e837d-1d79-e411-8572-005056b42a5a', N'Ear Wax Impaction')
INSERT [dbo].[WICInformationSheets] ([ItemNo], [InfoSheet]) VALUES (N'c14e837d-1d79-e411-8572-005056b42a5a', N'Eczema')
INSERT [dbo].[WICInformationSheets] ([ItemNo], [InfoSheet]) VALUES (N'c24e837d-1d79-e411-8572-005056b42a5a', N'Elbow Sprain or Strain')
INSERT [dbo].[WICInformationSheets] ([ItemNo], [InfoSheet]) VALUES (N'c34e837d-1d79-e411-8572-005056b42a5a', N'Fever')
INSERT [dbo].[WICInformationSheets] ([ItemNo], [InfoSheet]) VALUES (N'c44e837d-1d79-e411-8572-005056b42a5a', N'Finger Sprain or Strain')
INSERT [dbo].[WICInformationSheets] ([ItemNo], [InfoSheet]) VALUES (N'c54e837d-1d79-e411-8572-005056b42a5a', N'Foot Sprain or Strain')
INSERT [dbo].[WICInformationSheets] ([ItemNo], [InfoSheet]) VALUES (N'c64e837d-1d79-e411-8572-005056b42a5a', N'Fracture Referral')
INSERT [dbo].[WICInformationSheets] ([ItemNo], [InfoSheet]) VALUES (N'c74e837d-1d79-e411-8572-005056b42a5a', N'Fungal Infections')
INSERT [dbo].[WICInformationSheets] ([ItemNo], [InfoSheet]) VALUES (N'c84e837d-1d79-e411-8572-005056b42a5a', N'Gastroenteritis (Vomiting and diarrhoea)')
INSERT [dbo].[WICInformationSheets] ([ItemNo], [InfoSheet]) VALUES (N'c94e837d-1d79-e411-8572-005056b42a5a', N'Hand Sprain or Strain')
INSERT [dbo].[WICInformationSheets] ([ItemNo], [InfoSheet]) VALUES (N'ca4e837d-1d79-e411-8572-005056b42a5a', N'Hand, Foot and Mouth Virus')
INSERT [dbo].[WICInformationSheets] ([ItemNo], [InfoSheet]) VALUES (N'cb4e837d-1d79-e411-8572-005056b42a5a', N'Hayfever')
INSERT [dbo].[WICInformationSheets] ([ItemNo], [InfoSheet]) VALUES (N'cc4e837d-1d79-e411-8572-005056b42a5a', N'Head Lice')
INSERT [dbo].[WICInformationSheets] ([ItemNo], [InfoSheet]) VALUES (N'cd4e837d-1d79-e411-8572-005056b42a5a', N'Headache')
INSERT [dbo].[WICInformationSheets] ([ItemNo], [InfoSheet]) VALUES (N'ce4e837d-1d79-e411-8572-005056b42a5a', N'Human Bites')
INSERT [dbo].[WICInformationSheets] ([ItemNo], [InfoSheet]) VALUES (N'cf4e837d-1d79-e411-8572-005056b42a5a', N'Impetigo (School Sores)')
INSERT [dbo].[WICInformationSheets] ([ItemNo], [InfoSheet]) VALUES (N'd04e837d-1d79-e411-8572-005056b42a5a', N'Infective Conjunctivitis')
INSERT [dbo].[WICInformationSheets] ([ItemNo], [InfoSheet]) VALUES (N'd14e837d-1d79-e411-8572-005056b42a5a', N'Influenza')
INSERT [dbo].[WICInformationSheets] ([ItemNo], [InfoSheet]) VALUES (N'd24e837d-1d79-e411-8572-005056b42a5a', N'Insect Sting')
INSERT [dbo].[WICInformationSheets] ([ItemNo], [InfoSheet]) VALUES (N'd34e837d-1d79-e411-8572-005056b42a5a', N'Knee Sprain or Strain')
INSERT [dbo].[WICInformationSheets] ([ItemNo], [InfoSheet]) VALUES (N'd44e837d-1d79-e411-8572-005056b42a5a', N'Lower Urinary Tract Infection (Non Pregnant Women)')
INSERT [dbo].[WICInformationSheets] ([ItemNo], [InfoSheet]) VALUES (N'd54e837d-1d79-e411-8572-005056b42a5a', N'Marine Stingers')
INSERT [dbo].[WICInformationSheets] ([ItemNo], [InfoSheet]) VALUES (N'd64e837d-1d79-e411-8572-005056b42a5a', N'Measles')
INSERT [dbo].[WICInformationSheets] ([ItemNo], [InfoSheet]) VALUES (N'd74e837d-1d79-e411-8572-005056b42a5a', N'Middle Ear Infection')
INSERT [dbo].[WICInformationSheets] ([ItemNo], [InfoSheet]) VALUES (N'd84e837d-1d79-e411-8572-005056b42a5a', N'Migraine Headache')
INSERT [dbo].[WICInformationSheets] ([ItemNo], [InfoSheet]) VALUES (N'd94e837d-1d79-e411-8572-005056b42a5a', N'Otitis Externa (Swimmer’s Ear)')
INSERT [dbo].[WICInformationSheets] ([ItemNo], [InfoSheet]) VALUES (N'da4e837d-1d79-e411-8572-005056b42a5a', N'Paronychia')
INSERT [dbo].[WICInformationSheets] ([ItemNo], [InfoSheet]) VALUES (N'db4e837d-1d79-e411-8572-005056b42a5a', N'Period pain')
INSERT [dbo].[WICInformationSheets] ([ItemNo], [InfoSheet]) VALUES (N'dc4e837d-1d79-e411-8572-005056b42a5a', N'Pubic Lice (Crab lice)')
INSERT [dbo].[WICInformationSheets] ([ItemNo], [InfoSheet]) VALUES (N'dd4e837d-1d79-e411-8572-005056b42a5a', N'Rubella (German measles)')
INSERT [dbo].[WICInformationSheets] ([ItemNo], [InfoSheet]) VALUES (N'de4e837d-1d79-e411-8572-005056b42a5a', N'Scabies')
INSERT [dbo].[WICInformationSheets] ([ItemNo], [InfoSheet]) VALUES (N'df4e837d-1d79-e411-8572-005056b42a5a', N'Shingles')
INSERT [dbo].[WICInformationSheets] ([ItemNo], [InfoSheet]) VALUES (N'e04e837d-1d79-e411-8572-005056b42a5a', N'Sinusitis')
INSERT [dbo].[WICInformationSheets] ([ItemNo], [InfoSheet]) VALUES (N'e14e837d-1d79-e411-8572-005056b42a5a', N'Sore Throat')
INSERT [dbo].[WICInformationSheets] ([ItemNo], [InfoSheet]) VALUES (N'e24e837d-1d79-e411-8572-005056b42a5a', N'Spider Bite')
INSERT [dbo].[WICInformationSheets] ([ItemNo], [InfoSheet]) VALUES (N'e34e837d-1d79-e411-8572-005056b42a5a', N'Subungual Haematoma - Bleeding under the nail')
INSERT [dbo].[WICInformationSheets] ([ItemNo], [InfoSheet]) VALUES (N'e44e837d-1d79-e411-8572-005056b42a5a', N'Toe Sprain or Strain')
INSERT [dbo].[WICInformationSheets] ([ItemNo], [InfoSheet]) VALUES (N'e54e837d-1d79-e411-8572-005056b42a5a', N'Urticaria (Hives)')
INSERT [dbo].[WICInformationSheets] ([ItemNo], [InfoSheet]) VALUES (N'e64e837d-1d79-e411-8572-005056b42a5a', N'Vaginal Thrush')
INSERT [dbo].[WICInformationSheets] ([ItemNo], [InfoSheet]) VALUES (N'e74e837d-1d79-e411-8572-005056b42a5a', N'Viral Rash')
INSERT [dbo].[WICInformationSheets] ([ItemNo], [InfoSheet]) VALUES (N'e84e837d-1d79-e411-8572-005056b42a5a', N'Wrist Sprain or Strain')
INSERT [dbo].[WICInformationSheets] ([ItemNo], [InfoSheet]) VALUES (N'2307ad64-0580-e411-8572-005056b42a5a', N'Other')
/****** Object:  Table [dbo].[WICFinalDisposition]    Script Date: 05/22/2015 11:10:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WICFinalDisposition](
	[ItemNo] [uniqueidentifier] NOT NULL,
	[Disposition] [varchar](100) NOT NULL,
	[Ordering] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[WICFinalDisposition] ([ItemNo], [Disposition], [Ordering]) VALUES (N'd7258147-7f7e-e411-8572-005056b42a5a', N'Treated in WiC', NULL)
INSERT [dbo].[WICFinalDisposition] ([ItemNo], [Disposition], [Ordering]) VALUES (N'be258147-7f7e-e411-8572-005056b42a5a', N'Redirection to Antenatal Services', NULL)
INSERT [dbo].[WICFinalDisposition] ([ItemNo], [Disposition], [Ordering]) VALUES (N'bf258147-7f7e-e411-8572-005056b42a5a', N'Redirection to CALMS', NULL)
INSERT [dbo].[WICFinalDisposition] ([ItemNo], [Disposition], [Ordering]) VALUES (N'c0258147-7f7e-e411-8572-005056b42a5a', N'Redirection to ED - Queanbeyan', NULL)
INSERT [dbo].[WICFinalDisposition] ([ItemNo], [Disposition], [Ordering]) VALUES (N'c1258147-7f7e-e411-8572-005056b42a5a', N'Redirection to ED - Calvary', NULL)
INSERT [dbo].[WICFinalDisposition] ([ItemNo], [Disposition], [Ordering]) VALUES (N'c2258147-7f7e-e411-8572-005056b42a5a', N'Redirection to ED - TCH', NULL)
INSERT [dbo].[WICFinalDisposition] ([ItemNo], [Disposition], [Ordering]) VALUES (N'c3258147-7f7e-e411-8572-005056b42a5a', N'Redirection to GP', NULL)
INSERT [dbo].[WICFinalDisposition] ([ItemNo], [Disposition], [Ordering]) VALUES (N'c4258147-7f7e-e411-8572-005056b42a5a', N'Redirection to Medical Imaging', NULL)
INSERT [dbo].[WICFinalDisposition] ([ItemNo], [Disposition], [Ordering]) VALUES (N'c5258147-7f7e-e411-8572-005056b42a5a', N'Redirection to Pharmacy', NULL)
INSERT [dbo].[WICFinalDisposition] ([ItemNo], [Disposition], [Ordering]) VALUES (N'c6258147-7f7e-e411-8572-005056b42a5a', N'Redirection to Registrar Review/Outpatients Clinic', NULL)
INSERT [dbo].[WICFinalDisposition] ([ItemNo], [Disposition], [Ordering]) VALUES (N'c7258147-7f7e-e411-8572-005056b42a5a', N'Redirection via CATT ', NULL)
INSERT [dbo].[WICFinalDisposition] ([ItemNo], [Disposition], [Ordering]) VALUES (N'c8258147-7f7e-e411-8572-005056b42a5a', N'Interim Plan Provided and GP Referal', NULL)
INSERT [dbo].[WICFinalDisposition] ([ItemNo], [Disposition], [Ordering]) VALUES (N'c9258147-7f7e-e411-8572-005056b42a5a', N'Redirection to GP - Appt organised', NULL)
INSERT [dbo].[WICFinalDisposition] ([ItemNo], [Disposition], [Ordering]) VALUES (N'ca258147-7f7e-e411-8572-005056b42a5a', N'Code Blue Activated', NULL)
INSERT [dbo].[WICFinalDisposition] ([ItemNo], [Disposition], [Ordering]) VALUES (N'cb258147-7f7e-e411-8572-005056b42a5a', N'Intervention by Police', NULL)
INSERT [dbo].[WICFinalDisposition] ([ItemNo], [Disposition], [Ordering]) VALUES (N'cc258147-7f7e-e411-8572-005056b42a5a', N'Patient left WiC before assessment', NULL)
INSERT [dbo].[WICFinalDisposition] ([ItemNo], [Disposition], [Ordering]) VALUES (N'cd258147-7f7e-e411-8572-005056b42a5a', N'Patient left WiC during treatment', NULL)
INSERT [dbo].[WICFinalDisposition] ([ItemNo], [Disposition], [Ordering]) VALUES (N'ce258147-7f7e-e411-8572-005056b42a5a', N'WiC Shutdown - redirected to ED', NULL)
INSERT [dbo].[WICFinalDisposition] ([ItemNo], [Disposition], [Ordering]) VALUES (N'cf258147-7f7e-e411-8572-005056b42a5a', N'WiC Shutdown - redirected to GP', NULL)
INSERT [dbo].[WICFinalDisposition] ([ItemNo], [Disposition], [Ordering]) VALUES (N'd0258147-7f7e-e411-8572-005056b42a5a', N'Redirection to ED - Via ACTAS', NULL)
INSERT [dbo].[WICFinalDisposition] ([ItemNo], [Disposition], [Ordering]) VALUES (N'd1258147-7f7e-e411-8572-005056b42a5a', N'Redirection to ED after Rapid Assessment', NULL)
INSERT [dbo].[WICFinalDisposition] ([ItemNo], [Disposition], [Ordering]) VALUES (N'd2258147-7f7e-e411-8572-005056b42a5a', N'Redirection to ED - Pt refused ACTAS', NULL)
INSERT [dbo].[WICFinalDisposition] ([ItemNo], [Disposition], [Ordering]) VALUES (N'd3258147-7f7e-e411-8572-005056b42a5a', N'Redirection to GP after Rapid Assessment', NULL)
INSERT [dbo].[WICFinalDisposition] ([ItemNo], [Disposition], [Ordering]) VALUES (N'd4258147-7f7e-e411-8572-005056b42a5a', N'Redirection to ED via ACTAS after Rapid Assessment', NULL)
INSERT [dbo].[WICFinalDisposition] ([ItemNo], [Disposition], [Ordering]) VALUES (N'd5258147-7f7e-e411-8572-005056b42a5a', N'Redirection to Physiotherapist', NULL)
INSERT [dbo].[WICFinalDisposition] ([ItemNo], [Disposition], [Ordering]) VALUES (N'd6258147-7f7e-e411-8572-005056b42a5a', N'Redirection to CSHS', NULL)
INSERT [dbo].[WICFinalDisposition] ([ItemNo], [Disposition], [Ordering]) VALUES (N'd7258147-7f7e-e411-8572-005056b42a5a', N'Redirection to CHI', NULL)
/****** Object:  Table [dbo].[WICFinalClinicalImpression]    Script Date: 05/22/2015 11:10:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WICFinalClinicalImpression](
	[ItemNo] [uniqueidentifier] NOT NULL,
	[MainItem] [varchar](100) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'b8882573-647b-e411-8572-005056b42a5a', N'Abdominal Injury ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'b9882573-647b-e411-8572-005056b42a5a', N'Acute Abdominal Pain ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'ba882573-647b-e411-8572-005056b42a5a', N'Alcohol Misuse ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'bb882573-647b-e411-8572-005056b42a5a', N'Anaphylaxis ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'bc882573-647b-e411-8572-005056b42a5a', N'Ankle Achilles Tendon Injury ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'bd882573-647b-e411-8572-005056b42a5a', N'Ankle Chronic Pain ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'be882573-647b-e411-8572-005056b42a5a', N'Ankle Dislocated Ankle ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'bf882573-647b-e411-8572-005056b42a5a', N'Ankle Fractured Ankle ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'c0882573-647b-e411-8572-005056b42a5a', N'Ankle Infection  ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'c1882573-647b-e411-8572-005056b42a5a', N'Ankle Neurovascular Compromise ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'c2882573-647b-e411-8572-005056b42a5a', N'Ankle Referred Pain ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'c3882573-647b-e411-8572-005056b42a5a', N'Ankle Sprain ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'c4882573-647b-e411-8572-005056b42a5a', N'Ankle Tendon Injury ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'c5882573-647b-e411-8572-005056b42a5a', N'Back Pain ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'c6882573-647b-e411-8572-005056b42a5a', N'Bites and Stings - Ants ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'c7882573-647b-e411-8572-005056b42a5a', N'Bites and Stings - Bat ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'c8882573-647b-e411-8572-005056b42a5a', N'Bites and Stings - Bee ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'c9882573-647b-e411-8572-005056b42a5a', N'Bites and Stings - Cat/Dog ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'ca882573-647b-e411-8572-005056b42a5a', N'Bites and Stings - Caterpillars ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'cb882573-647b-e411-8572-005056b42a5a', N'Bites and Stings - Centipedes ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'cc882573-647b-e411-8572-005056b42a5a', N'Bites and Stings - European Wasp ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'cd882573-647b-e411-8572-005056b42a5a', N'Bites and Stings - Human ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'ce882573-647b-e411-8572-005056b42a5a', N'Bites and Stings - Insects ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'cf882573-647b-e411-8572-005056b42a5a', N'Bites and Stings - Marine Stingers ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'd0882573-647b-e411-8572-005056b42a5a', N'Bites and Stings - Spider ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'd1882573-647b-e411-8572-005056b42a5a', N'Bites and Stings - Ticks ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'd2882573-647b-e411-8572-005056b42a5a', N'Chest Injury ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'd3882573-647b-e411-8572-005056b42a5a', N'Chest Pain ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'd4882573-647b-e411-8572-005056b42a5a', N'Constipation ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'd5882573-647b-e411-8572-005056b42a5a', N'Diabetes High BGLs ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'd6882573-647b-e411-8572-005056b42a5a', N'Ear - Foreign Body ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'd7882573-647b-e411-8572-005056b42a5a', N'Ear - Ruptured Membrane ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'd8882573-647b-e411-8572-005056b42a5a', N'Ear Conditions Ear Wax ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'd9882573-647b-e411-8572-005056b42a5a', N'Ear Conditions Otitis Externa ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'da882573-647b-e411-8572-005056b42a5a', N'Ear Conditions Otitis Media ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'db882573-647b-e411-8572-005056b42a5a', N'Elbow Arthritis ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'dc882573-647b-e411-8572-005056b42a5a', N'Elbow Chronic Pain ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'dd882573-647b-e411-8572-005056b42a5a', N'Elbow Fractured Elbow  ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'de882573-647b-e411-8572-005056b42a5a', N'Elbow Infection ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'df882573-647b-e411-8572-005056b42a5a', N'Elbow Neurovascular Compromise ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'e0882573-647b-e411-8572-005056b42a5a', N'Elbow Pulled Elbow ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'e1882573-647b-e411-8572-005056b42a5a', N'Elbow Radial Nerve Entrapment ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'e2882573-647b-e411-8572-005056b42a5a', N'Elbow Referred Pain ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'e3882573-647b-e411-8572-005056b42a5a', N'Elbow Sprain ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'e4882573-647b-e411-8572-005056b42a5a', N'Elbow Tendon Injury ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'e5882573-647b-e411-8572-005056b42a5a', N'Epistaxis ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'e6882573-647b-e411-8572-005056b42a5a', N'Eye Conditions Allergic Conjunctivitis ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'e7882573-647b-e411-8572-005056b42a5a', N'Eye Conditions Dry Eye Syndrome ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'e8882573-647b-e411-8572-005056b42a5a', N'Eye Conditions Non-Invasive Foreign Body ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'e9882573-647b-e411-8572-005056b42a5a', N'Eye Conditions Single Red Eye ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'ea882573-647b-e411-8572-005056b42a5a', N'Eye Corneal Abrasion ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'eb882573-647b-e411-8572-005056b42a5a', N'Fever High Risk ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'ec882573-647b-e411-8572-005056b42a5a', N'Fever Intermediate Risk ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'ed882573-647b-e411-8572-005056b42a5a', N'Fever Low Risk ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'ee882573-647b-e411-8572-005056b42a5a', N'Finger/Toe Arthritis ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'ef882573-647b-e411-8572-005056b42a5a', N'Finger/Toe Chronic Pain ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'f0882573-647b-e411-8572-005056b42a5a', N'Finger/Toe Dislocation ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'f1882573-647b-e411-8572-005056b42a5a', N'Finger/Toe Fractured Finger/Toe ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'f2882573-647b-e411-8572-005056b42a5a', N'Finger/Toe Infection ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'f3882573-647b-e411-8572-005056b42a5a', N'Finger/Toe Joint Instability ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'f4882573-647b-e411-8572-005056b42a5a', N'Finger/Toe Mallet Finger ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'f5882573-647b-e411-8572-005056b42a5a', N'Finger/Toe Neurovascular Compromise ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'f6882573-647b-e411-8572-005056b42a5a', N'Finger/Toe Referred Pain ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'f7882573-647b-e411-8572-005056b42a5a', N'Finger/Toe Sprain ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'f8882573-647b-e411-8572-005056b42a5a', N'Finger/Toe Tendon Injury ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'f9882573-647b-e411-8572-005056b42a5a', N'Foot Chronic Pain ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'fa882573-647b-e411-8572-005056b42a5a', N'Foot Fracture Referral ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'fb882573-647b-e411-8572-005056b42a5a', N'Foot Infection ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'fc882573-647b-e411-8572-005056b42a5a', N'Foot Neurovascular Compromise ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'fd882573-647b-e411-8572-005056b42a5a', N'Foot Referred Pain ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'fe882573-647b-e411-8572-005056b42a5a', N'Foot Sprain ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'ff882573-647b-e411-8572-005056b42a5a', N'Foot Tendon Injury ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'00892573-647b-e411-8572-005056b42a5a', N'Fractures Dislocation ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'01892573-647b-e411-8572-005056b42a5a', N'Fractures Fracture Referral ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'02892573-647b-e411-8572-005056b42a5a', N'Fractures Fractured Lower Arm ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'03892573-647b-e411-8572-005056b42a5a', N'Fractures Fractured Lower Leg ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'04892573-647b-e411-8572-005056b42a5a', N'Fractures Fractured Upper Arm ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'05892573-647b-e411-8572-005056b42a5a', N'Fractures Fractured Upper Leg ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'06892573-647b-e411-8572-005056b42a5a', N'Fractures Neurovascular Compromise ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'07892573-647b-e411-8572-005056b42a5a', N'Fractures No Fracture Noted Referral ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'08892573-647b-e411-8572-005056b42a5a', N'Fractures Scaphoid Fracture ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'09892573-647b-e411-8572-005056b42a5a', N'Gastroenteritis Diarrhoea ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'0a892573-647b-e411-8572-005056b42a5a', N'Gastroenteritis Diarrhoea with pus or mucous ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'0b892573-647b-e411-8572-005056b42a5a', N'Gastroenteritis Haematemasis ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'0c892573-647b-e411-8572-005056b42a5a', N'Gastroenteritis Hyperemesis ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'0d892573-647b-e411-8572-005056b42a5a', N'Gastroenteritis Malaena ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'0e892573-647b-e411-8572-005056b42a5a', N'Gastroenteritis Vomiting ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'0f892573-647b-e411-8572-005056b42a5a', N'Genito-urinary Conditions Bacterial Vaginosis ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'10892573-647b-e411-8572-005056b42a5a', N'Genito-urinary Conditions Child Under 16 with Urinary Symptoms ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'11892573-647b-e411-8572-005056b42a5a', N'Genito-urinary Conditions Cystitis ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'12892573-647b-e411-8572-005056b42a5a', N'Genito-urinary Conditions Menorrhagia ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'13892573-647b-e411-8572-005056b42a5a', N'Genito-urinary Conditions Pregnancy with Abdo Pain ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'14892573-647b-e411-8572-005056b42a5a', N'Genito-Urinary Conditions Pregnancy with PV Loss ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'15892573-647b-e411-8572-005056b42a5a', N'Genito-urinary Conditions Primary Dysmenorrhoea ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'16892573-647b-e411-8572-005056b42a5a', N'Genito-Urinary Conditions Prostatitis ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'17892573-647b-e411-8572-005056b42a5a', N'Genito-urinary Conditions Pyelonephritis ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'18892573-647b-e411-8572-005056b42a5a', N'Genito-urinary Conditions Recurrent UTI ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'19892573-647b-e411-8572-005056b42a5a', N'Genito-urinary Conditions Secondary Dysmenorrhoea ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'1a892573-647b-e411-8572-005056b42a5a', N'Genito-urinary Conditions Urethritis ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'1b892573-647b-e411-8572-005056b42a5a', N'Genito-urinary Conditions Vaginal Candida  ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'1c892573-647b-e411-8572-005056b42a5a', N'Hand Chronic Pain ')
GO
print 'Processed 100 total records'
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'1d892573-647b-e411-8572-005056b42a5a', N'Hand Fractured Hand ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'1e892573-647b-e411-8572-005056b42a5a', N'Hand Infection ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'1f892573-647b-e411-8572-005056b42a5a', N'Hand Neurovascular Compromise ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'20892573-647b-e411-8572-005056b42a5a', N'Hand Referred Pain ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'21892573-647b-e411-8572-005056b42a5a', N'Hand Sprain ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'22892573-647b-e411-8572-005056b42a5a', N'Hand Tendon Injury ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'23892573-647b-e411-8572-005056b42a5a', N'Head Injury ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'24892573-647b-e411-8572-005056b42a5a', N'Headache Change in Consciousness ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'25892573-647b-e411-8572-005056b42a5a', N'Headache Chronic ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'26892573-647b-e411-8572-005056b42a5a', N'Headache Cluster ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'27892573-647b-e411-8572-005056b42a5a', N'Headache Exertional ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'28892573-647b-e411-8572-005056b42a5a', N'Headache Headache ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'29892573-647b-e411-8572-005056b42a5a', N'Headache Ice-pick ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'2a892573-647b-e411-8572-005056b42a5a', N'Headache Migraine ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'2b892573-647b-e411-8572-005056b42a5a', N'Headache Postural ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'2c892573-647b-e411-8572-005056b42a5a', N'Headache Sudden Onset ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'2d892573-647b-e411-8572-005056b42a5a', N'Headache Tension Headache ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'2e892573-647b-e411-8572-005056b42a5a', N'Headache with Fever ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'2f892573-647b-e411-8572-005056b42a5a', N'Headache with Trauma ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'30892573-647b-e411-8572-005056b42a5a', N'Headache with Vomiting ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'31892573-647b-e411-8572-005056b42a5a', N'Hypertension ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'32892573-647b-e411-8572-005056b42a5a', N'Infection Cellulitis ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'33892573-647b-e411-8572-005056b42a5a', N'Knee Atraumatic Knee Pain ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'34892573-647b-e411-8572-005056b42a5a', N'Knee Chronic Pain ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'35892573-647b-e411-8572-005056b42a5a', N'Knee Dislocated Patella ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'36892573-647b-e411-8572-005056b42a5a', N'Knee Fractured Knee ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'37892573-647b-e411-8572-005056b42a5a', N'Knee Infection ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'38892573-647b-e411-8572-005056b42a5a', N'Knee Ligament Injury ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'39892573-647b-e411-8572-005056b42a5a', N'Knee Reactive Arthritis ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'3a892573-647b-e411-8572-005056b42a5a', N'Knee Referred Pain ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'3b892573-647b-e411-8572-005056b42a5a', N'Knee Rheumatoid Arthritis ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'3c892573-647b-e411-8572-005056b42a5a', N'Knee Sprain ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'3d892573-647b-e411-8572-005056b42a5a', N'Knee Tendon Injury ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'3e892573-647b-e411-8572-005056b42a5a', N'LRTI - Asthma previously diagnosed ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'3f892573-647b-e411-8572-005056b42a5a', N'LRTI - Asthma undiagnosed ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'40892573-647b-e411-8572-005056b42a5a', N'Mastitis ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'41892573-647b-e411-8572-005056b42a5a', N'Mental Health First Aid ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'42892573-647b-e411-8572-005056b42a5a', N'Mouth Ulcers ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'43892573-647b-e411-8572-005056b42a5a', N'Muscle Injury Chronic Pain ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'44892573-647b-e411-8572-005056b42a5a', N'Muscle Injury Contusions ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'45892573-647b-e411-8572-005056b42a5a', N'Not within Scope - Not Asked ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'46892573-647b-e411-8572-005056b42a5a', N'Other -  Communicable Diseases ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'47892573-647b-e411-8572-005056b42a5a', N'Other - Dental ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'48892573-647b-e411-8572-005056b42a5a', N'Other - Gynaecological ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'49892573-647b-e411-8572-005056b42a5a', N'Other - Neurological ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'4a892573-647b-e411-8572-005056b42a5a', N'Other - Respiratory ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'4b892573-647b-e411-8572-005056b42a5a', N'Other - Sexual Health ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'4c892573-647b-e411-8572-005056b42a5a', N'Other - Skin Condition ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'4d892573-647b-e411-8572-005056b42a5a', N'Other - Urinary ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'4e892573-647b-e411-8572-005056b42a5a', N'Other - Vascular ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'4f892573-647b-e411-8572-005056b42a5a', N'Pneumonia ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'50892573-647b-e411-8572-005056b42a5a', N'Poisoning or Drug emergency ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'51892573-647b-e411-8572-005056b42a5a', N'Post Surgery complication ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'52892573-647b-e411-8572-005056b42a5a', N'PV Bleeding ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'53892573-647b-e411-8572-005056b42a5a', N'Rectal Bleeding ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'54892573-647b-e411-8572-005056b42a5a', N'Sexual Health Contraceptive Advice ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'55892573-647b-e411-8572-005056b42a5a', N'Sexual Health Positive Pregnacy Test ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'56892573-647b-e411-8572-005056b42a5a', N'Sexual Health Safe Sex Advice ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'57892573-647b-e411-8572-005056b42a5a', N'Sexual Health STI ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'58892573-647b-e411-8572-005056b42a5a', N'Skin Conditions Boils and Carbuncles ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'59892573-647b-e411-8572-005056b42a5a', N'Skin Conditions Candida Skin/Oral ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'5a892573-647b-e411-8572-005056b42a5a', N'Skin Conditions Chicken Pox ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'5b892573-647b-e411-8572-005056b42a5a', N'Skin Conditions Contact Dermatitis ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'5c892573-647b-e411-8572-005056b42a5a', N'Skin Conditions Eczema ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'5d892573-647b-e411-8572-005056b42a5a', N'Skin Conditions Fungal Infections ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'5e892573-647b-e411-8572-005056b42a5a', N'Skin Conditions Hand, Foot and Mouth ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'5f892573-647b-e411-8572-005056b42a5a', N'Skin Conditions Head or Pubic Lice ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'60892573-647b-e411-8572-005056b42a5a', N'Skin Conditions Impetigo ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'61892573-647b-e411-8572-005056b42a5a', N'Skin Conditions Paronychia ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'62892573-647b-e411-8572-005056b42a5a', N'Skin Conditions Scabies ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'63892573-647b-e411-8572-005056b42a5a', N'Skin Conditions Shingles ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'64892573-647b-e411-8572-005056b42a5a', N'Skin Conditions Urticaria ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'65892573-647b-e411-8572-005056b42a5a', N'Skin Conditions Viral Rash ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'66892573-647b-e411-8572-005056b42a5a', N'Spinal Injury ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'67892573-647b-e411-8572-005056b42a5a', N'Suture Removal ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'68892573-647b-e411-8572-005056b42a5a', N'Testicular Pain ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'69892573-647b-e411-8572-005056b42a5a', N'Threaten Abortion ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'6a892573-647b-e411-8572-005056b42a5a', N'Tooth Abscess ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'6b892573-647b-e411-8572-005056b42a5a', N'Toothache ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'6c892573-647b-e411-8572-005056b42a5a', N'URTI Earache ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'6d892573-647b-e411-8572-005056b42a5a', N'URTI Sore Throat ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'6e892573-647b-e411-8572-005056b42a5a', N'URTI Common Cold ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'6f892573-647b-e411-8572-005056b42a5a', N'URTI Hayfever ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'70892573-647b-e411-8572-005056b42a5a', N'URTI Influenza ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'71892573-647b-e411-8572-005056b42a5a', N'URTI Sinusitis ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'72892573-647b-e411-8572-005056b42a5a', N'URTI Sore Throat with Rash ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'73892573-647b-e411-8572-005056b42a5a', N'URTI Sore Throat with Spleenic Tenderness ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'74892573-647b-e411-8572-005056b42a5a', N'URTI Tonsillitis ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'75892573-647b-e411-8572-005056b42a5a', N'Vaccination/ Immunoglobulin ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'76892573-647b-e411-8572-005056b42a5a', N'Wound Dressing ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'77892573-647b-e411-8572-005056b42a5a', N'Wound Infection ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'78892573-647b-e411-8572-005056b42a5a', N'Wounds & Lacerations Avulsion ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'79892573-647b-e411-8572-005056b42a5a', N'Wounds and Lacerations Abrasions ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'7a892573-647b-e411-8572-005056b42a5a', N'Wounds and Lacerations Amputation ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'7b892573-647b-e411-8572-005056b42a5a', N'Wounds and Lacerations Burns ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'7c892573-647b-e411-8572-005056b42a5a', N'Wounds and Lacerations Cellulitis ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'7d892573-647b-e411-8572-005056b42a5a', N'Wounds and Lacerations Contusions ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'7e892573-647b-e411-8572-005056b42a5a', N'Wounds and Lacerations Foreign Body ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'7f892573-647b-e411-8572-005056b42a5a', N'Wounds and Lacerations Haemorrhage  ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'80892573-647b-e411-8572-005056b42a5a', N'Wounds and Lacerations Laceration ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'81892573-647b-e411-8572-005056b42a5a', N'Wounds and Lacerations Neurovascular Compromise ')
GO
print 'Processed 200 total records'
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'82892573-647b-e411-8572-005056b42a5a', N'Wounds and Lacerations Stab Wound ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'83892573-647b-e411-8572-005056b42a5a', N'Wounds and Lacerations Ulcer ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'84892573-647b-e411-8572-005056b42a5a', N'Wrist Arthritis ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'85892573-647b-e411-8572-005056b42a5a', N'Wrist Chronic Pain ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'86892573-647b-e411-8572-005056b42a5a', N'Wrist Dislocation ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'87892573-647b-e411-8572-005056b42a5a', N'Wrist Fractured Wrist ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'88892573-647b-e411-8572-005056b42a5a', N'Wrist Infection ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'89892573-647b-e411-8572-005056b42a5a', N'Wrist Neurovascular Compromise ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'8a892573-647b-e411-8572-005056b42a5a', N'Wrist Referred Pain ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'8b892573-647b-e411-8572-005056b42a5a', N'Wrist Scaphoid Injury ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'8c892573-647b-e411-8572-005056b42a5a', N'Wrist Sprain ')
INSERT [dbo].[WICFinalClinicalImpression] ([ItemNo], [MainItem]) VALUES (N'8d892573-647b-e411-8572-005056b42a5a', N'Wrist Tendon Injury ')
/****** Object:  Table [dbo].[WICDispositions]    Script Date: 05/22/2015 11:10:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WICDispositions](
	[ItemNo] [uniqueidentifier] NOT NULL,
	[Disposition] [varchar](50) NOT NULL,
	[Priority] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[WICDispositions] ([ItemNo], [Disposition], [Priority]) VALUES (N'2329094e-5875-e411-8572-005056b42a5a', N'Call 000', 1)
INSERT [dbo].[WICDispositions] ([ItemNo], [Disposition], [Priority]) VALUES (N'f307647b-5875-e411-8572-005056b42a5a', N'Attend Emergency Department Immediately', 2)
INSERT [dbo].[WICDispositions] ([ItemNo], [Disposition], [Priority]) VALUES (N'03bc6182-5875-e411-8572-005056b42a5a', N'Suitable for WiC', 3)
INSERT [dbo].[WICDispositions] ([ItemNo], [Disposition], [Priority]) VALUES (N'd3523589-5875-e411-8572-005056b42a5a', N'Refer to GP', 4)
INSERT [dbo].[WICDispositions] ([ItemNo], [Disposition], [Priority]) VALUES (N'4303ae90-5875-e411-8572-005056b42a5a', N'Refer to ED', 5)
INSERT [dbo].[WICDispositions] ([ItemNo], [Disposition], [Priority]) VALUES (N'4403ae90-5875-e411-8572-005056b42a5a', N'Refer to Nurse Practitioner', 6)
INSERT [dbo].[WICDispositions] ([ItemNo], [Disposition], [Priority]) VALUES (N'93a3519d-5875-e411-8572-005056b42a5a', N'See Doctor Immediately', 7)
INSERT [dbo].[WICDispositions] ([ItemNo], [Disposition], [Priority]) VALUES (N'83fda8bf-5875-e411-8572-005056b42a5a', N'See Doctor within 4 hours', 8)
INSERT [dbo].[WICDispositions] ([ItemNo], [Disposition], [Priority]) VALUES (N'f3ae12c6-5875-e411-8572-005056b42a5a', N'See Doctor within 24 hours', 9)
INSERT [dbo].[WICDispositions] ([ItemNo], [Disposition], [Priority]) VALUES (N'f36932cd-5875-e411-8572-005056b42a5a', N'Refer to Specialist Services', 10)
INSERT [dbo].[WICDispositions] ([ItemNo], [Disposition], [Priority]) VALUES (N'e338c8d7-5875-e411-8572-005056b42a5a', N'Consult Mental Health Treatment Protocol', 11)
INSERT [dbo].[WICDispositions] ([ItemNo], [Disposition], [Priority]) VALUES (N'33c708f5-5875-e411-8572-005056b42a5a', N'See Dentist within 24 hours', 12)
INSERT [dbo].[WICDispositions] ([ItemNo], [Disposition], [Priority]) VALUES (N'a3c5d301-5975-e411-8572-005056b42a5a', N'See Dentist within 72 hours', 13)
INSERT [dbo].[WICDispositions] ([ItemNo], [Disposition], [Priority]) VALUES (N'1363c30e-5975-e411-8572-005056b42a5a', N'See Dentist within 2 weeks', 14)
INSERT [dbo].[WICDispositions] ([ItemNo], [Disposition], [Priority]) VALUES (N'63cb3417-5975-e411-8572-005056b42a5a', N'Override to WiC Nurse Practitioner (NP)', 15)

 
/****** Object:  Table [dbo].[TBL_CWS_Goals_Interventions_Treatment]    Script Date: 03/18/2015 14:39:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
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
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ReferralToPathwayMappingHistory]    Script Date: 03/18/2015 14:39:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
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
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ReferralToPathwayMapping]    Script Date: 03/18/2015 14:39:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
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
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ReferralServiceMapping]    Script Date: 03/18/2015 14:39:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO

USE [OH_CM_Custom]
GO
SET IDENTITY_INSERT [dbo].[ReferralServiceMapping] ON
INSERT [dbo].[ReferralServiceMapping] ([id], [referralServiceName], [pathwayId], [project]) VALUES (75, N'WICS', N'Walk-In-Centre Pathway', N'CHI')
INSERT [dbo].[ReferralServiceMapping] ([id], [referralServiceName], [pathwayId], [project]) VALUES (78, N'WICN', N'Walk-In-Centre Pathway', N'CHI')
SET IDENTITY_INSERT [dbo].[ReferralServiceMapping] OFF



/****** Object:  Table [dbo].[PathwayToSubpathwayMappingHistory]    Script Date: 03/18/2015 14:39:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
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
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PathwayToSubpathway_Mapping]    Script Date: 03/18/2015 14:39:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[PathwayToSubpathway_Mapping](
	[uniqueId] [int] IDENTITY(1,1) NOT NULL,
	[version] [int] NOT NULL,
	[PathwayName] [nvarchar](50) NULL,
	[PathwayEnrolmentId] [nvarchar](50) NULL,
	[SubPathwayName] [nvarchar](50) NULL,
	[SubPathwayEnrolmentId] [nvarchar](50) NULL,
	[SubPathwayEnrolment_version] [int] NOT NULL,
	[SubEnrolmentStatus] [nchar](20) NULL,
	[messageId] [varchar](255) NOT NULL,
 CONSTRAINT [PK_PathwayToSubpathwayMapping] PRIMARY KEY CLUSTERED 
(
	[uniqueId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UC_PathwayToSubpathwayMapping] UNIQUE NONCLUSTERED 
(
	[SubPathwayEnrolmentId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

/****** Object:  Database [OH_CM_medicationManagement]    Script Date: 01/29/2015 21:35:04 ******/
CREATE DATABASE [OH_CM_medicationManagement]

ALTER DATABASE [OH_CM_medicationManagement] SET COMPATIBILITY_LEVEL = 100
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OH_CM_medicationManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE OH_CM_medicationManagement SET READ_COMMITTED_SNAPSHOT ON

GO
USE [OH_CM_medicationManagement]

CREATE TABLE SchemaMetaData (
	id INTEGER IDENTITY (1, 1) NOT NULL,
	name nvarchar(255) NOT NULL,
	version nvarchar(50) NOT NULL,
	CONSTRAINT PK_SchemaMetaData PRIMARY KEY CLUSTERED (id),
	CONSTRAINT UC_SchemaMetaData UNIQUE(name, version)
);

CREATE TABLE SchemaMetaDataHistory (
	id INTEGER IDENTITY (1, 1) NOT NULL,
	name nvarchar(255),
	version nvarchar(50) NOT NULL,
	updatedBy nvarchar(255) NOT NULL,
	updatedAt datetime NOT NULL,
	comments nvarchar(255) NOT NULL,
	CONSTRAINT PK_SchemaMetaDataHistory PRIMARY KEY CLUSTERED (id)
);

INSERT INTO SchemaMetaData (name, version) VALUES ('SchemaMetaData', '2.0.0.0');
INSERT INTO SchemaMetaDataHistory (name, version, updatedBy, updatedAt, comments) VALUES ('SchemaMetaData', '2.0.0.0', 'Orion Health', GETDATE(), 'Initial Installation');/**
 * DO NOT UPDATE THIS FILE.
 * 
 * From now on, any changes to the schema should be done in upgrade-MedMan-schema.sql. The reason for this is to make sure our schema is consistent,
 * whether it is generated from a clean install or an upgrade.
 * 
 * The plugin.xml that define a create-script has been updated so it will run both create-MedMan-schema.sql and upgrade-MedMan-schema.sql.
 */
    create table ArchiveDocumentMetadata (
        id numeric(19,0) identity not null,
        OPTLOCK int not null,
        archiveDate numeric(19,0) null,
        authorIdentifier nvarchar(255) not null,
        authorNamespace nvarchar(255) not null,
        category nvarchar(255) null,
        documentId nvarchar(255) null,
        patientIdentifier nvarchar(255) not null,
        patientNamespace nvarchar(255) not null,
        prescriptionId numeric(19,0) not null,
        subCategory nvarchar(255) null,
        title nvarchar(255) null,
        primary key (id),
        unique (prescriptionId)
    );

    create table DrugAdditionalInfo (
        id numeric(19,0) identity not null,
        OPTLOCK int not null,
        mpCode nvarchar(255) not null,
        notes nvarchar(1000) null,
        title nvarchar(255) null,
        primary key (id)
    );

    create table FullReview (
        id numeric(19,0) identity not null,
        OPTLOCK int not null,
        confirmedNoMeds tinyint null,
        patientIdentifier nvarchar(255) not null,
        patientNamespace nvarchar(255) not null,
        reviewerIdentifier nvarchar(255) not null,
        reviewerNamespace nvarchar(255) not null,
        status nvarchar(255) null,
        timestamp numeric(19,0) null,
        primary key (id)
    );

    create table MedAdministrationRequest (
        id numeric(19,0) identity not null,
        OPTLOCK int not null,
        brandCode nvarchar(255) null,
        brandName nvarchar(255) null,
        brandRestricted tinyint not null,
        code nvarchar(255) null,
        codingSystem nvarchar(255) null,
        controlledDrug tinyint not null,
        durationStartDate numeric(19,0) null,
        durationType nvarchar(255) null,
        durationUnitDays int null,
        durationUnitDescription nvarchar(255) null,
        durationUnitQuantity int null,
        patientIdentifier nvarchar(255) not null,
        patientNamespace nvarchar(255) not null,
        prescribingTerm nvarchar(255) null,
        status nvarchar(255) null,
        primary key (id)
    );

    create table MedicationAdministration (
        id numeric(19,0) identity not null,
        OPTLOCK int not null,
        administeredByIdentifier nvarchar(255) not null,
        administeredByNamespace nvarchar(255) not null,
        medAdminRequestId numeric(19,0) null,
        reasonNotGiven nvarchar(255) null,
        wasNotGiven tinyint null,
        whenGiven numeric(19,0) null,
        primary key (id)
    );

    create table MedicationPrescription (
        id numeric(19,0) identity not null,
        OPTLOCK int not null,
        additionalInstructions nvarchar(1000) null,
        brandCode nvarchar(255) null,
        brandName nvarchar(255) null,
        brandRestricted tinyint not null,
        code nvarchar(255) null,
        codingSystem nvarchar(255) null,
        comments nvarchar(255) null,
        controlledDrug tinyint not null,
        dose nvarchar(255) null,
        doseUnit nvarchar(255) null,
        drugActiveUnit nvarchar(255) null,
        drugForm nvarchar(255) null,
        durationStartDate numeric(19,0) null,
        durationType nvarchar(255) null,
        durationUnitDays int null,
        durationUnitDescription nvarchar(255) null,
        durationUnitQuantity int null,
        frequency nvarchar(255) null,
        fullReviewId numeric(19,0) null,
        indication nvarchar(255) null,
        patientIdentifier nvarchar(255) not null,
        patientNamespace nvarchar(255) not null,
        prescriberIdentifier nvarchar(255) not null,
        prescriberNamespace nvarchar(255) not null,
        prescribingTerm nvarchar(255) null,
        prn tinyint not null,
        recordState nvarchar(255) null,
        reviewDetailsId numeric(19,0) not null,
        route nvarchar(255) null,
        status nvarchar(255) null,
        supplyBlisterPack tinyint not null,
        supplyFixedQuantity int null,
        supplyFixedUnit nvarchar(255) null,
        supplySimpleQuantity nvarchar(255) null,
        supplyType nvarchar(255) null,
        transactionDate numeric(19,0) null,
        umi nvarchar(255) null,
        primary key (id),
        unique (reviewDetailsId)
    );

    create table MedicationStatement (
        id numeric(19,0) identity not null,
        OPTLOCK int not null,
        brandCode nvarchar(255) null,
        brandName nvarchar(255) null,
        brandRestricted tinyint not null,
        code nvarchar(255) null,
        codingSystem nvarchar(255) null,
        controlledDrug tinyint not null,
        deleted tinyint not null,
        lastUpdatedByIdentifier nvarchar(255) not null,
        lastUpdatedByNamespace nvarchar(255) not null,
        lastUpdatedDate numeric(19,0) null,
        patientIdentifier nvarchar(255) not null,
        patientNamespace nvarchar(255) not null,
        prescribingTerm nvarchar(255) null,
        startDate numeric(19,0) null,
        primary key (id)
    );

    create table Prescription (
        id numeric(19,0) identity not null,
        OPTLOCK int not null,
        patientIdentifier nvarchar(255) not null,
        patientNamespace nvarchar(255) not null,
        perscriberFullName nvarchar(255) null,
        perscriberIdentifier nvarchar(255) not null,
        perscriberNamespace nvarchar(255) not null,
        prescriptionDate numeric(19,0) null,
        primary key (id)
    );

    create table PrescriptionItem (
        id numeric(19,0) identity not null,
        OPTLOCK int not null,
        medicationPrescriptionId numeric(19,0) not null,
        prescriptionId numeric(19,0) not null,
        supplyBlisterPack tinyint not null,
        supplyFixedQuantity int null,
        supplyFixedUnit nvarchar(255) null,
        supplySimpleQuantity nvarchar(255) null,
        supplyType nvarchar(255) null,
        primary key (id)
    );

    create table ReviewDetails (
        id numeric(19,0) identity not null,
        OPTLOCK int not null,
        action nvarchar(255) null,
        beforeTxId numeric(19,0) null,
        reason nvarchar(255) null,
        reviewerIdentifier nvarchar(255) not null,
        reviewerNamespace nvarchar(255) not null,
        timestamp numeric(19,0) null,
        primary key (id)
    );

    alter table ArchiveDocumentMetadata 
        add constraint FK_ArDocMetaData_Prescription 
        foreign key (prescriptionId) 
        references Prescription;

    create index IX_FullReview_getLatestFR on FullReview (patientIdentifier, patientNamespace, status, timestamp);

    create index IX_MedAdmin_medAdminRequestId on MedicationAdministration (medAdminRequestId);

    alter table MedicationAdministration 
        add constraint FK_MedAdmin_MedAdminRequest 
        foreign key (medAdminRequestId) 
        references MedAdministrationRequest;

    create index IX_MedPresc_fullReviewId on MedicationPrescription (fullReviewId);

    create index IX_MedPresc_getActiveMedList on MedicationPrescription (patientIdentifier, patientNamespace, recordState, status);

    alter table MedicationPrescription 
        add constraint FK_MedPrec_FullReview 
        foreign key (fullReviewId) 
        references FullReview;

    alter table MedicationPrescription 
        add constraint FK_MedPresc_reviewDetailsId 
        foreign key (reviewDetailsId) 
        references ReviewDetails;

    create index IX_PrescItem_medPresc on PrescriptionItem (medicationPrescriptionId);

    create index IX_PrescItem_prescriptionId on PrescriptionItem (prescriptionId);

    alter table PrescriptionItem 
        add constraint FK_PrescItem_MedPresc 
        foreign key (medicationPrescriptionId) 
        references MedicationPrescription;

    alter table PrescriptionItem 
        add constraint FK_PrescItem_Prescription 
        foreign key (prescriptionId) 
        references Prescription;

    create index IX_ReviewDetails_beforeTxId on ReviewDetails (beforeTxId);

    alter table ReviewDetails 
        add constraint FK_ReviewDetails_MP_beforeTxId 
        foreign key (beforeTxId) 
        references MedicationPrescription;
--@#0.3.0

--@#0.4.0

-- MEM-484
alter table FullReview add reviewType nvarchar(255) null;

-- MEM-478
alter table FullReview add comments nvarchar(255) null

-- update schema metadata
INSERT INTO SchemaMetaData (name, version) VALUES ('Medication Management', '0.4.0')
;
INSERT INTO SchemaMetaDataHistory (name, version, updatedBy, updatedAt, comments) VALUES ('Medication Management', '0.4.0', 'Orion Health', GETDATE(), 'Initial installation script run manually')
;



GO 
USE [master]
GO
/****** Object:  Database [OH_CM_MessageLog]    Script Date: 01/29/2015 21:35:04 ******/
CREATE DATABASE [OH_CM_MessageLog]

ALTER DATABASE [OH_CM_MessageLog] SET COMPATIBILITY_LEVEL = 100
GO

ALTER DATABASE OH_CM_MessageLog SET READ_COMMITTED_SNAPSHOT ON
GO

USE [OH_CM_MessageLog]
CREATE TABLE SchemaMetaData (
	id INTEGER IDENTITY (1, 1) NOT NULL,
	name nvarchar(255) NOT NULL,
	version nvarchar(50) NOT NULL,
	CONSTRAINT PK_SchemaMetaData PRIMARY KEY CLUSTERED (id),
	CONSTRAINT UC_SchemaMetaData UNIQUE(name, version)
);

CREATE TABLE SchemaMetaDataHistory (
	id INTEGER IDENTITY (1, 1) NOT NULL,
	name nvarchar(255),
	version nvarchar(50) NOT NULL,
	updatedBy nvarchar(255) NOT NULL,
	updatedAt datetime NOT NULL,
	comments nvarchar(255) NOT NULL,
	CONSTRAINT PK_SchemaMetaDataHistory PRIMARY KEY CLUSTERED (id)
);

INSERT INTO SchemaMetaData (name, version) VALUES ('SchemaMetaData', '2.0.0.0');
INSERT INTO SchemaMetaDataHistory (name, version, updatedBy, updatedAt, comments) VALUES ('SchemaMetaData', '2.0.0.0', 'Orion Health', GETDATE(), 'Initial Installation');
    create table MessageStatus (
        id bigint identity not null,
        connectionDetailId bigint null,
        endpointId int null,
        error nvarchar(max) null,
        messageId bigint null,
        messageDate datetime null,
        responseId bigint null,
        responseDate datetime null,
        responseCode int not null,
        messageType int null,
        messageTypeName nvarchar(255) null,
        state tinyint not null,
        primary key (id)        
    );

    create table MessageContent (
        id bigint identity not null,
        content varbinary(max) null,
        value0 nvarchar(255) null,
        value1 nvarchar(255) null,
        value2 nvarchar(255) null,
        value3 nvarchar(255) null,
        value4 nvarchar(255) null,
        value5 nvarchar(255) null,
        value6 nvarchar(255) null,
        value7 nvarchar(255) null,
        value8 nvarchar(255) null,
        value9 nvarchar(255) null,
        primary key (id)
    );

    create table ConnectionDetail (
        id bigint identity not null,
        endpointId int null,
        localAddress nvarchar(255) null,
        localPort int not null,
        remoteAddress nvarchar(255) null,
        remotePort int not null,
        createdDate datetime null,
        closedDate datetime null,
        connectionType int null,
        primary key (id)
    );
    
    create table EndpointName (
    	id int identity not null,
    	name nvarchar(255) null,
    	primary key (id)
    );

    create index IX_MessageContent_value0 on MessageContent (value0);

    create index IX_MessageContent_value1 on MessageContent (value1);

    create index IX_MessageContent_value2 on MessageContent (value2);

    create index IX_MessageContent_value3 on MessageContent (value3);

    create index IX_MessageContent_value4 on MessageContent (value4);

    create index IX_MessageContent_value5 on MessageContent (value5);

    create index IX_MessageContent_value6 on MessageContent (value6);

    create index IX_MessageContent_value7 on MessageContent (value7);

    create index IX_MessageContent_value8 on MessageContent (value8);

    create index IX_MessageContent_value9 on MessageContent (value9);

    create index IX_MsgStatus_endpoint on MessageStatus (endpointId);

    create index IX_MsgStatus_message on MessageStatus (messageId);

    create index IX_MsgStatus_messageDate on MessageStatus (messageDate);

    create index IX_MsgStatus_response on MessageStatus (responseId);

    create index IX_MsgStatus_responseDate on MessageStatus (responseDate);
    
    create index IX_MsgStatus_state on MessageStatus (state);
    
    create unique index IX_EndpointName_name on EndpointName (name);
    
    alter table MessageStatus 
        add constraint FK_MsgStatus_connection 
        foreign key (connectionDetailId)
        references ConnectionDetail;

    alter table MessageStatus 
        add constraint FK_MsgStatus_message 
        foreign key (messageId)
        references MessageContent;

    alter table MessageStatus 
        add constraint FK_MsgStatus_response 
        foreign key (responseId)
        references MessageContent;

    alter table MessageStatus 
        add constraint FK_MsgStatus_endpoint 
        foreign key (endpointId)
        references EndpointName;
        
    alter table ConnectionDetail 
        add constraint FK_ConnDetail_endpoint 
        foreign key (endpointId)
        references EndpointName;

-- update schema metadata
INSERT INTO SchemaMetaData (name, version) VALUES ('Message Archive', '7.2.0')
;
INSERT INTO SchemaMetaDataHistory (name, version, updatedBy, updatedAt, comments) VALUES ('Message Archive', '7.2.0', 'Orion Health', GETDATE(), 'Initial installation script run manually')
;

GO
USE [master]
GO
/****** Object:  Database [OH_CM_RelationshipStore]    Script Date: 01/29/2015 21:35:05 ******/
CREATE DATABASE [OH_CM_RelationshipStore]

ALTER DATABASE [OH_CM_RelationshipStore] SET COMPATIBILITY_LEVEL = 100
GO

ALTER DATABASE OH_CM_RelationshipStore SET READ_COMMITTED_SNAPSHOT ON


GO
USE [OH_CM_RelationshipStore]
GO

CREATE TABLE SchemaMetaData (
	id INTEGER IDENTITY (1, 1) NOT NULL,
	name nvarchar(255) NOT NULL,
	version nvarchar(50) NOT NULL,
	CONSTRAINT PK_SchemaMetaData PRIMARY KEY CLUSTERED (id),
	CONSTRAINT UC_SchemaMetaData UNIQUE(name, version)
);

CREATE TABLE SchemaMetaDataHistory (
	id INTEGER IDENTITY (1, 1) NOT NULL,
	name nvarchar(255),
	version nvarchar(50) NOT NULL,
	updatedBy nvarchar(255) NOT NULL,
	updatedAt datetime NOT NULL,
	comments nvarchar(255) NOT NULL,
	CONSTRAINT PK_SchemaMetaDataHistory PRIMARY KEY CLUSTERED (id)
);

INSERT INTO SchemaMetaData (name, version) VALUES ('SchemaMetaData', '2.0.0.0');
INSERT INTO SchemaMetaDataHistory (name, version, updatedBy, updatedAt, comments) VALUES ('SchemaMetaData', '2.0.0.0', 'Orion Health', GETDATE(), 'Initial Installation');
    create table Relationshipstore (
        patientidentifier nvarchar(255) not null,
        patientnamespace nvarchar(255) not null,
        relatedEntityidentifier nvarchar(255) not null,
        relatedEntitynamespace nvarchar(255) not null,
        relationshipType nvarchar(255) not null,
        endDate datetime null,
        startDate datetime not null,
        constraint PK_Relationshipstore primary key (patientidentifier, patientnamespace, relatedEntityidentifier, relatedEntitynamespace, relationshipType, startDate)
    );

    create index IX_GenRela_patientId on Relationshipstore (patientidentifier, patientnamespace);

    create index IX_GenRela_relatedEntityId on Relationshipstore (relatedEntityidentifier, relatedEntitynamespace);

    create index IX_GenRela_startDate on Relationshipstore (startDate);

-- update schema metadata
INSERT INTO SchemaMetaData (name, version) VALUES ('RelationshipStoreGeneric', '8.9.0')
;
INSERT INTO SchemaMetaDataHistory (name, version, updatedBy, updatedAt, comments) VALUES ('RelationshipStoreGeneric', '8.9.0', 'Orion Health', GETDATE(), 'Initial installation script run manually')
;


GO
USE [master]
GO
/****** Object:  Database [OH_CM_Task]    Script Date: 01/29/2015 21:35:05 ******/
CREATE DATABASE [OH_CM_Task]

ALTER DATABASE [OH_CM_Task] SET COMPATIBILITY_LEVEL = 100
GO

ALTER DATABASE OH_CM_Task SET READ_COMMITTED_SNAPSHOT ON


GO
USE [OH_CM_Task]
GO

CREATE TABLE SchemaMetaData (
	id INTEGER IDENTITY (1, 1) NOT NULL,
	name nvarchar(255) NOT NULL,
	version nvarchar(50) NOT NULL,
	CONSTRAINT PK_SchemaMetaData PRIMARY KEY CLUSTERED (id),
	CONSTRAINT UC_SchemaMetaData UNIQUE(name, version)
);

CREATE TABLE SchemaMetaDataHistory (
	id INTEGER IDENTITY (1, 1) NOT NULL,
	name nvarchar(255),
	version nvarchar(50) NOT NULL,
	updatedBy nvarchar(255) NOT NULL,
	updatedAt datetime NOT NULL,
	comments nvarchar(255) NOT NULL,
	CONSTRAINT PK_SchemaMetaDataHistory PRIMARY KEY CLUSTERED (id)
);

INSERT INTO SchemaMetaData (name, version) VALUES ('SchemaMetaData', '2.0.0.0');
INSERT INTO SchemaMetaDataHistory (name, version, updatedBy, updatedAt, comments) VALUES ('SchemaMetaData', '2.0.0.0', 'Orion Health', GETDATE(), 'Initial Installation');
    create table PatientId (
        uniqueId numeric(19,0) not null,
        id nvarchar(100) not null,
        namespace nvarchar(100) not null,
        unique (id, namespace)
    );

    alter table PatientId add constraint PK_PatientId primary key (uniqueId);

    create table PersistentTask (
        uniqueId numeric(19,0) not null,
        DTYPE nvarchar(31) not null,
        abnormal tinyint not null,
        adhoc tinyint not null,
        assignedTo numeric(19,0) null,
        creationTime datetime not null,
        creationTimeZone nvarchar(255) not null,
        custom01 nvarchar(255) null,
        custom02 nvarchar(255) null,
        custom03 nvarchar(255) null,
        custom04 nvarchar(255) null,
        custom05 nvarchar(255) null,
        customBlob varbinary(MAX) null,
        dataId nvarchar(255) null,
        dataVersion numeric(19,0) null,
        modelId nvarchar(255) null,
        modelVersion numeric(19,0) null,
        modificationTime datetime not null,
        modificationTimeZone nvarchar(255) not null,
        note text null,
        ordering int not null,
        owner numeric(19,0) not null,
        primaryTask tinyint not null,
        reassigned tinyint not null,
        resolutionTime datetime null,
        resolutionTimeZone nvarchar(255) null,
        resolvedBy numeric(19,0) null,
        subjectKey nvarchar(450) null,
        hashSubjectKey varbinary(16) null,
        taskDisplayName numeric(19,0) null,
        taskIdentifier nvarchar(255) not null,
        taskStatus numeric(19,0) not null,
        taskType numeric(19,0) not null,
        unique (taskIdentifier)
    );

    alter table PersistentTask add constraint PK_PersistentTask primary key (uniqueId);

    create table ProviderRef (
        uniqueId numeric(19,0) not null,
        id nvarchar(100) not null,
        namespace nvarchar(100) not null,
        unique (id, namespace)
    );

    alter table ProviderRef add constraint PK_ProviderRef primary key (uniqueId);

    create table SchedulableTaskGroup (
        uniqueId numeric(19,0) not null,
        applicableFromTime datetime not null,
        applicableFromTimeZone nvarchar(255) not null,
        dueTime datetime not null,
        dueTimeZone nvarchar(255) not null,
        notificationTime datetime null,
        notificationTimeZone nvarchar(255) null,
        patient numeric(19,0) not null
    );

    alter table SchedulableTaskGroup add constraint PK_SchedulableTaskGroup primary key (uniqueId);

    create table SchedulingPeriod (
        uniqueId numeric(19,0) not null,
        cancelled tinyint not null,
        delta int not null,
        patientId nvarchar(100) not null,
        patientNamespace nvarchar(100) not null,
        subjectKey nvarchar(450) null,
        hashSubjectKey varbinary(16) null,
        taskTypeName nvarchar(100) not null,
        unit int not null
    );

    alter table SchedulingPeriod add constraint PK_SchedulingPeriod primary key (uniqueId);
    
    create index IX_SchedulingPeriod_identifier ON SchedulingPeriod (patientId, patientNamespace, taskTypeName);
    create index IX_SchedulingPeriod_subjectKey ON SchedulingPeriod (taskTypeName, hashSubjectKey);

    create table TaskDisplayName (
        uniqueId numeric(19,0) not null,
        taskDisplayName nvarchar(255) not null,
        unique (taskDisplayName)
    );

    alter table TaskDisplayName add constraint PK_TaskDisplayName primary key (uniqueId);

    create table TaskStatus (
        uniqueId numeric(19,0) not null,
        identifyingName nvarchar(255) not null,
        mappedStatus nvarchar(255) not null,
        unique (identifyingName)
    );

    alter table TaskStatus add constraint PK_TaskStatus primary key (uniqueId);

    create table TaskType (
        uniqueId numeric(19,0) not null,
        identifyingName nvarchar(255) not null,
        unique (identifyingName)
    );

    alter table TaskType add constraint PK_TaskType primary key (uniqueId);

    create index IDX_PersistentTask_assignedTo on PersistentTask (assignedTo);

    create index IDX_PersistentTask_owner on PersistentTask (owner);

    create index IDX_PersistentTask_resolvedBy on PersistentTask (resolvedBy);

    create index IDX_Task_hashSubjectKey on PersistentTask (hashSubjectKey);

    create index IDX_PersistentTask_taskStatus on PersistentTask (taskStatus);

    create index IDX_PersistentTask_taskType on PersistentTask (taskType);

    alter table PersistentTask 
        add constraint FK_PersistentTask_assignedTo 
        foreign key (assignedTo) 
        references ProviderRef;

    alter table PersistentTask 
        add constraint FK_PersistentTask_resolvedBy 
        foreign key (resolvedBy) 
        references ProviderRef;

    alter table PersistentTask 
        add constraint FK_PersistentTask_owner 
        foreign key (owner) 
        references SchedulableTaskGroup;

    alter table PersistentTask 
        add constraint FK_PersistentTask_displayName 
        foreign key (taskDisplayName) 
        references TaskDisplayName;

    alter table PersistentTask 
        add constraint FK_PersistentTask_taskStatus 
        foreign key (taskStatus) 
        references TaskStatus;

    alter table PersistentTask 
        add constraint FK_PersistentTask_taskType 
        foreign key (taskType) 
        references TaskType;

    create index IDX_SchTaskGroup_patient on SchedulableTaskGroup (patient);

    alter table SchedulableTaskGroup 
        add constraint FK_SchTaskGroup_patient 
        foreign key (patient) 
        references PatientId;

    create index IDX_TaskStatus_MappedStatus on TaskStatus (mappedStatus);

    create table hibernate_sequences (
         sequence_name nvarchar(255) not null ,
         next_val numeric(19,0),
        primary key ( sequence_name ) 
    ) ;



-- This script is used as both a create script and an update script. If we make further changes to these views it should be separated out to separate create and update scripts.

--@#7.7.1
IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.VIEWS WHERE TABLE_NAME = 'vw_TSK_IncompleteTasks')
	DROP VIEW [dbo].[vw_TSK_IncompleteTasks];
GO
CREATE VIEW [dbo].[vw_TSK_IncompleteTasks]
AS
SELECT		pt.taskIdentifier, ast.id AssignedId, ast.namespace AssignedNamespace, pt.creationTime, pt.creationTimeZone, pt.abnormal,
					stg.notificationTime nearlyDueTime, stg.notificationTimeZone nearlyDueTimeZone, stg.dueTime, stg.dueTimeZone,
					td.taskDisplayName DisplayName, ts.mappedStatus TaskStatus, tt.identifyingName TaskType
FROM		dbo.PersistentTask AS pt
					INNER JOIN dbo.SchedulableTaskGroup AS stg ON pt.owner = stg.uniqueId
					INNER JOIN dbo.TaskStatus AS ts ON pt.taskStatus = ts.uniqueId
					INNER JOIN dbo.TaskType AS tt ON pt.taskType = tt.uniqueId
					LEFT OUTER JOIN dbo.TaskDisplayName AS td ON pt.taskDisplayName = td.uniqueId
					LEFT OUTER JOIN dbo.ProviderRef AS ast ON pt.assignedTo = ast.uniqueId
WHERE		(pt.resolutionTime IS NULL);

GO 
IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.VIEWS WHERE TABLE_NAME = 'vw_TSK_TasksNearlyOverdue')
	DROP VIEW [dbo].[vw_TSK_TasksNearlyOverdue];
GO
CREATE VIEW [dbo].[vw_TSK_TasksNearlyOverdue]
AS
SELECT		pt.taskIdentifier, ast.id AssignedId, ast.namespace AssignedNamespace, pt.creationTime, pt.creationTimeZone, pt.abnormal,
					stg.notificationTime nearlyDueTime, stg.notificationTimeZone nearlyDueTimeZone, stg.dueTime, stg.dueTimeZone,
					td.taskDisplayName DisplayName, ts.mappedStatus TaskStatus, tt.identifyingName TaskType
FROM		dbo.PersistentTask AS pt
					INNER JOIN dbo.SchedulableTaskGroup AS stg ON pt.owner = stg.uniqueId
					INNER JOIN dbo.TaskStatus AS ts ON pt.taskStatus = ts.uniqueId
					INNER JOIN dbo.TaskType AS tt ON pt.taskType = tt.uniqueId
					LEFT OUTER JOIN dbo.TaskDisplayName AS td ON pt.taskDisplayName = td.uniqueId
					LEFT OUTER JOIN dbo.ProviderRef AS ast ON pt.assignedTo = ast.uniqueId
WHERE		(pt.resolutionTime IS NULL) AND  (GETDATE() BETWEEN stg.notificationTime AND stg.dueTime);

GO
IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.VIEWS WHERE TABLE_NAME = 'vw_TSK_TasksOverdue')
	DROP VIEW [dbo].[vw_TSK_TasksOverdue];
GO
CREATE VIEW [dbo].[vw_TSK_TasksOverdue]
AS
SELECT		pt.taskIdentifier, ast.id AssignedId, ast.namespace AssignedNamespace, pt.creationTime, pt.creationTimeZone, pt.abnormal,
					stg.notificationTime nearlyDueTime, stg.notificationTimeZone nearlyDueTimeZone, stg.dueTime, stg.dueTimeZone,
					td.taskDisplayName DisplayName, ts.mappedStatus TaskStatus, tt.identifyingName TaskType
FROM		dbo.PersistentTask AS pt
					INNER JOIN dbo.SchedulableTaskGroup AS stg ON pt.owner = stg.uniqueId
					INNER JOIN dbo.TaskStatus AS ts ON pt.taskStatus = ts.uniqueId
					INNER JOIN dbo.TaskType AS tt ON pt.taskType = tt.uniqueId
					LEFT OUTER JOIN dbo.TaskDisplayName AS td ON pt.taskDisplayName = td.uniqueId
					LEFT OUTER JOIN dbo.ProviderRef AS ast ON pt.assignedTo = ast.uniqueId
WHERE		(pt.resolutionTime IS NULL) AND (stg.dueTime < GETDATE());

GO
IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.VIEWS WHERE TABLE_NAME = 'vw_TSK_TasksComplete')
	DROP VIEW [dbo].[vw_TSK_TasksComplete];
GO
CREATE VIEW [dbo].[vw_TSK_TasksComplete]
AS
SELECT		pt.taskIdentifier, ast.id AssignedId, ast.namespace AssignedNamespace, pt.creationTime, pt.creationTimeZone, pt.abnormal,
					stg.notificationTime nearlyDueTime, stg.notificationTimeZone nearlyDueTimeZone, stg.dueTime, stg.dueTimeZone,
					pt.resolutionTime, pt.resolutionTimeZone, rb.id ResolvedById, rb.namespace ResolvedByNamespace,
					td.taskDisplayName DisplayName, ts.mappedStatus TaskStatus, tt.identifyingName TaskType
FROM		dbo.PersistentTask AS pt
					INNER JOIN dbo.SchedulableTaskGroup AS stg ON pt.owner = stg.uniqueId
					INNER JOIN dbo.TaskStatus AS ts ON pt.taskStatus = ts.uniqueId
					INNER JOIN dbo.TaskType AS tt ON pt.taskType = tt.uniqueId
					LEFT OUTER JOIN dbo.TaskDisplayName AS td ON pt.taskDisplayName = td.uniqueId
					LEFT OUTER JOIN dbo.ProviderRef AS ast ON pt.assignedTo = ast.uniqueId
					LEFT OUTER JOIN dbo.ProviderRef AS rb ON pt.resolvedBy = rb.uniqueId
WHERE		(pt.resolutionTime IS NOT NULL);
GO
-- update schema metadata
INSERT INTO SchemaMetaData (name, version) VALUES ('Tasks', '8.6.0')
;
INSERT INTO SchemaMetaDataHistory (name, version, updatedBy, updatedAt, comments) VALUES ('Tasks', '8.6.0', 'Orion Health', GETDATE(), 'Initial installation script run manually')
;

GO
USE [master]
GO

/****** Object:  Database [OH_cWhiteboard]    Script Date: 01/29/2015 21:35:05 ******/
CREATE DATABASE [OH_cWhiteboard]

ALTER DATABASE [OH_cWhiteboard] SET COMPATIBILITY_LEVEL = 100
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OH_cWhiteboard].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE OH_cWhiteboard SET READ_COMMITTED_SNAPSHOT ON


GO

USE [OH_cWhiteboard]
GO
/****** Object:  ForeignKey [FK_ActButtonParam_ActionButton]    Script Date: 06/18/2015 12:04:35 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ActButtonParam_ActionButton]') AND parent_object_id = OBJECT_ID(N'[dbo].[ActionButtonParameter]'))
ALTER TABLE [dbo].[ActionButtonParameter] DROP CONSTRAINT [FK_ActButtonParam_ActionButton]
GO
/****** Object:  ForeignKey [FK_ActButtonParam_RefColumn]    Script Date: 06/18/2015 12:04:35 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ActButtonParam_RefColumn]') AND parent_object_id = OBJECT_ID(N'[dbo].[ActionButtonParameter]'))
ALTER TABLE [dbo].[ActionButtonParameter] DROP CONSTRAINT [FK_ActButtonParam_RefColumn]
GO
/****** Object:  ForeignKey [FK_Area_Site]    Script Date: 06/18/2015 12:04:35 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Area_Site]') AND parent_object_id = OBJECT_ID(N'[dbo].[Area]'))
ALTER TABLE [dbo].[Area] DROP CONSTRAINT [FK_Area_Site]
GO
/****** Object:  ForeignKey [FK_Cache_AssignedConsultant]    Script Date: 06/18/2015 12:04:35 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Cache_AssignedConsultant]') AND parent_object_id = OBJECT_ID(N'[dbo].[Cache]'))
ALTER TABLE [dbo].[Cache] DROP CONSTRAINT [FK_Cache_AssignedConsultant]
GO
/****** Object:  ForeignKey [FK_Cache_AssignedDoctor]    Script Date: 06/18/2015 12:04:35 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Cache_AssignedDoctor]') AND parent_object_id = OBJECT_ID(N'[dbo].[Cache]'))
ALTER TABLE [dbo].[Cache] DROP CONSTRAINT [FK_Cache_AssignedDoctor]
GO
/****** Object:  ForeignKey [FK_Cache_AssignedNurse]    Script Date: 06/18/2015 12:04:35 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Cache_AssignedNurse]') AND parent_object_id = OBJECT_ID(N'[dbo].[Cache]'))
ALTER TABLE [dbo].[Cache] DROP CONSTRAINT [FK_Cache_AssignedNurse]
GO
/****** Object:  ForeignKey [FK_Cache_Location]    Script Date: 06/18/2015 12:04:35 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Cache_Location]') AND parent_object_id = OBJECT_ID(N'[dbo].[Cache]'))
ALTER TABLE [dbo].[Cache] DROP CONSTRAINT [FK_Cache_Location]
GO
/****** Object:  ForeignKey [FK_Cache_Patient]    Script Date: 06/18/2015 12:04:35 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Cache_Patient]') AND parent_object_id = OBJECT_ID(N'[dbo].[Cache]'))
ALTER TABLE [dbo].[Cache] DROP CONSTRAINT [FK_Cache_Patient]
GO
/****** Object:  ForeignKey [FK_Cache_SeenByDoctor]    Script Date: 06/18/2015 12:04:35 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Cache_SeenByDoctor]') AND parent_object_id = OBJECT_ID(N'[dbo].[Cache]'))
ALTER TABLE [dbo].[Cache] DROP CONSTRAINT [FK_Cache_SeenByDoctor]
GO
/****** Object:  ForeignKey [FK_Cache_SeenByNurse]    Script Date: 06/18/2015 12:04:35 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Cache_SeenByNurse]') AND parent_object_id = OBJECT_ID(N'[dbo].[Cache]'))
ALTER TABLE [dbo].[Cache] DROP CONSTRAINT [FK_Cache_SeenByNurse]
GO
/****** Object:  ForeignKey [FK_Cache_Site]    Script Date: 06/18/2015 12:04:35 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Cache_Site]') AND parent_object_id = OBJECT_ID(N'[dbo].[Cache]'))
ALTER TABLE [dbo].[Cache] DROP CONSTRAINT [FK_Cache_Site]
GO
/****** Object:  ForeignKey [FK_Cache_Specialty]    Script Date: 06/18/2015 12:04:35 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Cache_Specialty]') AND parent_object_id = OBJECT_ID(N'[dbo].[Cache]'))
ALTER TABLE [dbo].[Cache] DROP CONSTRAINT [FK_Cache_Specialty]
GO
/****** Object:  ForeignKey [FK_Cache_TreatmentProtocol]    Script Date: 06/18/2015 12:04:35 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Cache_TreatmentProtocol]') AND parent_object_id = OBJECT_ID(N'[dbo].[Cache]'))
ALTER TABLE [dbo].[Cache] DROP CONSTRAINT [FK_Cache_TreatmentProtocol]
GO
/****** Object:  ForeignKey [FK_CacheTableHist_Consultant]    Script Date: 06/18/2015 12:04:35 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CacheTableHist_Consultant]') AND parent_object_id = OBJECT_ID(N'[dbo].[CacheTableHistory]'))
ALTER TABLE [dbo].[CacheTableHistory] DROP CONSTRAINT [FK_CacheTableHist_Consultant]
GO
/****** Object:  ForeignKey [FK_CacheTableHist_Location]    Script Date: 06/18/2015 12:04:35 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CacheTableHist_Location]') AND parent_object_id = OBJECT_ID(N'[dbo].[CacheTableHistory]'))
ALTER TABLE [dbo].[CacheTableHistory] DROP CONSTRAINT [FK_CacheTableHist_Location]
GO
/****** Object:  ForeignKey [FK_CacheTableHistory_Cache]    Script Date: 06/18/2015 12:04:35 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CacheTableHistory_Cache]') AND parent_object_id = OBJECT_ID(N'[dbo].[CacheTableHistory]'))
ALTER TABLE [dbo].[CacheTableHistory] DROP CONSTRAINT [FK_CacheTableHistory_Cache]
GO
/****** Object:  ForeignKey [FK_ConSpecFacLink_Consultant]    Script Date: 06/18/2015 12:04:35 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ConSpecFacLink_Consultant]') AND parent_object_id = OBJECT_ID(N'[dbo].[ConsultantSpecialtyFacLink]'))
ALTER TABLE [dbo].[ConsultantSpecialtyFacLink] DROP CONSTRAINT [FK_ConSpecFacLink_Consultant]
GO
/****** Object:  ForeignKey [FK_ConSpecFacLink_SpecFacLink]    Script Date: 06/18/2015 12:04:35 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ConSpecFacLink_SpecFacLink]') AND parent_object_id = OBJECT_ID(N'[dbo].[ConsultantSpecialtyFacLink]'))
ALTER TABLE [dbo].[ConsultantSpecialtyFacLink] DROP CONSTRAINT [FK_ConSpecFacLink_SpecFacLink]
GO
/****** Object:  ForeignKey [FK_Diagnosis_Patient]    Script Date: 06/18/2015 12:04:36 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Diagnosis_Patient]') AND parent_object_id = OBJECT_ID(N'[dbo].[Diagnosis]'))
ALTER TABLE [dbo].[Diagnosis] DROP CONSTRAINT [FK_Diagnosis_Patient]
GO
/****** Object:  ForeignKey [FK_Diagnosis_Specialty]    Script Date: 06/18/2015 12:04:36 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Diagnosis_Specialty]') AND parent_object_id = OBJECT_ID(N'[dbo].[Diagnosis]'))
ALTER TABLE [dbo].[Diagnosis] DROP CONSTRAINT [FK_Diagnosis_Specialty]
GO
/****** Object:  ForeignKey [FK_DiagSearchEnable_Specialty]    Script Date: 06/18/2015 12:04:36 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DiagSearchEnable_Specialty]') AND parent_object_id = OBJECT_ID(N'[dbo].[DiagnosisSearchEnable]'))
ALTER TABLE [dbo].[DiagnosisSearchEnable] DROP CONSTRAINT [FK_DiagSearchEnable_Specialty]
GO
/****** Object:  ForeignKey [FK_DisplayColumn_PrimRefColumn]    Script Date: 06/18/2015 12:04:36 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DisplayColumn_PrimRefColumn]') AND parent_object_id = OBJECT_ID(N'[dbo].[DisplayColumn]'))
ALTER TABLE [dbo].[DisplayColumn] DROP CONSTRAINT [FK_DisplayColumn_PrimRefColumn]
GO
/****** Object:  ForeignKey [FK_DocConLink_ConSpecFacLink]    Script Date: 06/18/2015 12:04:36 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DocConLink_ConSpecFacLink]') AND parent_object_id = OBJECT_ID(N'[dbo].[DoctorConsultantLink]'))
ALTER TABLE [dbo].[DoctorConsultantLink] DROP CONSTRAINT [FK_DocConLink_ConSpecFacLink]
GO
/****** Object:  ForeignKey [FK_DocConLink_Doctor]    Script Date: 06/18/2015 12:04:36 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DocConLink_Doctor]') AND parent_object_id = OBJECT_ID(N'[dbo].[DoctorConsultantLink]'))
ALTER TABLE [dbo].[DoctorConsultantLink] DROP CONSTRAINT [FK_DocConLink_Doctor]
GO
/****** Object:  ForeignKey [FK_ExtPatientId_Patient]    Script Date: 06/18/2015 12:04:36 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ExtPatientId_Patient]') AND parent_object_id = OBJECT_ID(N'[dbo].[ExternalPatientId]'))
ALTER TABLE [dbo].[ExternalPatientId] DROP CONSTRAINT [FK_ExtPatientId_Patient]
GO
/****** Object:  ForeignKey [FK_Filter_DataSource]    Script Date: 06/18/2015 12:04:36 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Filter_DataSource]') AND parent_object_id = OBJECT_ID(N'[dbo].[Filter]'))
ALTER TABLE [dbo].[Filter] DROP CONSTRAINT [FK_Filter_DataSource]
GO
/****** Object:  ForeignKey [FK_FilterOption_Filter]    Script Date: 06/18/2015 12:04:36 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FilterOption_Filter]') AND parent_object_id = OBJECT_ID(N'[dbo].[FilterOption]'))
ALTER TABLE [dbo].[FilterOption] DROP CONSTRAINT [FK_FilterOption_Filter]
GO
/****** Object:  ForeignKey [FK_ImportInfo_DataSource]    Script Date: 06/18/2015 12:04:36 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ImportInfo_DataSource]') AND parent_object_id = OBJECT_ID(N'[dbo].[ImportInformation]'))
ALTER TABLE [dbo].[ImportInformation] DROP CONSTRAINT [FK_ImportInfo_DataSource]
GO
/****** Object:  ForeignKey [FK_LastUsedView_Site]    Script Date: 06/18/2015 12:04:36 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LastUsedView_Site]') AND parent_object_id = OBJECT_ID(N'[dbo].[LastUsedView]'))
ALTER TABLE [dbo].[LastUsedView] DROP CONSTRAINT [FK_LastUsedView_Site]
GO
/****** Object:  ForeignKey [FK_LastUsedView_View]    Script Date: 06/18/2015 12:04:36 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LastUsedView_View]') AND parent_object_id = OBJECT_ID(N'[dbo].[LastUsedView]'))
ALTER TABLE [dbo].[LastUsedView] DROP CONSTRAINT [FK_LastUsedView_View]
GO
/****** Object:  ForeignKey [FK_Location_Area]    Script Date: 06/18/2015 12:04:36 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Location_Area]') AND parent_object_id = OBJECT_ID(N'[dbo].[Location]'))
ALTER TABLE [dbo].[Location] DROP CONSTRAINT [FK_Location_Area]
GO
/****** Object:  ForeignKey [FK_Location_Site]    Script Date: 06/18/2015 12:04:36 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Location_Site]') AND parent_object_id = OBJECT_ID(N'[dbo].[Location]'))
ALTER TABLE [dbo].[Location] DROP CONSTRAINT [FK_Location_Site]
GO
/****** Object:  ForeignKey [FK_NurseAssignment_Nurse]    Script Date: 06/18/2015 12:04:37 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_NurseAssignment_Nurse]') AND parent_object_id = OBJECT_ID(N'[dbo].[NurseAssignment]'))
ALTER TABLE [dbo].[NurseAssignment] DROP CONSTRAINT [FK_NurseAssignment_Nurse]
GO
/****** Object:  ForeignKey [FK_NurseAssignment_Site]    Script Date: 06/18/2015 12:04:37 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_NurseAssignment_Site]') AND parent_object_id = OBJECT_ID(N'[dbo].[NurseAssignment]'))
ALTER TABLE [dbo].[NurseAssignment] DROP CONSTRAINT [FK_NurseAssignment_Site]
GO
/****** Object:  ForeignKey [FK_PatMapCubicle_Image]    Script Date: 06/18/2015 12:04:37 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatMapCubicle_Image]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientMapCubicle]'))
ALTER TABLE [dbo].[PatientMapCubicle] DROP CONSTRAINT [FK_PatMapCubicle_Image]
GO
/****** Object:  ForeignKey [FK_PatMapCubicle_LinkedArea]    Script Date: 06/18/2015 12:04:37 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatMapCubicle_LinkedArea]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientMapCubicle]'))
ALTER TABLE [dbo].[PatientMapCubicle] DROP CONSTRAINT [FK_PatMapCubicle_LinkedArea]
GO
/****** Object:  ForeignKey [FK_PatMapCubicle_Location]    Script Date: 06/18/2015 12:04:37 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatMapCubicle_Location]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientMapCubicle]'))
ALTER TABLE [dbo].[PatientMapCubicle] DROP CONSTRAINT [FK_PatMapCubicle_Location]
GO
/****** Object:  ForeignKey [FK_PatMapCubiCoord_PatMapCubi]    Script Date: 06/18/2015 12:04:37 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatMapCubiCoord_PatMapCubi]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientMapCubicleCoordinate]'))
ALTER TABLE [dbo].[PatientMapCubicleCoordinate] DROP CONSTRAINT [FK_PatMapCubiCoord_PatMapCubi]
GO
/****** Object:  ForeignKey [FK_PatMapImage_Area]    Script Date: 06/18/2015 12:04:37 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatMapImage_Area]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientMapImage]'))
ALTER TABLE [dbo].[PatientMapImage] DROP CONSTRAINT [FK_PatMapImage_Area]
GO
/****** Object:  ForeignKey [FK_PatMapImage_Site]    Script Date: 06/18/2015 12:04:37 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatMapImage_Site]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientMapImage]'))
ALTER TABLE [dbo].[PatientMapImage] DROP CONSTRAINT [FK_PatMapImage_Site]
GO
/****** Object:  ForeignKey [FK_PatMapSpecIcon_Specialty]    Script Date: 06/18/2015 12:04:37 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatMapSpecIcon_Specialty]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientMapSpecialtyIcon]'))
ALTER TABLE [dbo].[PatientMapSpecialtyIcon] DROP CONSTRAINT [FK_PatMapSpecIcon_Specialty]
GO
/****** Object:  ForeignKey [FK_RefColumn_ActionButton]    Script Date: 06/18/2015 12:04:37 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RefColumn_ActionButton]') AND parent_object_id = OBJECT_ID(N'[dbo].[ReferenceColumn]'))
ALTER TABLE [dbo].[ReferenceColumn] DROP CONSTRAINT [FK_RefColumn_ActionButton]
GO
/****** Object:  ForeignKey [FK_RefColumn_DisplayColumn]    Script Date: 06/18/2015 12:04:37 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RefColumn_DisplayColumn]') AND parent_object_id = OBJECT_ID(N'[dbo].[ReferenceColumn]'))
ALTER TABLE [dbo].[ReferenceColumn] DROP CONSTRAINT [FK_RefColumn_DisplayColumn]
GO
/****** Object:  ForeignKey [FK_Result_Patient]    Script Date: 06/18/2015 12:04:37 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Result_Patient]') AND parent_object_id = OBJECT_ID(N'[dbo].[Result]'))
ALTER TABLE [dbo].[Result] DROP CONSTRAINT [FK_Result_Patient]
GO
/****** Object:  ForeignKey [FK_SchMetaDataHist_SchMetaData]    Script Date: 06/18/2015 12:04:37 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SchMetaDataHist_SchMetaData]') AND parent_object_id = OBJECT_ID(N'[dbo].[SchemaMetaDataHistory]'))
ALTER TABLE [dbo].[SchemaMetaDataHistory] DROP CONSTRAINT [FK_SchMetaDataHist_SchMetaData]
GO
/****** Object:  ForeignKey [FK_Site_DefaultView]    Script Date: 06/18/2015 12:04:37 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Site_DefaultView]') AND parent_object_id = OBJECT_ID(N'[dbo].[Site]'))
ALTER TABLE [dbo].[Site] DROP CONSTRAINT [FK_Site_DefaultView]
GO
/****** Object:  ForeignKey [FK_Site_Facility]    Script Date: 06/18/2015 12:04:37 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Site_Facility]') AND parent_object_id = OBJECT_ID(N'[dbo].[Site]'))
ALTER TABLE [dbo].[Site] DROP CONSTRAINT [FK_Site_Facility]
GO
/****** Object:  ForeignKey [FK_SiteViewLink_Site]    Script Date: 06/18/2015 12:04:37 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SiteViewLink_Site]') AND parent_object_id = OBJECT_ID(N'[dbo].[SiteViewLink]'))
ALTER TABLE [dbo].[SiteViewLink] DROP CONSTRAINT [FK_SiteViewLink_Site]
GO
/****** Object:  ForeignKey [FK_SiteViewLink_View]    Script Date: 06/18/2015 12:04:37 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SiteViewLink_View]') AND parent_object_id = OBJECT_ID(N'[dbo].[SiteViewLink]'))
ALTER TABLE [dbo].[SiteViewLink] DROP CONSTRAINT [FK_SiteViewLink_View]
GO
/****** Object:  ForeignKey [FK_SpecFacLink_Facility]    Script Date: 06/18/2015 12:04:38 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SpecFacLink_Facility]') AND parent_object_id = OBJECT_ID(N'[dbo].[SpecialtyFacilityLink]'))
ALTER TABLE [dbo].[SpecialtyFacilityLink] DROP CONSTRAINT [FK_SpecFacLink_Facility]
GO
/****** Object:  ForeignKey [FK_SpecFacLink_Specialty]    Script Date: 06/18/2015 12:04:38 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SpecFacLink_Specialty]') AND parent_object_id = OBJECT_ID(N'[dbo].[SpecialtyFacilityLink]'))
ALTER TABLE [dbo].[SpecialtyFacilityLink] DROP CONSTRAINT [FK_SpecFacLink_Specialty]
GO
/****** Object:  ForeignKey [FK_ViewActButton_ActButton]    Script Date: 06/18/2015 12:04:38 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ViewActButton_ActButton]') AND parent_object_id = OBJECT_ID(N'[dbo].[ViewActionButton]'))
ALTER TABLE [dbo].[ViewActionButton] DROP CONSTRAINT [FK_ViewActButton_ActButton]
GO
/****** Object:  ForeignKey [FK_ViewActButton_View]    Script Date: 06/18/2015 12:04:38 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ViewActButton_View]') AND parent_object_id = OBJECT_ID(N'[dbo].[ViewActionButton]'))
ALTER TABLE [dbo].[ViewActionButton] DROP CONSTRAINT [FK_ViewActButton_View]
GO
/****** Object:  ForeignKey [FK_ViewColumn_DisplayColumn]    Script Date: 06/18/2015 12:04:38 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ViewColumn_DisplayColumn]') AND parent_object_id = OBJECT_ID(N'[dbo].[ViewColumn]'))
ALTER TABLE [dbo].[ViewColumn] DROP CONSTRAINT [FK_ViewColumn_DisplayColumn]
GO
/****** Object:  ForeignKey [FK_ViewColumn_View]    Script Date: 06/18/2015 12:04:38 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ViewColumn_View]') AND parent_object_id = OBJECT_ID(N'[dbo].[ViewColumn]'))
ALTER TABLE [dbo].[ViewColumn] DROP CONSTRAINT [FK_ViewColumn_View]
GO
/****** Object:  ForeignKey [FK_ViewFilter_Filter]    Script Date: 06/18/2015 12:04:38 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ViewFilter_Filter]') AND parent_object_id = OBJECT_ID(N'[dbo].[ViewFilter]'))
ALTER TABLE [dbo].[ViewFilter] DROP CONSTRAINT [FK_ViewFilter_Filter]
GO
/****** Object:  ForeignKey [FK_ViewFilter_View]    Script Date: 06/18/2015 12:04:38 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ViewFilter_View]') AND parent_object_id = OBJECT_ID(N'[dbo].[ViewFilter]'))
ALTER TABLE [dbo].[ViewFilter] DROP CONSTRAINT [FK_ViewFilter_View]
GO
/****** Object:  ForeignKey [FK_WebLink_DisplayColumn]    Script Date: 06/18/2015 12:04:38 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WebLink_DisplayColumn]') AND parent_object_id = OBJECT_ID(N'[dbo].[WebLink]'))
ALTER TABLE [dbo].[WebLink] DROP CONSTRAINT [FK_WebLink_DisplayColumn]
GO
/****** Object:  ForeignKey [FK_WebLinkParam_RefColumn]    Script Date: 06/18/2015 12:04:38 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WebLinkParam_RefColumn]') AND parent_object_id = OBJECT_ID(N'[dbo].[WebLinkParameter]'))
ALTER TABLE [dbo].[WebLinkParameter] DROP CONSTRAINT [FK_WebLinkParam_RefColumn]
GO
/****** Object:  ForeignKey [FK_WebLinkParam_WebLink]    Script Date: 06/18/2015 12:04:38 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WebLinkParam_WebLink]') AND parent_object_id = OBJECT_ID(N'[dbo].[WebLinkParameter]'))
ALTER TABLE [dbo].[WebLinkParameter] DROP CONSTRAINT [FK_WebLinkParam_WebLink]
GO
/****** Object:  Table [dbo].[CacheTableHistory]    Script Date: 06/18/2015 12:04:35 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CacheTableHist_Consultant]') AND parent_object_id = OBJECT_ID(N'[dbo].[CacheTableHistory]'))
ALTER TABLE [dbo].[CacheTableHistory] DROP CONSTRAINT [FK_CacheTableHist_Consultant]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CacheTableHist_Location]') AND parent_object_id = OBJECT_ID(N'[dbo].[CacheTableHistory]'))
ALTER TABLE [dbo].[CacheTableHistory] DROP CONSTRAINT [FK_CacheTableHist_Location]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CacheTableHistory_Cache]') AND parent_object_id = OBJECT_ID(N'[dbo].[CacheTableHistory]'))
ALTER TABLE [dbo].[CacheTableHistory] DROP CONSTRAINT [FK_CacheTableHistory_Cache]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CacheTableHistory]') AND type in (N'U'))
DROP TABLE [dbo].[CacheTableHistory]
GO
/****** Object:  Table [dbo].[PatientMapCubicleCoordinate]    Script Date: 06/18/2015 12:04:37 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatMapCubiCoord_PatMapCubi]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientMapCubicleCoordinate]'))
ALTER TABLE [dbo].[PatientMapCubicleCoordinate] DROP CONSTRAINT [FK_PatMapCubiCoord_PatMapCubi]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientMapCubicleCoordinate]') AND type in (N'U'))
DROP TABLE [dbo].[PatientMapCubicleCoordinate]
GO
/****** Object:  StoredProcedure [dbo].[UpdateDischarge]    Script Date: 06/18/2015 12:04:34 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateDischarge]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[UpdateDischarge]
GO
/****** Object:  Table [dbo].[PatientMapCubicle]    Script Date: 06/18/2015 12:04:37 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatMapCubicle_Image]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientMapCubicle]'))
ALTER TABLE [dbo].[PatientMapCubicle] DROP CONSTRAINT [FK_PatMapCubicle_Image]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatMapCubicle_LinkedArea]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientMapCubicle]'))
ALTER TABLE [dbo].[PatientMapCubicle] DROP CONSTRAINT [FK_PatMapCubicle_LinkedArea]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatMapCubicle_Location]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientMapCubicle]'))
ALTER TABLE [dbo].[PatientMapCubicle] DROP CONSTRAINT [FK_PatMapCubicle_Location]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientMapCubicle]') AND type in (N'U'))
DROP TABLE [dbo].[PatientMapCubicle]
GO
/****** Object:  Table [dbo].[Cache]    Script Date: 06/18/2015 12:04:35 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Cache_AssignedConsultant]') AND parent_object_id = OBJECT_ID(N'[dbo].[Cache]'))
ALTER TABLE [dbo].[Cache] DROP CONSTRAINT [FK_Cache_AssignedConsultant]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Cache_AssignedDoctor]') AND parent_object_id = OBJECT_ID(N'[dbo].[Cache]'))
ALTER TABLE [dbo].[Cache] DROP CONSTRAINT [FK_Cache_AssignedDoctor]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Cache_AssignedNurse]') AND parent_object_id = OBJECT_ID(N'[dbo].[Cache]'))
ALTER TABLE [dbo].[Cache] DROP CONSTRAINT [FK_Cache_AssignedNurse]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Cache_Location]') AND parent_object_id = OBJECT_ID(N'[dbo].[Cache]'))
ALTER TABLE [dbo].[Cache] DROP CONSTRAINT [FK_Cache_Location]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Cache_Patient]') AND parent_object_id = OBJECT_ID(N'[dbo].[Cache]'))
ALTER TABLE [dbo].[Cache] DROP CONSTRAINT [FK_Cache_Patient]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Cache_SeenByDoctor]') AND parent_object_id = OBJECT_ID(N'[dbo].[Cache]'))
ALTER TABLE [dbo].[Cache] DROP CONSTRAINT [FK_Cache_SeenByDoctor]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Cache_SeenByNurse]') AND parent_object_id = OBJECT_ID(N'[dbo].[Cache]'))
ALTER TABLE [dbo].[Cache] DROP CONSTRAINT [FK_Cache_SeenByNurse]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Cache_Site]') AND parent_object_id = OBJECT_ID(N'[dbo].[Cache]'))
ALTER TABLE [dbo].[Cache] DROP CONSTRAINT [FK_Cache_Site]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Cache_Specialty]') AND parent_object_id = OBJECT_ID(N'[dbo].[Cache]'))
ALTER TABLE [dbo].[Cache] DROP CONSTRAINT [FK_Cache_Specialty]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Cache_TreatmentProtocol]') AND parent_object_id = OBJECT_ID(N'[dbo].[Cache]'))
ALTER TABLE [dbo].[Cache] DROP CONSTRAINT [FK_Cache_TreatmentProtocol]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cache]') AND type in (N'U'))
DROP TABLE [dbo].[Cache]
GO
/****** Object:  Table [dbo].[DoctorConsultantLink]    Script Date: 06/18/2015 12:04:36 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DocConLink_ConSpecFacLink]') AND parent_object_id = OBJECT_ID(N'[dbo].[DoctorConsultantLink]'))
ALTER TABLE [dbo].[DoctorConsultantLink] DROP CONSTRAINT [FK_DocConLink_ConSpecFacLink]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DocConLink_Doctor]') AND parent_object_id = OBJECT_ID(N'[dbo].[DoctorConsultantLink]'))
ALTER TABLE [dbo].[DoctorConsultantLink] DROP CONSTRAINT [FK_DocConLink_Doctor]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DoctorConsultantLink]') AND type in (N'U'))
DROP TABLE [dbo].[DoctorConsultantLink]
GO
/****** Object:  Table [dbo].[Location]    Script Date: 06/18/2015 12:04:36 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Location_Area]') AND parent_object_id = OBJECT_ID(N'[dbo].[Location]'))
ALTER TABLE [dbo].[Location] DROP CONSTRAINT [FK_Location_Area]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Location_Site]') AND parent_object_id = OBJECT_ID(N'[dbo].[Location]'))
ALTER TABLE [dbo].[Location] DROP CONSTRAINT [FK_Location_Site]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Location]') AND type in (N'U'))
DROP TABLE [dbo].[Location]
GO
/****** Object:  Table [dbo].[PatientMapImage]    Script Date: 06/18/2015 12:04:37 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatMapImage_Area]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientMapImage]'))
ALTER TABLE [dbo].[PatientMapImage] DROP CONSTRAINT [FK_PatMapImage_Area]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatMapImage_Site]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientMapImage]'))
ALTER TABLE [dbo].[PatientMapImage] DROP CONSTRAINT [FK_PatMapImage_Site]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientMapImage]') AND type in (N'U'))
DROP TABLE [dbo].[PatientMapImage]
GO
/****** Object:  Table [dbo].[FilterOption]    Script Date: 06/18/2015 12:04:36 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FilterOption_Filter]') AND parent_object_id = OBJECT_ID(N'[dbo].[FilterOption]'))
ALTER TABLE [dbo].[FilterOption] DROP CONSTRAINT [FK_FilterOption_Filter]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FilterOption]') AND type in (N'U'))
DROP TABLE [dbo].[FilterOption]
GO
/****** Object:  Table [dbo].[NurseAssignment]    Script Date: 06/18/2015 12:04:37 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_NurseAssignment_Nurse]') AND parent_object_id = OBJECT_ID(N'[dbo].[NurseAssignment]'))
ALTER TABLE [dbo].[NurseAssignment] DROP CONSTRAINT [FK_NurseAssignment_Nurse]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_NurseAssignment_Site]') AND parent_object_id = OBJECT_ID(N'[dbo].[NurseAssignment]'))
ALTER TABLE [dbo].[NurseAssignment] DROP CONSTRAINT [FK_NurseAssignment_Site]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NurseAssignment]') AND type in (N'U'))
DROP TABLE [dbo].[NurseAssignment]
GO
/****** Object:  Table [dbo].[ConsultantSpecialtyFacLink]    Script Date: 06/18/2015 12:04:35 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ConSpecFacLink_Consultant]') AND parent_object_id = OBJECT_ID(N'[dbo].[ConsultantSpecialtyFacLink]'))
ALTER TABLE [dbo].[ConsultantSpecialtyFacLink] DROP CONSTRAINT [FK_ConSpecFacLink_Consultant]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ConSpecFacLink_SpecFacLink]') AND parent_object_id = OBJECT_ID(N'[dbo].[ConsultantSpecialtyFacLink]'))
ALTER TABLE [dbo].[ConsultantSpecialtyFacLink] DROP CONSTRAINT [FK_ConSpecFacLink_SpecFacLink]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ConsultantSpecialtyFacLink]') AND type in (N'U'))
DROP TABLE [dbo].[ConsultantSpecialtyFacLink]
GO
/****** Object:  Table [dbo].[Area]    Script Date: 06/18/2015 12:04:35 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Area_Site]') AND parent_object_id = OBJECT_ID(N'[dbo].[Area]'))
ALTER TABLE [dbo].[Area] DROP CONSTRAINT [FK_Area_Site]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Area]') AND type in (N'U'))
DROP TABLE [dbo].[Area]
GO
/****** Object:  Table [dbo].[LastUsedView]    Script Date: 06/18/2015 12:04:36 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LastUsedView_Site]') AND parent_object_id = OBJECT_ID(N'[dbo].[LastUsedView]'))
ALTER TABLE [dbo].[LastUsedView] DROP CONSTRAINT [FK_LastUsedView_Site]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LastUsedView_View]') AND parent_object_id = OBJECT_ID(N'[dbo].[LastUsedView]'))
ALTER TABLE [dbo].[LastUsedView] DROP CONSTRAINT [FK_LastUsedView_View]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LastUsedView]') AND type in (N'U'))
DROP TABLE [dbo].[LastUsedView]
GO
/****** Object:  Table [dbo].[SiteViewLink]    Script Date: 06/18/2015 12:04:37 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SiteViewLink_Site]') AND parent_object_id = OBJECT_ID(N'[dbo].[SiteViewLink]'))
ALTER TABLE [dbo].[SiteViewLink] DROP CONSTRAINT [FK_SiteViewLink_Site]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SiteViewLink_View]') AND parent_object_id = OBJECT_ID(N'[dbo].[SiteViewLink]'))
ALTER TABLE [dbo].[SiteViewLink] DROP CONSTRAINT [FK_SiteViewLink_View]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SiteViewLink]') AND type in (N'U'))
DROP TABLE [dbo].[SiteViewLink]
GO
/****** Object:  Table [dbo].[ViewFilter]    Script Date: 06/18/2015 12:04:38 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ViewFilter_Filter]') AND parent_object_id = OBJECT_ID(N'[dbo].[ViewFilter]'))
ALTER TABLE [dbo].[ViewFilter] DROP CONSTRAINT [FK_ViewFilter_Filter]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ViewFilter_View]') AND parent_object_id = OBJECT_ID(N'[dbo].[ViewFilter]'))
ALTER TABLE [dbo].[ViewFilter] DROP CONSTRAINT [FK_ViewFilter_View]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ViewFilter]') AND type in (N'U'))
DROP TABLE [dbo].[ViewFilter]
GO
/****** Object:  Table [dbo].[SpecialtyFacilityLink]    Script Date: 06/18/2015 12:04:38 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SpecFacLink_Facility]') AND parent_object_id = OBJECT_ID(N'[dbo].[SpecialtyFacilityLink]'))
ALTER TABLE [dbo].[SpecialtyFacilityLink] DROP CONSTRAINT [FK_SpecFacLink_Facility]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SpecFacLink_Specialty]') AND parent_object_id = OBJECT_ID(N'[dbo].[SpecialtyFacilityLink]'))
ALTER TABLE [dbo].[SpecialtyFacilityLink] DROP CONSTRAINT [FK_SpecFacLink_Specialty]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SpecialtyFacilityLink]') AND type in (N'U'))
DROP TABLE [dbo].[SpecialtyFacilityLink]
GO
/****** Object:  Table [dbo].[Result]    Script Date: 06/18/2015 12:04:37 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Result_Patient]') AND parent_object_id = OBJECT_ID(N'[dbo].[Result]'))
ALTER TABLE [dbo].[Result] DROP CONSTRAINT [FK_Result_Patient]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Result_LastUpdateDttm]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Result] DROP CONSTRAINT [DF_Result_LastUpdateDttm]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Result]') AND type in (N'U'))
DROP TABLE [dbo].[Result]
GO
/****** Object:  Table [dbo].[ViewActionButton]    Script Date: 06/18/2015 12:04:38 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ViewActButton_ActButton]') AND parent_object_id = OBJECT_ID(N'[dbo].[ViewActionButton]'))
ALTER TABLE [dbo].[ViewActionButton] DROP CONSTRAINT [FK_ViewActButton_ActButton]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ViewActButton_View]') AND parent_object_id = OBJECT_ID(N'[dbo].[ViewActionButton]'))
ALTER TABLE [dbo].[ViewActionButton] DROP CONSTRAINT [FK_ViewActButton_View]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ViewActionButton]') AND type in (N'U'))
DROP TABLE [dbo].[ViewActionButton]
GO
/****** Object:  Table [dbo].[Diagnosis]    Script Date: 06/18/2015 12:04:36 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Diagnosis_Patient]') AND parent_object_id = OBJECT_ID(N'[dbo].[Diagnosis]'))
ALTER TABLE [dbo].[Diagnosis] DROP CONSTRAINT [FK_Diagnosis_Patient]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Diagnosis_Specialty]') AND parent_object_id = OBJECT_ID(N'[dbo].[Diagnosis]'))
ALTER TABLE [dbo].[Diagnosis] DROP CONSTRAINT [FK_Diagnosis_Specialty]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Diagnosis]') AND type in (N'U'))
DROP TABLE [dbo].[Diagnosis]
GO
/****** Object:  Table [dbo].[DiagnosisSearchEnable]    Script Date: 06/18/2015 12:04:36 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DiagSearchEnable_Specialty]') AND parent_object_id = OBJECT_ID(N'[dbo].[DiagnosisSearchEnable]'))
ALTER TABLE [dbo].[DiagnosisSearchEnable] DROP CONSTRAINT [FK_DiagSearchEnable_Specialty]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DiagnosisSearchEnable]') AND type in (N'U'))
DROP TABLE [dbo].[DiagnosisSearchEnable]
GO
/****** Object:  Table [dbo].[ExternalPatientId]    Script Date: 06/18/2015 12:04:36 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ExtPatientId_Patient]') AND parent_object_id = OBJECT_ID(N'[dbo].[ExternalPatientId]'))
ALTER TABLE [dbo].[ExternalPatientId] DROP CONSTRAINT [FK_ExtPatientId_Patient]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ExternalPatientId]') AND type in (N'U'))
DROP TABLE [dbo].[ExternalPatientId]
GO
/****** Object:  Table [dbo].[Filter]    Script Date: 06/18/2015 12:04:36 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Filter_DataSource]') AND parent_object_id = OBJECT_ID(N'[dbo].[Filter]'))
ALTER TABLE [dbo].[Filter] DROP CONSTRAINT [FK_Filter_DataSource]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Filter]') AND type in (N'U'))
DROP TABLE [dbo].[Filter]
GO
/****** Object:  Table [dbo].[ImportInformation]    Script Date: 06/18/2015 12:04:36 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ImportInfo_DataSource]') AND parent_object_id = OBJECT_ID(N'[dbo].[ImportInformation]'))
ALTER TABLE [dbo].[ImportInformation] DROP CONSTRAINT [FK_ImportInfo_DataSource]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ImportInformation]') AND type in (N'U'))
DROP TABLE [dbo].[ImportInformation]
GO
/****** Object:  Table [dbo].[PatientMapSpecialtyIcon]    Script Date: 06/18/2015 12:04:37 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatMapSpecIcon_Specialty]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientMapSpecialtyIcon]'))
ALTER TABLE [dbo].[PatientMapSpecialtyIcon] DROP CONSTRAINT [FK_PatMapSpecIcon_Specialty]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientMapSpecialtyIcon]') AND type in (N'U'))
DROP TABLE [dbo].[PatientMapSpecialtyIcon]
GO
/****** Object:  Table [dbo].[SchemaMetaDataHistory]    Script Date: 06/18/2015 12:04:37 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SchMetaDataHist_SchMetaData]') AND parent_object_id = OBJECT_ID(N'[dbo].[SchemaMetaDataHistory]'))
ALTER TABLE [dbo].[SchemaMetaDataHistory] DROP CONSTRAINT [FK_SchMetaDataHist_SchMetaData]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SchemaMetaDataHistory]') AND type in (N'U'))
DROP TABLE [dbo].[SchemaMetaDataHistory]
GO
/****** Object:  Table [dbo].[Site]    Script Date: 06/18/2015 12:04:37 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Site_DefaultView]') AND parent_object_id = OBJECT_ID(N'[dbo].[Site]'))
ALTER TABLE [dbo].[Site] DROP CONSTRAINT [FK_Site_DefaultView]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Site_Facility]') AND parent_object_id = OBJECT_ID(N'[dbo].[Site]'))
ALTER TABLE [dbo].[Site] DROP CONSTRAINT [FK_Site_Facility]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Site]') AND type in (N'U'))
DROP TABLE [dbo].[Site]
GO
/****** Object:  Table [dbo].[ViewColumn]    Script Date: 06/18/2015 12:04:38 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ViewColumn_DisplayColumn]') AND parent_object_id = OBJECT_ID(N'[dbo].[ViewColumn]'))
ALTER TABLE [dbo].[ViewColumn] DROP CONSTRAINT [FK_ViewColumn_DisplayColumn]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ViewColumn_View]') AND parent_object_id = OBJECT_ID(N'[dbo].[ViewColumn]'))
ALTER TABLE [dbo].[ViewColumn] DROP CONSTRAINT [FK_ViewColumn_View]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ViewColumn]') AND type in (N'U'))
DROP TABLE [dbo].[ViewColumn]
GO
/****** Object:  Table [dbo].[PresentationView]    Script Date: 06/18/2015 12:04:37 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PresentationView]') AND type in (N'U'))
DROP TABLE [dbo].[PresentationView]
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 06/18/2015 12:04:37 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Patient]') AND type in (N'U'))
DROP TABLE [dbo].[Patient]
GO
/****** Object:  Table [dbo].[Message]    Script Date: 06/18/2015 12:04:36 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Message]') AND type in (N'U'))
DROP TABLE [dbo].[Message]
GO
/****** Object:  Table [dbo].[NumericId]    Script Date: 06/18/2015 12:04:36 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NumericId]') AND type in (N'U'))
DROP TABLE [dbo].[NumericId]
GO
/****** Object:  Table [dbo].[Nurse]    Script Date: 06/18/2015 12:04:36 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Nurse]') AND type in (N'U'))
DROP TABLE [dbo].[Nurse]
GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 06/18/2015 12:04:36 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Doctor]') AND type in (N'U'))
DROP TABLE [dbo].[Doctor]
GO
/****** Object:  Table [dbo].[Facility]    Script Date: 06/18/2015 12:04:36 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Facility]') AND type in (N'U'))
DROP TABLE [dbo].[Facility]
GO
/****** Object:  Table [dbo].[DataSource]    Script Date: 06/18/2015 12:04:35 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DataSource]') AND type in (N'U'))
DROP TABLE [dbo].[DataSource]
GO
/****** Object:  Table [dbo].[ActionButtonParameter]    Script Date: 06/18/2015 12:04:35 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ActButtonParam_ActionButton]') AND parent_object_id = OBJECT_ID(N'[dbo].[ActionButtonParameter]'))
ALTER TABLE [dbo].[ActionButtonParameter] DROP CONSTRAINT [FK_ActButtonParam_ActionButton]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ActButtonParam_RefColumn]') AND parent_object_id = OBJECT_ID(N'[dbo].[ActionButtonParameter]'))
ALTER TABLE [dbo].[ActionButtonParameter] DROP CONSTRAINT [FK_ActButtonParam_RefColumn]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ActionButtonParameter]') AND type in (N'U'))
DROP TABLE [dbo].[ActionButtonParameter]
GO
/****** Object:  Table [dbo].[CacheAudit]    Script Date: 06/18/2015 12:04:35 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CacheAudit]') AND type in (N'U'))
DROP TABLE [dbo].[CacheAudit]
GO
/****** Object:  Table [dbo].[Consultant]    Script Date: 06/18/2015 12:04:35 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Consultant]') AND type in (N'U'))
DROP TABLE [dbo].[Consultant]
GO
/****** Object:  Table [dbo].[Rhapsody to Whiteboard]    Script Date: 06/18/2015 12:04:37 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Rhapsody to Whiteboard]') AND type in (N'U'))
DROP TABLE [dbo].[Rhapsody to Whiteboard]
GO
/****** Object:  Table [dbo].[routerControl]    Script Date: 06/18/2015 12:04:37 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[routerControl]') AND type in (N'U'))
DROP TABLE [dbo].[routerControl]
GO
/****** Object:  Table [dbo].[SchemaMetaData]    Script Date: 06/18/2015 12:04:37 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SchemaMetaData]') AND type in (N'U'))
DROP TABLE [dbo].[SchemaMetaData]
GO
/****** Object:  Table [dbo].[Specialty]    Script Date: 06/18/2015 12:04:38 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Specialty]') AND type in (N'U'))
DROP TABLE [dbo].[Specialty]
GO
/****** Object:  Table [dbo].[TaskStatus]    Script Date: 06/18/2015 12:04:38 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TaskStatus]') AND type in (N'U'))
DROP TABLE [dbo].[TaskStatus]
GO
/****** Object:  Table [dbo].[TreatmentProtocol]    Script Date: 06/18/2015 12:04:38 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TreatmentProtocol]') AND type in (N'U'))
DROP TABLE [dbo].[TreatmentProtocol]
GO
/****** Object:  Table [dbo].[WebLinkParameter]    Script Date: 06/18/2015 12:04:38 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WebLinkParam_RefColumn]') AND parent_object_id = OBJECT_ID(N'[dbo].[WebLinkParameter]'))
ALTER TABLE [dbo].[WebLinkParameter] DROP CONSTRAINT [FK_WebLinkParam_RefColumn]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WebLinkParam_WebLink]') AND parent_object_id = OBJECT_ID(N'[dbo].[WebLinkParameter]'))
ALTER TABLE [dbo].[WebLinkParameter] DROP CONSTRAINT [FK_WebLinkParam_WebLink]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WebLinkParameter]') AND type in (N'U'))
DROP TABLE [dbo].[WebLinkParameter]
GO
/****** Object:  Table [dbo].[ReferenceColumn]    Script Date: 06/18/2015 12:04:37 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RefColumn_ActionButton]') AND parent_object_id = OBJECT_ID(N'[dbo].[ReferenceColumn]'))
ALTER TABLE [dbo].[ReferenceColumn] DROP CONSTRAINT [FK_RefColumn_ActionButton]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RefColumn_DisplayColumn]') AND parent_object_id = OBJECT_ID(N'[dbo].[ReferenceColumn]'))
ALTER TABLE [dbo].[ReferenceColumn] DROP CONSTRAINT [FK_RefColumn_DisplayColumn]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ReferenceColumn]') AND type in (N'U'))
DROP TABLE [dbo].[ReferenceColumn]
GO
/****** Object:  Table [dbo].[ActionButton]    Script Date: 06/18/2015 12:04:35 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ActionButton]') AND type in (N'U'))
DROP TABLE [dbo].[ActionButton]
GO
/****** Object:  Table [dbo].[WebLink]    Script Date: 06/18/2015 12:04:38 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WebLink_DisplayColumn]') AND parent_object_id = OBJECT_ID(N'[dbo].[WebLink]'))
ALTER TABLE [dbo].[WebLink] DROP CONSTRAINT [FK_WebLink_DisplayColumn]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WebLink]') AND type in (N'U'))
DROP TABLE [dbo].[WebLink]
GO
/****** Object:  Table [dbo].[DisplayColumn]    Script Date: 06/18/2015 12:04:36 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DisplayColumn_PrimRefColumn]') AND parent_object_id = OBJECT_ID(N'[dbo].[DisplayColumn]'))
ALTER TABLE [dbo].[DisplayColumn] DROP CONSTRAINT [FK_DisplayColumn_PrimRefColumn]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DisplayColumn]') AND type in (N'U'))
DROP TABLE [dbo].[DisplayColumn]
GO
/****** Object:  Table [dbo].[DisplayColumn]    Script Date: 06/18/2015 12:04:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DisplayColumn]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DisplayColumn](
	[displayColumnId] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[description] [nvarchar](1000) NULL,
	[dataType] [nvarchar](1) NOT NULL,
	[dataFormat] [nvarchar](30) NULL,
	[displayExpression] [ntext] NULL,
	[tooltipExpression] [ntext] NULL,
	[sortable] [nchar](1) NOT NULL,
	[enforceRefresh] [nchar](1) NOT NULL,
	[evaluateForVacantLocations] [nchar](1) NOT NULL,
	[defaultWidth] [int] NOT NULL,
	[sortByColumns] [nvarchar](255) NULL,
	[webLinkUnavailableMsg] [nvarchar](500) NULL,
	[primaryReferenceColumnId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[displayColumnId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[DisplayColumn] ON
INSERT [dbo].[DisplayColumn] ([displayColumnId], [name], [description], [dataType], [dataFormat], [displayExpression], [tooltipExpression], [sortable], [enforceRefresh], [evaluateForVacantLocations], [defaultWidth], [sortByColumns], [webLinkUnavailableMsg], [primaryReferenceColumnId]) VALUES (1, N'Lab Results', N'This is a sample Display Column that ships with cWhiteboard', N'P', NULL, N'<span style="color: <%=row.get("biochemistryColor")%>">
	<%=(html)row.get("biochemistryInitial")%>
</span>
<span style="color: <%=row.get("haematologyColor")%>">
	<%=(html)row.get("haematologyInitial")%>
</span>
<span style="color: <%=row.get("microbiologyColor")%>">
	<%=(html)row.get("microbiologyInitial")%>
</span>
<span style="color: <%=row.get("otherColor")%>">
	<%=(html)row.get("otherInitial")%>
</span>
&nbsp;', NULL, N'N', N'N', N'N', 100, NULL, NULL, NULL)
INSERT [dbo].[DisplayColumn] ([displayColumnId], [name], [description], [dataType], [dataFormat], [displayExpression], [tooltipExpression], [sortable], [enforceRefresh], [evaluateForVacantLocations], [defaultWidth], [sortByColumns], [webLinkUnavailableMsg], [primaryReferenceColumnId]) VALUES (2, N'Radiology', N'This is a sample Display Column that ships with cWhiteboard', N'P', NULL, N'<%if row.get("radiologyStatus").equals("1")%>
	<img src="../../images/icons/custom/RadOrder_black.gif" border=0 alt="Unprocessed"><%
elseif row.get("radiologyStatus").equals("2")%>
	<img src="../../images/icons/custom/RadOrder_red.gif" border=0 alt="Processed"><%
elseif row.get("radiologyStatus").equals("3")%>
	<img src="../../images/icons/custom/RadOrder_blue.gif" border=0 alt="Partially Completed"><%
elseif row.get("radiologyStatus").equals("4")%>
	<img src="../../images/icons/custom/RadOrder_green.gif" border=0 alt="All Completed"><%
else%>
	<img src="../../images/icons/custom/RadOrder_grey.gif" border=0 alt="Place New Order"><%
end if%>', NULL, N'N', N'N', N'N', 100, NULL, NULL, NULL)
INSERT [dbo].[DisplayColumn] ([displayColumnId], [name], [description], [dataType], [dataFormat], [displayExpression], [tooltipExpression], [sortable], [enforceRefresh], [evaluateForVacantLocations], [defaultWidth], [sortByColumns], [webLinkUnavailableMsg], [primaryReferenceColumnId]) VALUES (3, N'Patient Alert', N'This is a sample Display Column that ships with cWhiteboard', N'P', NULL, N'<%if row.get("patientAlert") <> "" %>
 <img src="../../images/icons/custom/alertRed.gif"> 
<%end if%>', N'<%if row.get("patientAlert") <> "" %>
	<img src="../../images/icons/custom/alertRed.gif"> 
<%end if%>', N'N', N'N', N'N', 0, NULL, N'', NULL)
INSERT [dbo].[DisplayColumn] ([displayColumnId], [name], [description], [dataType], [dataFormat], [displayExpression], [tooltipExpression], [sortable], [enforceRefresh], [evaluateForVacantLocations], [defaultWidth], [sortByColumns], [webLinkUnavailableMsg], [primaryReferenceColumnId]) VALUES (4, N'Patient Name', N'This is a sample Display Column that ships with cWhiteboard', N'P', NULL, N'<%if vacantLocationRow%>
 <span style="font-style:italic">VACANT</span>
<%else%>
 <span <%if row.get("nameSimilarityFlag") <> ""%>style="color:red"<%end if%>>
  <%=(html)row.get("patientSurname")%>
 </span>
 <span <%if row.get("nameSimilarityFlag") = "F"%>style="color:red"<%end if%>>
  , <%=(html)row.get("patientFirstGivenName")%>
 </span>
<%end if%>', N'<%if !vacantLocationRow%>
 <%=(html)row.get("externalPatientId")%><%
 if row.get("nameSimilarityFlag") <> ""%>
  </br></br><%
  if row.get("nameSimilarityFlag") = "S"%>
   Surname Similarity Warning</br><%
  elseif row.get("nameSimilarityFlag") = "F"%>
   Full name Similarity Warning</br><%
  end if%><%
 end if%><%
end if%>', N'Y', N'N', N'N', 0, N'patient.surname;patient.firstGivenName;siteLocation.code', N'', 28)
INSERT [dbo].[DisplayColumn] ([displayColumnId], [name], [description], [dataType], [dataFormat], [displayExpression], [tooltipExpression], [sortable], [enforceRefresh], [evaluateForVacantLocations], [defaultWidth], [sortByColumns], [webLinkUnavailableMsg], [primaryReferenceColumnId]) VALUES (5, N'Patient Gender', N'This is a sample Display Column that ships with cWhiteboard', N'P', NULL, N'<span <%if row.get("siteDepartedDttm") <> ""%>style="color:#666666;"<%end if%>><%
 if row.get("patientGender") = "Male"%>
  M<%
 elseif row.get("patientGender") = "Female"%>
  F<%
 elseif row.get("patientGender") = "Other"%>
  O<%
 elseif row.get("patientGender") = "Unknown"%>
  U<%
 elseif row.get("patientGender") = "Ambiguous"%>
  A<%
 else%>
  N<%
 end if%>
</span>', N'<%if row.get("patientGender") = "Not_Applicable"%>
 Not Applicable<%
else%>
 <%=(html)row.get("patientGender")%><%
end if%>', N'N', N'N', N'N', 0, NULL, N'', 31)
INSERT [dbo].[DisplayColumn] ([displayColumnId], [name], [description], [dataType], [dataFormat], [displayExpression], [tooltipExpression], [sortable], [enforceRefresh], [evaluateForVacantLocations], [defaultWidth], [sortByColumns], [webLinkUnavailableMsg], [primaryReferenceColumnId]) VALUES (6, N'Slash', N'This is a sample Display Column that ships with cWhiteboard', N'P', NULL, N'/', N'', N'N', N'N', N'N', 0, NULL, N'', NULL)
INSERT [dbo].[DisplayColumn] ([displayColumnId], [name], [description], [dataType], [dataFormat], [displayExpression], [tooltipExpression], [sortable], [enforceRefresh], [evaluateForVacantLocations], [defaultWidth], [sortByColumns], [webLinkUnavailableMsg], [primaryReferenceColumnId]) VALUES (7, N'Patient Age', N'This is a sample Display Column that ships with cWhiteboard', N'P', NULL, N'<span <%if row.get("siteDepartedDttm") <> ""%>style="color:#666666;"<%end if%>><%
 if row.get("patientDateOfBirth") <> null%>
  <%=(html)AgeFormatter.format(row.get("patientDateOfBirth"), AgeFormatter.SHORT)%><%
 else%>
  Unknown<%
 end if%>
</span>', N'<%if row.get("patientDateOfBirth") <> null%><%
 exec DateFormatter.applyPattern("dd-MMM-yyyy")%>
 <%=(html)DateFormatter.format(row.get("patientDateOfBirth"))%><%
end if%>', N'Y', N'N', N'N', 0, N'patient.dateOfBirth;siteLocation.code', N'Patient has been discharged from this Site', NULL)
INSERT [dbo].[DisplayColumn] ([displayColumnId], [name], [description], [dataType], [dataFormat], [displayExpression], [tooltipExpression], [sortable], [enforceRefresh], [evaluateForVacantLocations], [defaultWidth], [sortByColumns], [webLinkUnavailableMsg], [primaryReferenceColumnId]) VALUES (8, N'Arrived', N'This is a sample Display Column that ships with cWhiteboard', N'P', NULL, N'<%exec DateFormatter.applyPattern("HH:mm")%><%
var valueToDisplay = "N/A"%><%
if row.get("arrivedDttm") <> null%><%
	var valueToDisplay = DateFormatter.format(row.get("arrivedDttm"))%><%
elseif row.get("expectedArrivalDttm") <> null%><%
	var valueToDisplay = DateFormatter.format(row.get("expectedArrivalDttm"))%><%
end if%><%
var color = "blue"%><%
if row.get("siteDepartedDttm") <> ""%><%
	var color = "#666666"%><%
elseif row.get("reAdmissionWarningFlag") <> ""%><%
	var color = "red"%><%
end if%><%
var italics = false%><%
if row.get("expectedArrivalDttm") <> "" && row.get("arrivedDttm") = null%><%
	var italics = true%><%
end if%><%
var bold = false%><%
if row.get("triagedDttm") = null%><%
	var bold = true%><%
end if%>
<span style="color:<%=color%>;<%if italics%>font-style:italic;<%end if%><%if bold%>font-weight:bold;<%end if%>">
	<%=(html)valueToDisplay%>
</span>', N'<%exec DateFormatter.applyPattern("dd-MM-yy")%><%
if row.get("arrivedDttm") <> ""%>
	<%=(html)DateFormatter.format(row.get("arrivedDttm"))%><%
elseif row.get("expectedArrivalDttm") <> ""%>
	Expected: <%=(html)DateFormatter.format(row.get("expectedArrivalDttm"))%><%
else%>
	No expected arrival time provided<%
end if%><%
if row.get("reAdmissionWarningFlag") <> ""%>
	</br></br>Patient Re-admission Warning<%
end if%>', N'Y', N'Y', N'N', 0, N'siteCache.arrivedDttm;siteLocation.code', N'', NULL)
INSERT [dbo].[DisplayColumn] ([displayColumnId], [name], [description], [dataType], [dataFormat], [displayExpression], [tooltipExpression], [sortable], [enforceRefresh], [evaluateForVacantLocations], [defaultWidth], [sortByColumns], [webLinkUnavailableMsg], [primaryReferenceColumnId]) VALUES (9, N'Specialty', N'This is a sample Display Column that ships with cWhiteboard', N'P', NULL, N'<span <%if row.get("siteDepartedDttm") <> ""%>style="color:#666666;"<%end if%>><%
	var value = row.get("specialtyDescription")%><%
	if value.length() > 9%>
		<%=(html)value.substring(0,9)%><%
	else%>
		<%=(html)value%><%
	end if%>
</span>', NULL, N'Y', N'N', N'N', 0, N'specialty.Description;siteLocation.code', NULL, NULL)
INSERT [dbo].[DisplayColumn] ([displayColumnId], [name], [description], [dataType], [dataFormat], [displayExpression], [tooltipExpression], [sortable], [enforceRefresh], [evaluateForVacantLocations], [defaultWidth], [sortByColumns], [webLinkUnavailableMsg], [primaryReferenceColumnId]) VALUES (10, N'Triage Category', N'This is a sample Display Column that ships with cWhiteboard', N'P', NULL, N'<%var triageCategory = row.get("triageCategory")%><%
var arrivedDttm = row.get("arrivedDttm")%><%
if arrivedDttm <> null%><%
	var triagedDttm = row.get("triagedDttm")%><%
	var seenByDttm = row.get("doctorSeenByDttm")%><%
	var currentDttm = new java.util.GregorianCalendar()%><%
	var maxSeenByWaitDttm = new java.util.GregorianCalendar()%><%
	var maxTriageWaitDttm = new java.util.GregorianCalendar()%><%
	exec maxTriageWaitDttm.setTime(arrivedDttm)%><%
	exec maxTriageWaitDttm.add(12, 5)%><%
	exec DateFormatter.applyPattern("HH:mm")%><%
	var isPassWaitTime = currentDttm.after(maxTriageWaitDttm)%><%
	var red = false%><%
	if triagedDttm <> null && seenByDttm = null%><%
		exec maxSeenByWaitDttm.setTime(triagedDttm)%><%
		if triageCategory = 2%><%
			exec maxSeenByWaitDttm.add(12, 10)%><%
		elseif triageCategory = 3%><%
			exec maxSeenByWaitDttm.add(12, 30)%><%
		elseif triageCategory = 4%><%
			exec maxSeenByWaitDttm.add(12, 60)%><%
		elseif triageCategory = 5%><%
			exec maxSeenByWaitDttm.add(12, 120)%><%
		end if%><%
		var red = currentDttm.after(maxSeenByWaitDttm)%><%
	end if%><%
	if triagedDttm = null && isPassWaitTime = true%>
		<img src="../../images/icons/custom/alertYellow.gif" border=0><%
	else%>
		<span <%if red = true%>
				style="font-weight:bold;color:<%
				if row.get("siteDepartedDttm") <> ""%>
					#666666<%
				else%>
					red<%
				end if%>;"<%
			elseif row.get("siteDepartedDttm") <> ""%>
				style="color:#666666;"<%
			end if%>>
			<%=(html)triageCategory%>
		</span><%
	end if%><%
else%>
	<%=(html)triageCategory%><%
end if%>', N'<%var triageCategory = row.get("triageCategory")%><%
var arrivedDttm = row.get("arrivedDttm")%><%
if arrivedDttm <> null%><%
	var triagedDttm = row.get("triagedDttm")%><%
	var seenByDttm = row.get("doctorSeenByDttm")%><%
	var currentDttm = new java.util.GregorianCalendar()%><%
	var maxSeenByWaitDttm = new java.util.GregorianCalendar()%><%
	var maxTriageWaitDttm = new java.util.GregorianCalendar()%><%
	exec maxTriageWaitDttm.setTime(arrivedDttm)%><%
	exec maxTriageWaitDttm.add(12, 5)%><%
	exec DateFormatter.applyPattern("HH:mm")%><%
	var isPassWaitTime = currentDttm.after(maxTriageWaitDttm)%><%
	var red = false%><%
	if triagedDttm <> null && seenByDttm = null%><%
		exec maxSeenByWaitDttm.setTime(triagedDttm)%><%
		if triageCategory = 2%><%
			exec maxSeenByWaitDttm.add(12, 10)%><%
		elseif triageCategory = 3%><%
			exec maxSeenByWaitDttm.add(12, 30)%><%
		elseif triageCategory = 4%><%
			exec maxSeenByWaitDttm.add(12, 60)%><%
		elseif triageCategory = 5%><%
			exec maxSeenByWaitDttm.add(12, 120)%><%
		end if%><%
		var red = currentDttm.after(maxSeenByWaitDttm)%><%
	end if%><%
	if triagedDttm = null && isPassWaitTime%>
		Triage Required<%
	elseif red%>
		Doctor SeenBy Overdue<%
	end if%><%
end if%>', N'Y', N'Y', N'N', 0, N'siteCache.triageCategory;siteCache.doctorSeenByDttm;siteCache.arrivedDttm;siteCache.registrationDttm;siteLocation.code', N'Patient has been discharged from this Site', NULL)
INSERT [dbo].[DisplayColumn] ([displayColumnId], [name], [description], [dataType], [dataFormat], [displayExpression], [tooltipExpression], [sortable], [enforceRefresh], [evaluateForVacantLocations], [defaultWidth], [sortByColumns], [webLinkUnavailableMsg], [primaryReferenceColumnId]) VALUES (11, N'Doctor', N'This is a sample Display Column that ships with cWhiteboard', N'P', NULL, N'<span <%if row.get("siteDepartedDttm") <> ""%>style="color:#666666;"<%end if%>><%
	var firstName = row.get("doctorGivenName")%><%
	var surname = row.get("doctorSurname")%><%
	if firstName.length() > 1%><%
		var firstName = firstName.substring(0,1)%><%
	end if%><%
	if surname.length() > 8%><%
		var surname = surname.substring(0,8)%><%
	end if%><%
	var displayValue = firstName + surname%><%
	if displayValue.length() < 1%><%
		var displayValue = row.get("doctorConcertoId")%><%
	end if%><%
	if displayValue.length() > 0%>
		<%=(html)displayValue%><%
	else%>
		-<%
	end if%>
</span>', N'<%var title = StringUtil.nullToEmpty(row.get("consultantSurname")) + "," + StringUtil.nullToEmpty(row.get("consultantFirstName"))%><%
if title.length() = 1 %>
	<%var title = "Unknown Consultant"%><%
end if%>
<%=(html)title%>', N'N', N'N', N'N', 0, NULL, N'Patient has been discharged from this Site', NULL)
INSERT [dbo].[DisplayColumn] ([displayColumnId], [name], [description], [dataType], [dataFormat], [displayExpression], [tooltipExpression], [sortable], [enforceRefresh], [evaluateForVacantLocations], [defaultWidth], [sortByColumns], [webLinkUnavailableMsg], [primaryReferenceColumnId]) VALUES (12, N'Status', N'This is a sample Display Column that ships with cWhiteboard', N'P', NULL, N'<span <%if row.get("siteDepartedDttm") <> ""%>style="color:#666666;"<%end if%>><%
exec DateFormatter.applyPattern("HH:mm")%>
<%=(html)row.get("currentstatus")%>&nbsp;<%=(html)DateFormatter.format(row.get("currentStatusDttm"))%><%
	if row.get("dischargeType") = "Admit"%>&nbsp;(Admit)<%
	elseif row.get("dischargeType") = "Discharge_Home"%>&nbsp;(Home)<%
	elseif row.get("dischargeType") = "Self_Discharge_Not_Signed" || row.get("dischargeType") = "Self_Discharge_Signed"%>&nbsp;(Self)<%
	elseif row.get("dischargeType") = "Deceased"%>&nbsp;(Deceased)<%
	elseif row.get("dischargeType") = "Transfer"%>&nbsp;(Transfer)<%
	end if%>
</span>', N'<%if row.get("currentStatusDttm") <> ""%><%
	exec DateFormatter.applyPattern("dd-MM-yy")%>
	<%=(html)DateFormatter.format(row.get("currentStatusDttm"))%><%
end if%>', N'Y', N'Y', N'N', 0, N'siteCache.currentstatus;siteCache.currentStatusDttm;siteLocation.code', N'', NULL)
INSERT [dbo].[DisplayColumn] ([displayColumnId], [name], [description], [dataType], [dataFormat], [displayExpression], [tooltipExpression], [sortable], [enforceRefresh], [evaluateForVacantLocations], [defaultWidth], [sortByColumns], [webLinkUnavailableMsg], [primaryReferenceColumnId]) VALUES (13, N'Presenting Complaint', N'', N'P', NULL, N'<span <%if row.get("siteDepartedDttm") <> ""%>style="color:#776666;"<%end if%>>
	<%if row.get("presentingComplaint") <> ""%>
	 <%=(html)row.get("presentingComplaint")%>
	<%else%>
	 --
	<%end if%>
	</span>', N'<span <%if row.get("siteDepartedDttm") <> ""%>style="color:#666666;"<%end if%>>
	<%if row.get("latestNotesUpdateUserId") <> ""%>
	Last update By: <%=(html)row.get("latestNotesUpdateUserId")%><br>
	<%exec DateFormatter.applyPattern("dd-MMM-yyyy HH:mm")%>
	<%var upt =  "Last update:" + DateFormatter.format(row.get("latestNotesUpdateDttm"))%>
	<%=(html)upt%>
	<%else%>No notes have been added
	<%end if%>
	</span>', N'N', N'N', N'N', 0, NULL, N'Patient has been discharged from this Site', 104)
INSERT [dbo].[DisplayColumn] ([displayColumnId], [name], [description], [dataType], [dataFormat], [displayExpression], [tooltipExpression], [sortable], [enforceRefresh], [evaluateForVacantLocations], [defaultWidth], [sortByColumns], [webLinkUnavailableMsg], [primaryReferenceColumnId]) VALUES (14, N'Location', N'This is a sample Display Column that ships with cWhiteboard', N'P', NULL, N'<%if vacantLocationRow%>
	<span style="font-style:italic"><%=row.get("siteLocationCode")%></span><%
else%>
	<span <%if row.get("siteDepartedDttm") <> ""%>style="color:#666666;"<%end if%>>
	<%if row.get("latestLocationCode") <> "Unallocated"%>
			<%=(html)row.get("latestLocationName")%>
	<%else%>
		No Location Assigned
	<%end if%>
	</span><%
end if%>', N'<%if !vacantLocationRow%><%
	if row.get("latestSiteDepartedDttm") <> ""%>
		<b>Last location:</b><br><%
	end if%>
	Facility: <%=(html)row.get("latestFacilityCode")%><br>
	Site: <%=(html)row.get("latestSiteCode")%><br>
	Location:<%
	if row.get("latestSiteDepartedDttm") <> ""%>
		<%if row.get("latestCachePrevLocationCode") <> "Unallocated"%><%=(html)row.get("latestCachePrevLocationCode")%><%else%>No Location Assigned<%end if%><%
	else%>
		<%if row.get("latestLocationName") <> "Unallocated"%><%=(html)row.get("latestLocationName")%><%else%>No Location Assigned<%end if%><%
	end if%><%
end if%>', N'Y', N'N', N'Y', 0, N'siteLocation.code', N'Patient has been discharged from this Site', NULL)
INSERT [dbo].[DisplayColumn] ([displayColumnId], [name], [description], [dataType], [dataFormat], [displayExpression], [tooltipExpression], [sortable], [enforceRefresh], [evaluateForVacantLocations], [defaultWidth], [sortByColumns], [webLinkUnavailableMsg], [primaryReferenceColumnId]) VALUES (15, N'Seen By Nurse', N'This is a sample Display Column that ships with cWhiteboard', N'P', NULL, N'<span <%if row.get("siteDepartedDttm") <> ""%>style="color:#666666;"<%end if%>><%
	if row.get("seenByNurseId") <> ""%><%
		exec DateFormatter.applyPattern("HH:mm")%>
		<%=(html)DateFormatter.format(row.get("nurseSeenByDttm"))%><%
	elseif row.get("treatmentProtocolId") <> ""%>
		&lt;TBS&gt;<%
	else%>
		-<%
	end if%>
</span>', N'<%if row.get("seenByNurseId") <> ""%><%
	exec DateFormatter.applyPattern("HH:mm")%>
	Seen At: <%=(html)DateFormatter.format(row.get("nurseSeenByDttm"))%><br>
	Seen By: <%=(html)row.get("seenByNurseGivenName")%> <%=(html)row.get("seenByNurseSurname")%><%
end if%>', N'N', N'N', N'N', 0, NULL, N'Nurse Seen By has been performed', NULL)
INSERT [dbo].[DisplayColumn] ([displayColumnId], [name], [description], [dataType], [dataFormat], [displayExpression], [tooltipExpression], [sortable], [enforceRefresh], [evaluateForVacantLocations], [defaultWidth], [sortByColumns], [webLinkUnavailableMsg], [primaryReferenceColumnId]) VALUES (16, N'Treatment Protocol', N'This is a sample Display Column that ships with cWhiteboard', N'P', NULL, N'<%if row.get("treatmentProtocolDocumentUrl") <> null%>
	<a href="<%=(html)row.get("treatmentProtocolDocumentUrl")%>" onclick="window.open(this.href, ''treatmentProtocolHelp'', ''top=50, left=50, width=890, height=600, resizable=yes, toolbar=yes, location=yes, directories=yes, status=yes, menubar=yes, scrollbars=yes''); return false;">
		<img src="<%if StringUtil.isValued(row.get("treatmentProtocolImageUrl"))%>
				<%=(html)row.get("treatmentProtocolImageUrl")%><%
			else%>
				../../images/icons/custom/help_bubble.gif<%
			end if%>"/>
	</a><%
else%>
	<%=(html)row.get("treatmentProtocolName")%><%
end if%>', N'<%if row.get("treatmentProtocolName") <> null%>
	<%=(html)row.get("treatmentProtocolName")%><%
end if%>', N'N', N'N', N'N', 30, NULL, NULL, NULL)
INSERT [dbo].[DisplayColumn] ([displayColumnId], [name], [description], [dataType], [dataFormat], [displayExpression], [tooltipExpression], [sortable], [enforceRefresh], [evaluateForVacantLocations], [defaultWidth], [sortByColumns], [webLinkUnavailableMsg], [primaryReferenceColumnId]) VALUES (17, N'Assigned Nurse', N'This is a sample Display Column that ships with cWhiteboard', N'P', NULL, N'<span <%if row.get("siteDepartedDttm") <> ""%>style="color:#666666;"<%end if%>><%
 var givenName = row.get("assignedNurseGivenName")%><%
 var surname = row.get("assignedNurseSurname")%><%
 if row.get("assignedNurseId") <> ""%><%
  if givenName <> "" || surname <> ""%>
   <%=(html)givenName%> <%=(html)surname%><%
  else%>
   <%=(html)row.get("assignedNurseConcertoId")%><%
  end if%><%
 else%>
  --<%
 end if%>
</span>
', N'<span <%if row.get("siteDepartedDttm") <> ""%>style="color:#666666;"<%end if%>>
<%if row.get("latestNurseHandoverUpdateUserId") <> ""%>
Last updated By: <%=(html)row.get("latestNurseHandoverUpdateUserId")%><br>
<%exec DateFormatter.applyPattern("dd-MMM-yyyy HH:mm")%>
<%var upt =  "Last updated:" + DateFormatter.format(row.get("latestNurseHandoverUpdateDttm"))%>
<%=(html)upt%>
<%else%>No nurse has been assigned
<%end if%>
</span>
', N'N', N'Y', N'N', 0, NULL, N'Patient has been discharged from this Site', NULL)
INSERT [dbo].[DisplayColumn] ([displayColumnId], [name], [description], [dataType], [dataFormat], [displayExpression], [tooltipExpression], [sortable], [enforceRefresh], [evaluateForVacantLocations], [defaultWidth], [sortByColumns], [webLinkUnavailableMsg], [primaryReferenceColumnId]) VALUES (18, N'URN', N'This column displays Patient MRN', N'S', NULL, N'', N'', N'N', N'N', N'N', 100, NULL, N'', 107)
INSERT [dbo].[DisplayColumn] ([displayColumnId], [name], [description], [dataType], [dataFormat], [displayExpression], [tooltipExpression], [sortable], [enforceRefresh], [evaluateForVacantLocations], [defaultWidth], [sortByColumns], [webLinkUnavailableMsg], [primaryReferenceColumnId]) VALUES (19, N'Waiting Time', N'Column display a timer of how long the patient has been waiting based on arrival time. If it goes over 59 Minutes, highlight in red.', N'P', NULL, N'<%if row.get("doctorSeenByDttm")= ""%>
  <%var currentDttm = new java.util.GregorianCalendar()%>
  <%var changeDttm = new java.util.GregorianCalendar()%> 
  <%exec changeDttm.setTime(row.get("arrivedDttm"))%> 
  <%var currentTime = currentDttm.getTimeInMillis()%>
  <%var changeTime = changeDttm.getTimeInMillis()%> 
  <%var timediffminus =  new java.math.BigDecimal(currentTime - changeTime)%> 

  <% var oneThousand =  new java.math.BigDecimal(1000)%> 
  <% var sixty =  new java.math.BigDecimal(60)%>  
  <% var seconds = timediffminus.divide(oneThousand,2)%> 
  <% var minutes = seconds.divide(sixty,1).remainder(sixty)%> 
  <%var hours = seconds.divide(sixty,1).divide(sixty,1)%> 

  <%if hours > 24%>
    <%var OutputTime = "> 24 Hours"%>
  <%else%>
    <%var OutputTime = hours + "h : " + minutes + "min"%>
  <%end if%>
  <span style="<%if hours > 1%>color:red;font-weight:bold;<%else%>color:black;font-weight:normal;<%end if%>">
  <%=(html)OutputTime%>
  </span>
<%else%>
   <span style=color:black;font-weight:normal;>
   <%=(html)"Patient Seen"%>
<%end if%>', N'<%if row.get("doctorSeenByDttm") = ""%>
<%exec DateFormatter.applyPattern("dd-MMM-yyyy HH:mm")%>
<%var upt =  "Patient came at:" + DateFormatter.format(row.get("arrivedDttm"))%>
<%else%>
<%exec DateFormatter.applyPattern("dd-MMM-yyyy HH:mm")%>
<%var upt =  "Patient seen at:" + DateFormatter.format(row.get("doctorSeenByDttm"))%>
<%end if%>

<%=(html)upt%>', N'Y', N'Y', N'N', 0, N'siteCache.doctorSeenByDttm', N'', NULL)
SET IDENTITY_INSERT [dbo].[DisplayColumn] OFF
/****** Object:  Table [dbo].[WebLink]    Script Date: 06/18/2015 12:04:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WebLink]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WebLink](
	[webLinkId] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[description] [nvarchar](1000) NULL,
	[newWindow] [nchar](1) NOT NULL,
	[topPosition] [int] NULL,
	[leftPosition] [int] NULL,
	[width] [int] NULL,
	[height] [int] NULL,
	[activationCondition] [nvarchar](1000) NULL,
	[displayColumnId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[webLinkId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[WebLink] ON
INSERT [dbo].[WebLink] ([webLinkId], [name], [description], [newWindow], [topPosition], [leftPosition], [width], [height], [activationCondition], [displayColumnId]) VALUES (1, N'Lab Results', N'Open CDV lab results', N'N', NULL, NULL, NULL, NULL, N'$biochemistryInitial != "" || $haematologyInitial != "" || $microbiologyInitial != "" || $otherInitial != ""', 1)
INSERT [dbo].[WebLink] ([webLinkId], [name], [description], [newWindow], [topPosition], [leftPosition], [width], [height], [activationCondition], [displayColumnId]) VALUES (2, N'Rad Results', N'Open CDV Radiology results', N'N', NULL, NULL, NULL, NULL, N'$radiologyStatus != ""', 2)
INSERT [dbo].[WebLink] ([webLinkId], [name], [description], [newWindow], [topPosition], [leftPosition], [width], [height], [activationCondition], [displayColumnId]) VALUES (3, N'Patient Summary', N'', N'N', NULL, NULL, NULL, NULL, N'always', 4)
INSERT [dbo].[WebLink] ([webLinkId], [name], [description], [newWindow], [topPosition], [leftPosition], [width], [height], [activationCondition], [displayColumnId]) VALUES (4, N'Triage Category Editor', NULL, N'Y', 200, 300, 450, 320, N'$siteDepartedDttm == ""', 10)
INSERT [dbo].[WebLink] ([webLinkId], [name], [description], [newWindow], [topPosition], [leftPosition], [width], [height], [activationCondition], [displayColumnId]) VALUES (5, N'Doctor Handover Editor', NULL, N'Y', 300, 100, 600, 500, N'$siteDepartedDttm == ""', 11)
INSERT [dbo].[WebLink] ([webLinkId], [name], [description], [newWindow], [topPosition], [leftPosition], [width], [height], [activationCondition], [displayColumnId]) VALUES (9, N'Doctor SeenBy Editor', N'', N'Y', 300, 100, 600, 500, N'$currentstatus startsWith "<TBS>" && $siteDepartedDttm == ""', 12)
INSERT [dbo].[WebLink] ([webLinkId], [name], [description], [newWindow], [topPosition], [leftPosition], [width], [height], [activationCondition], [displayColumnId]) VALUES (10, N'Note Editor', N'', N'Y', 200, 200, 515, 270, N'$siteDepartedDttm == ""', 13)
INSERT [dbo].[WebLink] ([webLinkId], [name], [description], [newWindow], [topPosition], [leftPosition], [width], [height], [activationCondition], [displayColumnId]) VALUES (11, N'Location Editor', NULL, N'Y', 300, 250, 650, 170, N'$siteDepartedDttm == ""', 14)
INSERT [dbo].[WebLink] ([webLinkId], [name], [description], [newWindow], [topPosition], [leftPosition], [width], [height], [activationCondition], [displayColumnId]) VALUES (12, N'Nurse SeenBy Editor', NULL, N'Y', 300, 200, 620, 280, N'$siteDepartedDttm == "" && $canPerformNurseSeenBy == "true" && ($enableRemoveNurseSeenBy == ''Y'' || $nurseSeenByDttm == "")', 15)
INSERT [dbo].[WebLink] ([webLinkId], [name], [description], [newWindow], [topPosition], [leftPosition], [width], [height], [activationCondition], [displayColumnId]) VALUES (13, N'Nurse Handover Editor', NULL, N'Y', 300, 100, 600, 500, N'$siteDepartedDttm == ""', 17)
SET IDENTITY_INSERT [dbo].[WebLink] OFF
/****** Object:  Table [dbo].[ActionButton]    Script Date: 06/18/2015 12:04:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ActionButton]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ActionButton](
	[actionButtonId] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[description] [nvarchar](1000) NULL,
	[newWindow] [nchar](1) NOT NULL,
	[dialogTopLeftXPos] [int] NULL,
	[dialogTopLeftYPos] [int] NULL,
	[dialogWidth] [int] NULL,
	[dialogHeight] [int] NULL,
	[activationCondition] [nvarchar](1000) NOT NULL,
	[actionButtonUnavailableMsg] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[actionButtonId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[ActionButton] ON
INSERT [dbo].[ActionButton] ([actionButtonId], [name], [description], [newWindow], [dialogTopLeftXPos], [dialogTopLeftYPos], [dialogWidth], [dialogHeight], [activationCondition], [actionButtonUnavailableMsg]) VALUES (1, N'Doctor Handover', N'This is a sample Action Button that ships with cWhiteboard', N'Y', 300, 100, 600, 500, N'$siteDepartedDttm == ""', N'One of the patients selected has already been physically discharged from this Site')
INSERT [dbo].[ActionButton] ([actionButtonId], [name], [description], [newWindow], [dialogTopLeftXPos], [dialogTopLeftYPos], [dialogWidth], [dialogHeight], [activationCondition], [actionButtonUnavailableMsg]) VALUES (2, N'Nurse Handover', N'This is a sample Action Button that ships with cWhiteboard', N'Y', 300, 100, 600, 500, N'$siteDepartedDttm == ""', N'One of the patients selected has already been physically discharged from this Site')
SET IDENTITY_INSERT [dbo].[ActionButton] OFF
/****** Object:  Table [dbo].[ReferenceColumn]    Script Date: 06/18/2015 12:04:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ReferenceColumn]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ReferenceColumn](
	[referenceColumnId] [int] IDENTITY(1,1) NOT NULL,
	[columnName] [nvarchar](50) NOT NULL,
	[alias] [nvarchar](100) NULL,
	[actionButtonId] [int] NULL,
	[displayColumnId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[referenceColumnId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[ReferenceColumn] ON
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (1, N'siteCache.cacheNumber', N'cacheNumber', 1, NULL)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (2, N'siteCache.siteDepartedDttm', N'siteDepartedDttm', 1, NULL)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (3, N'siteCache.cacheNumber', N'cacheNumber', 2, NULL)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (4, N'siteCache.siteDepartedDttm', N'siteDepartedDttm', 2, NULL)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (5, N'biochemistryColor', NULL, NULL, 1)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (6, N'biochemistryInitial', NULL, NULL, 1)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (7, N'haematologyColor', NULL, NULL, 1)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (8, N'haematologyInitial', NULL, NULL, 1)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (9, N'microbiologyColor', NULL, NULL, 1)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (10, N'microbiologyInitial', NULL, NULL, 1)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (11, N'otherColor', NULL, NULL, 1)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (12, N'otherInitial', NULL, NULL, 1)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (13, N'externalPatientId.externalPatientId', N'externalPatientId', NULL, 1)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (14, N'patient.dateOfBirth', N'patientDateOfBirth', NULL, 1)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (15, N'patient.firstGivenName', N'patientFirstGivenName', NULL, 1)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (16, N'patient.surname', N'patientSurname', NULL, 1)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (17, N'patient.gender', N'patientGender', NULL, 1)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (18, N'radiologyStatus', NULL, NULL, 2)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (19, N'patient.dateOfBirth', N'patientDateOfBirth', NULL, 2)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (20, N'patient.firstGivenName', N'patientFirstGivenName', NULL, 2)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (21, N'patient.gender', N'patientGender', NULL, 2)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (22, N'patient.surname', N'patientSurname', NULL, 2)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (23, N'externalPatientId.externalPatientId', N'externalPatientId', NULL, 2)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (24, N'siteCache.patientAlert', N'patientAlert', NULL, 3)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (25, N'siteCache.nameSimilarityFlag', N'nameSimilarityFlag', NULL, 4)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (26, N'patient.surname', N'patientSurname', NULL, 4)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (27, N'patient.firstGivenName', N'patientFirstGivenName', NULL, 4)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (28, N'externalPatientId.externalPatientId', N'externalPatientId', NULL, 4)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (29, N'patient.dateOfBirth', N'patientDateOfBirth', NULL, 4)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (30, N'patient.gender', N'patientGender', NULL, 4)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (31, N'patient.gender', N'patientGender', NULL, 5)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (32, N'siteCache.siteDepartedDttm', N'siteDepartedDttm', NULL, 5)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (33, N'patient.dateOfBirth', N'patientDateOfBirth', NULL, 7)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (34, N'siteCache.siteDepartedDttm', N'siteDepartedDttm', NULL, 7)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (35, N'siteCache.arrivedDttm', N'arrivedDttm', NULL, 8)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (36, N'siteCache.expectedArrivalDttm', N'expectedArrivalDttm', NULL, 8)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (37, N'siteCache.triagedDttm', N'triagedDttm', NULL, 8)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (38, N'siteCache.siteDepartedDttm', N'siteDepartedDttm', NULL, 8)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (39, N'siteCache.reAdmissionWarningFlag', N'reAdmissionWarningFlag', NULL, 8)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (40, N'specialty.Description', N'specialtyDescription', NULL, 9)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (41, N'siteCache.siteDepartedDttm', N'siteDepartedDttm', NULL, 9)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (42, N'siteCache.arrivedDttm', N'arrivedDttm', NULL, 10)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (43, N'siteCache.cacheNumber', N'cacheNumber', NULL, 10)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (44, N'siteCache.doctorSeenByDttm', N'doctorSeenByDttm', NULL, 10)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (45, N'siteCache.triageCategory', N'triageCategory', NULL, 10)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (46, N'siteCache.siteDepartedDttm', N'siteDepartedDttm', NULL, 10)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (47, N'siteCache.triagedDttm', N'triagedDttm', NULL, 10)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (48, N'assignedDoctor.givenName', N'doctorGivenName', NULL, 11)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (49, N'assignedDoctor.surname', N'doctorSurname', NULL, 11)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (50, N'assignedDoctor.concertoId', N'doctorConcertoId', NULL, 11)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (51, N'consultant.firstGivenName', N'consultantFirstName', NULL, 11)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (52, N'consultant.surname', N'consultantSurname', NULL, 11)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (53, N'siteCache.cacheNumber', N'cacheNumber', NULL, 11)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (54, N'siteCache.siteDepartedDttm', N'siteDepartedDttm', NULL, 11)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (55, N'siteCache.arrivedDttm', N'arrivedDttm', NULL, 12)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (56, N'siteCache.cacheNumber', N'cacheNumber', NULL, 12)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (57, N'siteCache.currentstatus', N'currentstatus', NULL, 12)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (58, N'siteCache.currentStatusDttm', N'currentStatusDttm', NULL, 12)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (59, N'siteCache.siteDepartedDttm', N'siteDepartedDttm', NULL, 12)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (60, N'patient.dateOfBirth', N'patientDateOfBirth', NULL, 12)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (61, N'patient.gender', N'patientGender', NULL, 12)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (62, N'latestCache.arrivedDttm', N'lastestArrivedDttm', NULL, 12)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (63, N'siteCache.dischargeType', N'dischargeType', NULL, 12)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (64, N'siteCache.presentingComplaint', N'presentingComplaint', NULL, 13)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (65, N'siteCache.cacheNumber', N'cacheNumber', NULL, 13)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (66, N'siteCache.siteDepartedDttm', N'siteDepartedDttm', NULL, 13)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (67, N'latestLocation.code', N'latestLocationCode', NULL, 14)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (68, N'siteCache.cacheNumber', N'cacheNumber', NULL, 14)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (69, N'siteCache.siteDepartedDttm', N'siteDepartedDttm', NULL, 14)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (70, N'latestFacility.facilityId', N'latestFacilityId', NULL, 14)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (71, N'latestFacility.code', N'latestFacilityCode', NULL, 14)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (72, N'latestSite.siteId', N'latestSiteId', NULL, 14)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (73, N'latestSite.code', N'latestSiteCode', NULL, 14)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (74, N'latestCache.siteDepartedDttm', N'latestSiteDepartedDttm', NULL, 14)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (75, N'siteLocation.code', N'siteLocationCode', NULL, 14)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (76, N'latestCachePrevLocation.code', N'latestCachePrevLocationCode', NULL, 14)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (77, N'siteCache.cacheNumber', N'cacheNumber', NULL, 15)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (78, N'siteCache.nurseSeenByDttm', N'nurseSeenByDttm', NULL, 15)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (79, N'seenByNurse.givenName', N'seenByNurseGivenName', NULL, 15)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (80, N'seenByNurse.surname', N'seenByNurseSurname', NULL, 15)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (81, N'siteCache.seenByNurseId', N'seenByNurseId', NULL, 15)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (82, N'siteCache.enableRemoveNurseSeenBy', N'enableRemoveNurseSeenBy', NULL, 15)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (83, N'siteCache.siteDepartedDttm', N'siteDepartedDttm', NULL, 15)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (84, N'treatmentProtocol.treatmentProtocolId', N'treatmentProtocolId', NULL, 15)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (85, N'treatmentProtocol.documenturl', N'treatmentProtocolDocumentUrl', NULL, 16)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (86, N'treatmentProtocol.imageurl', N'treatmentProtocolImageUrl', NULL, 16)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (87, N'treatmentProtocol.name', N'treatmentProtocolName', NULL, 16)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (88, N'siteCache.cacheNumber', N'cacheNumber', NULL, 17)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (89, N'assignedNurse.givenName', N'assignedNurseGivenName', NULL, 17)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (90, N'assignedNurse.surname', N'assignedNurseSurname', NULL, 17)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (91, N'assignedNurse.concertoId', N'assignedNurseConcertoId', NULL, 17)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (92, N'siteCache.assignedNurseId', N'assignedNurseId', NULL, 17)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (93, N'siteCache.siteDepartedDttm', N'siteDepartedDttm', NULL, 17)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (94, N'siteCache.arrivedDttm', N'arrivedDttm', NULL, 19)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (95, N'siteCache.cacheNumber', N'cacheNumber', NULL, 19)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (96, N'siteCache.doctorSeenByDttm', N'doctorSeenByDttm', NULL, 19)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (97, N'siteCache.enableRemoveNurseSeenBy', N'enableRemoveNurseSeenBy', NULL, 12)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (98, N'siteCache.nurseSeenByDttm', N'nurseSeenByDttm', NULL, 12)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (100, N'handoverAudit.userId', N'latestNurseHandoverUpdateUserId', NULL, 17)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (101, N'externalPatientId.externalPatientId', N'externalPatientId', NULL, 3)
GO
print 'Processed 100 total records'
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (102, N'siteCache.cachenumber', N'cacheNumber', NULL, 3)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (103, N'notesAudit.actionDttm', N'latestNotesUpdateDttm', NULL, 13)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (104, N'latestCache.cachelastupdatedttm', N'latestcachelastupdatedttm', NULL, 13)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (105, N'notesAudit.userId', N'latestNotesUpdateUserId', NULL, 13)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (106, N'handoverAudit.actionDttm', N'latestNurseHandoverUpdateDttm', NULL, 17)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (107, N'externalPatientId.externalPatientId', N'externalPatientId', NULL, 18)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (108, N'patient.dateOfBirth', N'patientDateOfBirth', NULL, 3)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (109, N'patient.firstGivenName', N'patientFirstGivenName', NULL, 3)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (110, N'patient.gender', N'patientGender', NULL, 3)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (111, N'patient.surname', N'patientSurname', NULL, 3)
INSERT [dbo].[ReferenceColumn] ([referenceColumnId], [columnName], [alias], [actionButtonId], [displayColumnId]) VALUES (112, N'latestLocation.name', N'latestLocationName', NULL, 14)
SET IDENTITY_INSERT [dbo].[ReferenceColumn] OFF
/****** Object:  Table [dbo].[WebLinkParameter]    Script Date: 06/18/2015 12:04:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WebLinkParameter]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WebLinkParameter](
	[parameterId] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[value] [nvarchar](1000) NULL,
	[referenceColumnId] [int] NULL,
	[webLinkId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[parameterId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[WebLinkParameter] ON
INSERT [dbo].[WebLinkParameter] ([parameterId], [name], [value], [referenceColumnId], [webLinkId]) VALUES (1, N'applicationName', N'Medical Applications Portal', NULL, 1)
INSERT [dbo].[WebLinkParameter] ([parameterId], [name], [value], [referenceColumnId], [webLinkId]) VALUES (2, N'contextName', N'Patient', NULL, 1)
INSERT [dbo].[WebLinkParameter] ([parameterId], [name], [value], [referenceColumnId], [webLinkId]) VALUES (3, N'entryPointName', N'Dynamic Patient Summary', NULL, 1)
INSERT [dbo].[WebLinkParameter] ([parameterId], [name], [value], [referenceColumnId], [webLinkId]) VALUES (4, N'openFolderName', N'Laboratory', NULL, 1)
INSERT [dbo].[WebLinkParameter] ([parameterId], [name], [value], [referenceColumnId], [webLinkId]) VALUES (5, N'openRepositoryName', N'Numeric Laboratory Reports', NULL, 1)
INSERT [dbo].[WebLinkParameter] ([parameterId], [name], [value], [referenceColumnId], [webLinkId]) VALUES (6, N'patientDOB', N'<%exec DateFormatter.applyPattern("yyyyMMdd")%><%=DateFormatter.format(row.get("patientDateOfBirth"))%>', NULL, 1)
INSERT [dbo].[WebLinkParameter] ([parameterId], [name], [value], [referenceColumnId], [webLinkId]) VALUES (7, N'patientFirstGivenName', NULL, 15, 1)
INSERT [dbo].[WebLinkParameter] ([parameterId], [name], [value], [referenceColumnId], [webLinkId]) VALUES (8, N'patientGender', NULL, 17, 1)
INSERT [dbo].[WebLinkParameter] ([parameterId], [name], [value], [referenceColumnId], [webLinkId]) VALUES (9, N'patientId', NULL, 13, 1)
INSERT [dbo].[WebLinkParameter] ([parameterId], [name], [value], [referenceColumnId], [webLinkId]) VALUES (10, N'patientSurname', NULL, 16, 1)
INSERT [dbo].[WebLinkParameter] ([parameterId], [name], [value], [referenceColumnId], [webLinkId]) VALUES (11, N'applicationName', N'Medical Applications Portal', NULL, 2)
INSERT [dbo].[WebLinkParameter] ([parameterId], [name], [value], [referenceColumnId], [webLinkId]) VALUES (12, N'contextName', N'Patient', NULL, 2)
INSERT [dbo].[WebLinkParameter] ([parameterId], [name], [value], [referenceColumnId], [webLinkId]) VALUES (13, N'entryPointName', N'Dynamic Patient Summary', NULL, 2)
INSERT [dbo].[WebLinkParameter] ([parameterId], [name], [value], [referenceColumnId], [webLinkId]) VALUES (14, N'openFolderName', N'Radiology', NULL, 2)
INSERT [dbo].[WebLinkParameter] ([parameterId], [name], [value], [referenceColumnId], [webLinkId]) VALUES (15, N'openRepositoryName', N'Radiology Reports', NULL, 2)
INSERT [dbo].[WebLinkParameter] ([parameterId], [name], [value], [referenceColumnId], [webLinkId]) VALUES (16, N'patientDOB', N'<%exec DateFormatter.applyPattern("yyyyMMdd")%><%=DateFormatter.format(row.get("patientDateOfBirth"))%>', NULL, 2)
INSERT [dbo].[WebLinkParameter] ([parameterId], [name], [value], [referenceColumnId], [webLinkId]) VALUES (17, N'patientFirstGivenName', NULL, 20, 2)
INSERT [dbo].[WebLinkParameter] ([parameterId], [name], [value], [referenceColumnId], [webLinkId]) VALUES (18, N'patientGender', NULL, 21, 2)
INSERT [dbo].[WebLinkParameter] ([parameterId], [name], [value], [referenceColumnId], [webLinkId]) VALUES (19, N'patientId', NULL, 23, 2)
INSERT [dbo].[WebLinkParameter] ([parameterId], [name], [value], [referenceColumnId], [webLinkId]) VALUES (20, N'patientSurname', NULL, 22, 2)
INSERT [dbo].[WebLinkParameter] ([parameterId], [name], [value], [referenceColumnId], [webLinkId]) VALUES (21, N'applicationName', N'Medical Applications Portal', NULL, 3)
INSERT [dbo].[WebLinkParameter] ([parameterId], [name], [value], [referenceColumnId], [webLinkId]) VALUES (22, N'contextName', N'Patient', NULL, 3)
INSERT [dbo].[WebLinkParameter] ([parameterId], [name], [value], [referenceColumnId], [webLinkId]) VALUES (23, N'entryPointName', N'Dynamic Patient Summary', NULL, 3)
INSERT [dbo].[WebLinkParameter] ([parameterId], [name], [value], [referenceColumnId], [webLinkId]) VALUES (27, N'patientId', NULL, 28, 3)
INSERT [dbo].[WebLinkParameter] ([parameterId], [name], [value], [referenceColumnId], [webLinkId]) VALUES (28, N'patientSurname', NULL, 26, 3)
INSERT [dbo].[WebLinkParameter] ([parameterId], [name], [value], [referenceColumnId], [webLinkId]) VALUES (29, N'applicationName', N'cWhiteboard', NULL, 4)
INSERT [dbo].[WebLinkParameter] ([parameterId], [name], [value], [referenceColumnId], [webLinkId]) VALUES (30, N'entryPointName', N'Triage Category Editor', NULL, 4)
INSERT [dbo].[WebLinkParameter] ([parameterId], [name], [value], [referenceColumnId], [webLinkId]) VALUES (31, N'cacheNumber', NULL, 43, 4)
INSERT [dbo].[WebLinkParameter] ([parameterId], [name], [value], [referenceColumnId], [webLinkId]) VALUES (32, N'columnName', N'TriageCategory', NULL, 4)
INSERT [dbo].[WebLinkParameter] ([parameterId], [name], [value], [referenceColumnId], [webLinkId]) VALUES (33, N'columnValue', NULL, 45, 4)
INSERT [dbo].[WebLinkParameter] ([parameterId], [name], [value], [referenceColumnId], [webLinkId]) VALUES (34, N'triageCategoryDisplayFormat', N'radio', NULL, 4)
INSERT [dbo].[WebLinkParameter] ([parameterId], [name], [value], [referenceColumnId], [webLinkId]) VALUES (35, N'triageCategoryValues', N'1,2,3,4,5', NULL, 4)
INSERT [dbo].[WebLinkParameter] ([parameterId], [name], [value], [referenceColumnId], [webLinkId]) VALUES (36, N'applicationName', N'cWhiteboard', NULL, 5)
INSERT [dbo].[WebLinkParameter] ([parameterId], [name], [value], [referenceColumnId], [webLinkId]) VALUES (37, N'entryPointName', N'Doctor Handover Editor', NULL, 5)
INSERT [dbo].[WebLinkParameter] ([parameterId], [name], [value], [referenceColumnId], [webLinkId]) VALUES (38, N'doctorHandoverDialog', N'true', NULL, 5)
INSERT [dbo].[WebLinkParameter] ([parameterId], [name], [value], [referenceColumnId], [webLinkId]) VALUES (39, N'cacheNumbers', NULL, 53, 5)
INSERT [dbo].[WebLinkParameter] ([parameterId], [name], [value], [referenceColumnId], [webLinkId]) VALUES (53, N'applicationName', N'cWhiteboard', NULL, 9)
INSERT [dbo].[WebLinkParameter] ([parameterId], [name], [value], [referenceColumnId], [webLinkId]) VALUES (54, N'entryPointName', N'Doctor SeenBy Editor', NULL, 9)
INSERT [dbo].[WebLinkParameter] ([parameterId], [name], [value], [referenceColumnId], [webLinkId]) VALUES (55, N'arrivedDttm', N'<%exec DateFormatter.applyPattern("yyyyMMdd")%><%=DateFormatter.format(row.get("arrivedDttm"))%>', NULL, 9)
INSERT [dbo].[WebLinkParameter] ([parameterId], [name], [value], [referenceColumnId], [webLinkId]) VALUES (56, N'cacheNumber', NULL, 56, 9)
INSERT [dbo].[WebLinkParameter] ([parameterId], [name], [value], [referenceColumnId], [webLinkId]) VALUES (57, N'documentType', N'DISDOC', NULL, 9)
INSERT [dbo].[WebLinkParameter] ([parameterId], [name], [value], [referenceColumnId], [webLinkId]) VALUES (58, N'patientDOB', N'<%exec DateFormatter.applyPattern("yyyyMMdd")%><%=DateFormatter.format(row.get("patientDateOfBirth"))%>', NULL, 9)
INSERT [dbo].[WebLinkParameter] ([parameterId], [name], [value], [referenceColumnId], [webLinkId]) VALUES (59, N'patientGender', NULL, 61, 9)
INSERT [dbo].[WebLinkParameter] ([parameterId], [name], [value], [referenceColumnId], [webLinkId]) VALUES (60, N'triageCategoriesToEnableSeenAtArrivalTimeCheckbox', N'1,2', NULL, 9)
INSERT [dbo].[WebLinkParameter] ([parameterId], [name], [value], [referenceColumnId], [webLinkId]) VALUES (61, N'applicationName', N'cWhiteboard', NULL, 10)
INSERT [dbo].[WebLinkParameter] ([parameterId], [name], [value], [referenceColumnId], [webLinkId]) VALUES (62, N'entryPointName', N'Note Editor', NULL, 10)
INSERT [dbo].[WebLinkParameter] ([parameterId], [name], [value], [referenceColumnId], [webLinkId]) VALUES (63, N'cacheNumber', NULL, 65, 10)
INSERT [dbo].[WebLinkParameter] ([parameterId], [name], [value], [referenceColumnId], [webLinkId]) VALUES (64, N'fieldValue', NULL, 64, 10)
INSERT [dbo].[WebLinkParameter] ([parameterId], [name], [value], [referenceColumnId], [webLinkId]) VALUES (65, N'columnName', N'PresentingComplaint', NULL, 10)
INSERT [dbo].[WebLinkParameter] ([parameterId], [name], [value], [referenceColumnId], [webLinkId]) VALUES (66, N'columnSize', N'512', NULL, 10)
INSERT [dbo].[WebLinkParameter] ([parameterId], [name], [value], [referenceColumnId], [webLinkId]) VALUES (67, N'mode', N'text', NULL, 10)
INSERT [dbo].[WebLinkParameter] ([parameterId], [name], [value], [referenceColumnId], [webLinkId]) VALUES (68, N'applicationName', N'cWhiteboard', NULL, 11)
INSERT [dbo].[WebLinkParameter] ([parameterId], [name], [value], [referenceColumnId], [webLinkId]) VALUES (69, N'entryPointName', N'Location Editor', NULL, 11)
INSERT [dbo].[WebLinkParameter] ([parameterId], [name], [value], [referenceColumnId], [webLinkId]) VALUES (70, N'cacheNumber', NULL, 68, 11)
INSERT [dbo].[WebLinkParameter] ([parameterId], [name], [value], [referenceColumnId], [webLinkId]) VALUES (71, N'applicationName', N'cWhiteboard', NULL, 12)
INSERT [dbo].[WebLinkParameter] ([parameterId], [name], [value], [referenceColumnId], [webLinkId]) VALUES (72, N'entryPointName', N'Nurse SeenBy Editor', NULL, 12)
INSERT [dbo].[WebLinkParameter] ([parameterId], [name], [value], [referenceColumnId], [webLinkId]) VALUES (73, N'cacheNumber', NULL, 77, 12)
INSERT [dbo].[WebLinkParameter] ([parameterId], [name], [value], [referenceColumnId], [webLinkId]) VALUES (74, N'applicationName', N'cWhiteboard', NULL, 13)
INSERT [dbo].[WebLinkParameter] ([parameterId], [name], [value], [referenceColumnId], [webLinkId]) VALUES (75, N'entryPointName', N'Nurse Handover Editor', NULL, 13)
INSERT [dbo].[WebLinkParameter] ([parameterId], [name], [value], [referenceColumnId], [webLinkId]) VALUES (76, N'doctorHandoverDialog', N'false', NULL, 13)
INSERT [dbo].[WebLinkParameter] ([parameterId], [name], [value], [referenceColumnId], [webLinkId]) VALUES (77, N'cacheNumbers', NULL, 88, 13)
INSERT [dbo].[WebLinkParameter] ([parameterId], [name], [value], [referenceColumnId], [webLinkId]) VALUES (78, N'triageCategoriesToEnableSeenAtArrivalTimeCheckbox', N'1,2', NULL, 9)
INSERT [dbo].[WebLinkParameter] ([parameterId], [name], [value], [referenceColumnId], [webLinkId]) VALUES (83, N'canFormFieldBeNull', N'true', NULL, 10)
SET IDENTITY_INSERT [dbo].[WebLinkParameter] OFF
/****** Object:  Table [dbo].[TreatmentProtocol]    Script Date: 06/18/2015 12:04:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TreatmentProtocol]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TreatmentProtocol](
	[treatmentProtocolId] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[code] [nvarchar](20) NOT NULL,
	[documentUrl] [nvarchar](200) NULL,
	[imageUrl] [nvarchar](200) NULL,
	[active] [nchar](1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[treatmentProtocolId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[TreatmentProtocol] ON
INSERT [dbo].[TreatmentProtocol] ([treatmentProtocolId], [name], [code], [documentUrl], [imageUrl], [active]) VALUES (1, N'Asthma issues', N'Asthma', N'http://Asthma.com', N'http://Asthma.com', N'Y')
SET IDENTITY_INSERT [dbo].[TreatmentProtocol] OFF
/****** Object:  Table [dbo].[TaskStatus]    Script Date: 06/18/2015 12:04:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TaskStatus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TaskStatus](
	[hospitalNo] [varchar](50) NULL,
	[episodeType] [varchar](50) NULL,
	[encounterNumber] [varchar](50) NULL,
	[programInitial] [varchar](10) NOT NULL,
	[patientId] [varchar](10) NOT NULL,
	[program] [varchar](200) NULL,
	[enrollmentStatus] [varchar](30) NULL,
	[enrollmentStatusUpdatedDate] [datetime] NULL,
	[programColor] [varchar](10) NULL,
	[noOfTasks] [int] NULL,
	[taskDetails] [varchar](2000) NULL,
	[earliestTaskDueDate] [datetime] NULL,
	[taskStatusIcon] [varchar](200) NULL,
	[transactionDttm] [datetime] NULL,
 CONSTRAINT [PK_TaskStatus_1] PRIMARY KEY CLUSTERED 
(
	[patientId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Specialty]    Script Date: 06/18/2015 12:04:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Specialty]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Specialty](
	[specialtyId] [int] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](20) NOT NULL,
	[description] [nvarchar](1000) NULL,
	[abbreviation] [nvarchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[specialtyId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[Specialty] ON
INSERT [dbo].[Specialty] ([specialtyId], [code], [description], [abbreviation]) VALUES (1, N'RN', N'Register Nurse', N'RN')
SET IDENTITY_INSERT [dbo].[Specialty] OFF
/****** Object:  Table [dbo].[SchemaMetaData]    Script Date: 06/18/2015 12:04:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SchemaMetaData]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SchemaMetaData](
	[uniqueId] [int] NOT NULL,
	[productName] [nvarchar](128) NULL,
	[version] [nvarchar](128) NULL,
PRIMARY KEY CLUSTERED 
(
	[uniqueId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[SchemaMetaData] ([uniqueId], [productName], [version]) VALUES (1, N'cWhiteboard', N'5.1.6.3492')
/****** Object:  Table [dbo].[routerControl]    Script Date: 06/18/2015 12:04:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[routerControl]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[routerControl](
	[adtStatus] [varchar](20) NULL,
	[resultStatus] [varchar](20) NULL,
	[resultSequenceNumber] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rhapsody to Whiteboard]    Script Date: 06/18/2015 12:04:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Rhapsody to Whiteboard]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Rhapsody to Whiteboard](
	[EventClass] [decimal](18, 0) NULL,
	[TextData] [ntext] NULL,
	[ConnectionID] [decimal](18, 0) NULL,
	[NTUserName] [nvarchar](256) NULL,
	[ApplicationName] [nvarchar](128) NULL,
	[SQLUserName] [nvarchar](128) NULL,
	[SPID] [decimal](18, 0) NULL,
	[Duration] [decimal](18, 0) NULL,
	[StartTime] [datetime] NULL,
	[Reads] [decimal](18, 0) NULL,
	[Writes] [decimal](18, 0) NULL,
	[CPU] [decimal](18, 0) NULL,
	[DatabaseID] [decimal](18, 0) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Consultant]    Script Date: 06/18/2015 12:04:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Consultant]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Consultant](
	[consultantId] [int] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](20) NOT NULL,
	[surname] [nvarchar](25) NOT NULL,
	[firstGivenName] [nvarchar](20) NOT NULL,
	[secondGivenName] [nvarchar](20) NULL,
	[thirdGivenName] [nvarchar](20) NULL,
	[title] [nvarchar](5) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[consultantId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[CacheAudit]    Script Date: 06/18/2015 12:04:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CacheAudit]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CacheAudit](
	[Id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[episodeType] [nvarchar](10) NOT NULL,
	[encounterNumber] [nvarchar](20) NOT NULL,
	[specialtyType] [nvarchar](20) NOT NULL,
	[performedAction] [nvarchar](50) NOT NULL,
	[actionDttm] [datetime] NOT NULL,
	[seenByDoctorId] [nvarchar](50) NULL,
	[seenByDoctorSurname] [nvarchar](50) NULL,
	[seenByDoctorFirstName] [nvarchar](50) NULL,
	[assignedConsultantId] [nvarchar](20) NULL,
	[assignedConsultantSurname] [nvarchar](50) NULL,
	[assignedConsultantFirstName] [nvarchar](40) NULL,
	[transactionDttm] [datetime] NULL,
	[patientId] [nvarchar](255) NULL,
	[patientFullName] [nvarchar](170) NULL,
	[userId] [nvarchar](50) NULL,
	[facilityCode] [nvarchar](20) NULL,
	[siteCode] [nvarchar](20) NULL,
	[locationCode] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ActionButtonParameter]    Script Date: 06/18/2015 12:04:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ActionButtonParameter]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ActionButtonParameter](
	[actionButtonParameterId] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[value] [nvarchar](1000) NULL,
	[repeating] [nchar](1) NOT NULL,
	[referenceColumnId] [int] NULL,
	[actionButtonId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[actionButtonParameterId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[ActionButtonParameter] ON
INSERT [dbo].[ActionButtonParameter] ([actionButtonParameterId], [name], [value], [repeating], [referenceColumnId], [actionButtonId]) VALUES (1, N'cacheNumbers', NULL, N'Y', 1, 1)
INSERT [dbo].[ActionButtonParameter] ([actionButtonParameterId], [name], [value], [repeating], [referenceColumnId], [actionButtonId]) VALUES (2, N'doctorHandoverDialog', N'true', N'N', NULL, 1)
INSERT [dbo].[ActionButtonParameter] ([actionButtonParameterId], [name], [value], [repeating], [referenceColumnId], [actionButtonId]) VALUES (3, N'applicationName', N'cWhiteboard', N'N', NULL, 1)
INSERT [dbo].[ActionButtonParameter] ([actionButtonParameterId], [name], [value], [repeating], [referenceColumnId], [actionButtonId]) VALUES (4, N'entryPointName', N'Doctor Handover Editor', N'N', NULL, 1)
INSERT [dbo].[ActionButtonParameter] ([actionButtonParameterId], [name], [value], [repeating], [referenceColumnId], [actionButtonId]) VALUES (5, N'cacheNumbers', NULL, N'Y', 3, 2)
INSERT [dbo].[ActionButtonParameter] ([actionButtonParameterId], [name], [value], [repeating], [referenceColumnId], [actionButtonId]) VALUES (6, N'doctorHandoverDialog', N'false', N'N', NULL, 2)
INSERT [dbo].[ActionButtonParameter] ([actionButtonParameterId], [name], [value], [repeating], [referenceColumnId], [actionButtonId]) VALUES (7, N'applicationName', N'cWhiteboard', N'N', NULL, 2)
INSERT [dbo].[ActionButtonParameter] ([actionButtonParameterId], [name], [value], [repeating], [referenceColumnId], [actionButtonId]) VALUES (8, N'entryPointName', N'Nurse Handover Editor', N'N', NULL, 2)
SET IDENTITY_INSERT [dbo].[ActionButtonParameter] OFF
/****** Object:  Table [dbo].[DataSource]    Script Date: 06/18/2015 12:04:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DataSource]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DataSource](
	[dataSourceId] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[description] [nvarchar](1000) NULL,
	[driverClassName] [nvarchar](255) NOT NULL,
	[connectionString] [nvarchar](255) NOT NULL,
	[username] [nvarchar](30) NOT NULL,
	[password] [nvarchar](30) NULL,
	[minimumIdleConnections] [int] NOT NULL,
	[maximumIdleConnections] [int] NOT NULL,
	[maximumConnections] [int] NOT NULL,
	[poolTimeout] [int] NOT NULL,
	[validationQuery] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[dataSourceId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[DataSource] ON
INSERT [dbo].[DataSource] ([dataSourceId], [name], [description], [driverClassName], [connectionString], [username], [password], [minimumIdleConnections], [maximumIdleConnections], [maximumConnections], [poolTimeout], [validationQuery]) VALUES (1, N'audit', N'', N'net.sourceforge.jtds.jdbc.Driver', N'jdbc:jtds:sqlserver://Acthtstsql2008.test.act.gov.au:1433/OH_CP_Audit', N'OrionPortal', N'c@nb3rr@', 2, 4, 25, 6000, N'')
INSERT [dbo].[DataSource] ([dataSourceId], [name], [description], [driverClassName], [connectionString], [username], [password], [minimumIdleConnections], [maximumIdleConnections], [maximumConnections], [poolTimeout], [validationQuery]) VALUES (2, N'adt', N'ACTPAS', N'net.sourceforge.jtds.jdbc.Driver', N'jdbc:jtds:sqlserver://Acthtstsql2008.test.act.gov.au:1433/ACTPAS_CDR_VIEWS', N'OrionPortal', N'c@nb3rr@', 2, 4, 25, 60000, N'select 1')
INSERT [dbo].[DataSource] ([dataSourceId], [name], [description], [driverClassName], [connectionString], [username], [password], [minimumIdleConnections], [maximumIdleConnections], [maximumConnections], [poolTimeout], [validationQuery]) VALUES (3, N'cWhiteboard', N'Whiteboard DB', N'net.sourceforge.jtds.jdbc.Driver', N'jdbc:jtds:sqlserver://Acthtstsql2008.test.act.gov.au:1433/OH_cWhiteboard', N'OrionPortal', N'c@nb3rr@', 2, 4, 25, 60000, N'select 1')
INSERT [dbo].[DataSource] ([dataSourceId], [name], [description], [driverClassName], [connectionString], [username], [password], [minimumIdleConnections], [maximumIdleConnections], [maximumConnections], [poolTimeout], [validationQuery]) VALUES (4, N'coding', N'SMT CDR Coding DB', N'net.sourceforge.jtds.jdbc.Driver', N'jdbc:jtds:sqlserver://Acthtstsql2008.test.act.gov.au:1433/CDRCoding', N'OrionPortal', N'c@nb3rr@', 2, 4, 25, 60000, N'select 1')
SET IDENTITY_INSERT [dbo].[DataSource] OFF
/****** Object:  Table [dbo].[Facility]    Script Date: 06/18/2015 12:04:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Facility]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Facility](
	[facilityId] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[description] [nvarchar](1000) NULL,
	[code] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[facilityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[Facility] ON
INSERT [dbo].[Facility] ([facilityId], [name], [description], [code]) VALUES (2, N'ACT Health Public', N'ACT Health Public', N'ACTCC')
SET IDENTITY_INSERT [dbo].[Facility] OFF
/****** Object:  Table [dbo].[Doctor]    Script Date: 06/18/2015 12:04:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Doctor]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Doctor](
	[doctorId] [int] IDENTITY(1,1) NOT NULL,
	[concertoId] [nvarchar](50) NULL,
	[givenName] [nvarchar](50) NULL,
	[surname] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[doctorId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[Doctor] ON
INSERT [dbo].[Doctor] ([doctorId], [concertoId], [givenName], [surname]) VALUES (1, N'wic_1', N'', N'wic_1')
INSERT [dbo].[Doctor] ([doctorId], [concertoId], [givenName], [surname]) VALUES (2, N'Kit.Blur', N'Kit', N'Blur')
INSERT [dbo].[Doctor] ([doctorId], [concertoId], [givenName], [surname]) VALUES (3, N'wic_2', N'Wic', N'User')
INSERT [dbo].[Doctor] ([doctorId], [concertoId], [givenName], [surname]) VALUES (4, N'nitten', N'', N'nitten')
SET IDENTITY_INSERT [dbo].[Doctor] OFF
/****** Object:  Table [dbo].[Nurse]    Script Date: 06/18/2015 12:04:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Nurse]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Nurse](
	[nurseId] [int] IDENTITY(1,1) NOT NULL,
	[concertoId] [nvarchar](50) NOT NULL,
	[givenName] [nvarchar](50) NULL,
	[surname] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[nurseId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[Nurse] ON
INSERT [dbo].[Nurse] ([nurseId], [concertoId], [givenName], [surname]) VALUES (1, N'wic_1', N'', N'wic_1')
INSERT [dbo].[Nurse] ([nurseId], [concertoId], [givenName], [surname]) VALUES (2, N'wic_2', N'Wic', N'User')
SET IDENTITY_INSERT [dbo].[Nurse] OFF
/****** Object:  Table [dbo].[NumericId]    Script Date: 06/18/2015 12:04:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NumericId]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NumericId](
	[numericId] [int] NOT NULL,
	[nextId] [numeric](19, 0) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[numericId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[NumericId] ([numericId], [nextId]) VALUES (0, CAST(366 AS Numeric(19, 0)))
/****** Object:  Table [dbo].[Message]    Script Date: 06/18/2015 12:04:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Message]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Message](
	[messageId] [int] IDENTITY(1,1) NOT NULL,
	[messageControlId] [nvarchar](20) NOT NULL,
	[sendingApplicationNamespaceId] [nvarchar](255) NULL,
	[sendingApplicationUniversalId] [nvarchar](255) NULL,
	[sendingApplicationUnivIdType] [nvarchar](255) NULL,
	[sendingFacilityNamespaceId] [nvarchar](255) NULL,
	[sendingFacilityUniversalId] [nvarchar](255) NULL,
	[sendingFacilityUnivIdType] [nvarchar](255) NULL,
	[messageDate] [datetime] NULL,
	[dateProcessed] [datetime] NOT NULL,
	[messageType] [nvarchar](5) NOT NULL,
	[triggerEvent] [nvarchar](10) NOT NULL,
	[responseControlId] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[messageId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 06/18/2015 12:04:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Patient]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Patient](
	[patientId] [int] IDENTITY(1,1) NOT NULL,
	[surname] [nvarchar](50) NOT NULL,
	[firstGivenName] [nvarchar](40) NOT NULL,
	[secondGivenName] [nvarchar](40) NULL,
	[thirdGivenName] [nvarchar](40) NULL,
	[gender] [nvarchar](15) NULL,
	[dateOfBirth] [datetime] NULL,
	[dateOfDeath] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[patientId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PresentationView]    Script Date: 06/18/2015 12:04:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PresentationView]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PresentationView](
	[viewId] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[description] [nvarchar](1000) NULL,
	[refreshRate] [int] NOT NULL,
	[recordsPerPage] [int] NOT NULL,
	[autoColumnsLayout] [nchar](1) NOT NULL,
	[defaultOrderByColumns] [nvarchar](255) NULL,
	[onloadCustomJavaScriptCall] [nvarchar](512) NULL,
	[viewSql] [ntext] NULL,
	[lastUpdateDatetime] [datetime] NOT NULL,
	[currentPatientCountSql] [nvarchar](500) NULL,
	[maxCharsPerLine] [int] NOT NULL,
	[maxNumberOfLines] [int] NOT NULL,
	[bigScreenMode] [nchar](1) NOT NULL,
	[secondsBetweenScroll] [int] NOT NULL,
	[recordsPerScroll] [int] NOT NULL,
	[displayVacantLocations] [nchar](1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[viewId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[PresentationView] ON
INSERT [dbo].[PresentationView] ([viewId], [name], [description], [refreshRate], [recordsPerPage], [autoColumnsLayout], [defaultOrderByColumns], [onloadCustomJavaScriptCall], [viewSql], [lastUpdateDatetime], [currentPatientCountSql], [maxCharsPerLine], [maxNumberOfLines], [bigScreenMode], [secondsBetweenScroll], [recordsPerScroll], [displayVacantLocations]) VALUES (2, N'Belconnen WalkIn Center View', N'Walkin Center View', 5, 100, N'Y', N'Arrived;asc', N'', N'LEFT OUTER JOIN Patient patient ON latestCache.patientid = patient.patientId    
LEFT OUTER JOIN Area siteArea ON siteLocation.areaId = siteArea.areaId   
LEFT OUTER JOIN ExternalPatientId externalPatientId ON latestCache.patientId = externalPatientId.patientId     
LEFT OUTER JOIN Nurse assignedNurse ON siteCache.assignedNurseId = assignedNurse.nurseId   
LEFT OUTER JOIN Nurse seenByNurse ON siteCache.seenByNurseId = seenByNurse.nurseId   
LEFT OUTER JOIN Doctor assignedDoctor ON siteCache.assignedDoctorId = assignedDoctor.doctorId   
LEFT OUTER JOIN Doctor seenByDoctor on siteCache.seenByDoctorId = seenByDoctor.doctorId   
LEFT OUTER JOIN Consultant consultant on siteCache.assignedConsultantId = consultant.consultantId   
LEFT OUTER JOIN Specialty specialty on siteCache.specialtyId = specialty.specialtyId   
LEFT OUTER JOIN TreatmentProtocol treatmentProtocol ON siteCache.treatmentProtocolId = treatmentProtocol.treatmentProtocolId   
LEFT OUTER JOIN Location latestLocation on latestCache.locationId = latestLocation.locationId   
LEFT OUTER JOIN Area latestArea ON latestLocation.areaId = latestArea.areaId   
LEFT OUTER JOIN Site latestSite ON latestCache.siteId = latestSite.siteId   
LEFT OUTER JOIN Facility latestFacility ON latestFacility.facilityId = latestSite.facilityId   
LEFT OUTER JOIN Result ON siteCache.encounterNumber = result.encounterNumber AND siteCache.patientId = result.patientId   
LEFT OUTER JOIN CacheTableHistory latestCacheHistory ON latestCache.cacheNumber = latestCacheHistory.cacheNumber   
LEFT OUTER JOIN Location latestCachePrevLocation ON latestCachePrevLocation.locationId = latestCacheHistory.locationId   
LEFT OUTER JOIN CacheTableHistory siteCacheHistory ON siteCache.cacheNumber = siteCacheHistory.cacheNumber   
LEFT OUTER JOIN Location siteCachePrevLocation ON siteCachePrevLocation.locationId = siteCacheHistory.locationId   
LEFT OUTER JOIN CacheAudit notesAudit ON externalPatientId.externalpatientid = notesaudit.patientId 
    AND notesAudit.performedAction= ''Update Text/PresentingComplaint''   
    AND notesAudit.actionDttm = (SELECT MAX(actionDttm) FROM CacheAudit a WHERE a.patientId = externalPatientId.externalpatientid AND a.performedAction= ''Update Text/PresentingComplaint'')  
LEFT OUTER JOIN CacheAudit handoverAudit ON externalPatientId.externalpatientid = handoveraudit.patientId    
    AND handoverAudit.performedAction= ''Nurse Handover''   
    AND handoverAudit.actionDttm =(SELECT MAX(actionDttm) FROM CacheAudit a WHERE a.patientId = externalPatientId.externalpatientid AND a.performedAction= ''Nurse Handover'')  
WHERE siteLocation.siteId = <%=siteId%> 
AND siteCache.sitedeparteddttm IS NULL
<%if locationFilterExpression%>  
    AND (<%=locationFilterExpression%>)
<%end if%>   
AND ((siteCache.cacheNumber IS NULL AND siteLocation.unallocatedLocation = ''N'')    
     OR (externalPatientId.primaryId = ''Y''    
         AND latestCache.registrationDttm = (SELECT MAX(registrationDttm) FROM Cache c WHERE c.patientId = siteCache.patientId)     
         AND siteCache.registrationDttm =(SELECT MAX(registrationDttm) FROM Cache c WHERE c.patientId = siteCache.patientId AND c.siteId = <%=siteId%>)     
         <%if patientFilterExpression%>
            AND <%=patientFilterExpression%>
         <%end if%>
        )
    )', CAST(0x0000A4B300D2B289 AS DateTime), N'siteDepartedDttm IS NULL AND arrivedDttm IS NOT NULL', 50, 5, N'N', 10, 10, N'N')
INSERT [dbo].[PresentationView] ([viewId], [name], [description], [refreshRate], [recordsPerPage], [autoColumnsLayout], [defaultOrderByColumns], [onloadCustomJavaScriptCall], [viewSql], [lastUpdateDatetime], [currentPatientCountSql], [maxCharsPerLine], [maxNumberOfLines], [bigScreenMode], [secondsBetweenScroll], [recordsPerScroll], [displayVacantLocations]) VALUES (3, N'Tuggeranong WalkIn Center View', N'Walkin Center View', 5, 100, N'Y', N'Arrived;asc', N'', N'LEFT OUTER JOIN Patient patient ON latestCache.patientid = patient.patientId   
LEFT OUTER JOIN Area siteArea ON siteLocation.areaId = siteArea.areaId   
LEFT OUTER JOIN ExternalPatientId externalPatientId ON latestCache.patientId = externalPatientId.patientId    
LEFT OUTER JOIN Nurse assignedNurse ON siteCache.assignedNurseId = assignedNurse.nurseId   
LEFT OUTER JOIN Nurse seenByNurse ON siteCache.seenByNurseId = seenByNurse.nurseId   
LEFT OUTER JOIN Doctor assignedDoctor ON siteCache.assignedDoctorId = assignedDoctor.doctorId   
LEFT OUTER JOIN Doctor seenByDoctor on siteCache.seenByDoctorId = seenByDoctor.doctorId   
LEFT OUTER JOIN Consultant consultant on siteCache.assignedConsultantId = consultant.consultantId   
LEFT OUTER JOIN Specialty specialty on siteCache.specialtyId = specialty.specialtyId   
LEFT OUTER JOIN TreatmentProtocol treatmentProtocol ON siteCache.treatmentProtocolId = treatmentProtocol.treatmentProtocolId   
LEFT OUTER JOIN Location latestLocation on latestCache.locationId = latestLocation.locationId   
LEFT OUTER JOIN Area latestArea ON latestLocation.areaId = latestArea.areaId   
LEFT OUTER JOIN Site latestSite ON latestCache.siteId = latestSite.siteId   
LEFT OUTER JOIN Facility latestFacility ON latestFacility.facilityId = latestSite.facilityId   
LEFT OUTER JOIN Result ON siteCache.encounterNumber = result.encounterNumber AND siteCache.patientId = result.patientId   
LEFT OUTER JOIN CacheTableHistory latestCacheHistory ON latestCache.cacheNumber = latestCacheHistory.cacheNumber   
LEFT OUTER JOIN Location latestCachePrevLocation ON latestCachePrevLocation.locationId = latestCacheHistory.locationId   
LEFT OUTER JOIN CacheTableHistory siteCacheHistory ON siteCache.cacheNumber = siteCacheHistory.cacheNumber   
LEFT OUTER JOIN Location siteCachePrevLocation ON siteCachePrevLocation.locationId = siteCacheHistory.locationId   
LEFT OUTER JOIN CacheAudit notesAudit ON externalPatientId.externalpatientid = notesaudit.patientId 
    AND notesAudit.performedAction= ''Update Text/PresentingComplaint''   
    AND notesAudit.actionDttm = (SELECT MAX(actionDttm) FROM CacheAudit a WHERE a.patientId = externalPatientId.externalpatientid AND a.performedAction= ''Update Text/PresentingComplaint'')  
LEFT OUTER JOIN CacheAudit handoverAudit ON externalPatientId.externalpatientid = handoveraudit.patientId    
    AND handoverAudit.performedAction= ''Nurse Handover''   
    AND handoverAudit.actionDttm =(SELECT MAX(actionDttm) FROM CacheAudit a WHERE a.patientId = externalPatientId.externalpatientid AND a.performedAction= ''Nurse Handover'')  
WHERE siteLocation.siteId = <%=siteId%> 
AND siteCache.sitedeparteddttm IS NULL
<%if locationFilterExpression%>  
    AND (<%=locationFilterExpression%>)
<%end if%>   
AND ((siteCache.cacheNumber IS NULL AND siteLocation.unallocatedLocation = ''N'')    
     OR (externalPatientId.primaryId = ''Y''    
         AND latestCache.registrationDttm = (SELECT MAX(registrationDttm) FROM Cache c WHERE c.patientId = siteCache.patientId)     
         AND siteCache.registrationDttm =(SELECT MAX(registrationDttm) FROM Cache c WHERE c.patientId = siteCache.patientId AND c.siteId = <%=siteId%>)     
         <%if patientFilterExpression%>
            AND <%=patientFilterExpression%>
         <%end if%>
        )
    )', CAST(0x0000A4B201178E65 AS DateTime), N'siteDepartedDttm IS NULL AND arrivedDttm IS NOT NULL', 50, 5, N'N', 10, 10, N'N')
SET IDENTITY_INSERT [dbo].[PresentationView] OFF
/****** Object:  Table [dbo].[ViewColumn]    Script Date: 06/18/2015 12:04:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ViewColumn]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ViewColumn](
	[viewColumnId] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](35) NULL,
	[enableSorting] [nchar](1) NOT NULL,
	[width] [int] NOT NULL,
	[columnOrder] [int] NOT NULL,
	[headerHorizontalAlignment] [nvarchar](6) NULL,
	[dataHorizontalAlignment] [nvarchar](6) NULL,
	[mouseOverTitle] [nvarchar](50) NULL,
	[viewId] [int] NOT NULL,
	[displayColumnId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[viewColumnId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[ViewColumn] ON
INSERT [dbo].[ViewColumn] ([viewColumnId], [title], [enableSorting], [width], [columnOrder], [headerHorizontalAlignment], [dataHorizontalAlignment], [mouseOverTitle], [viewId], [displayColumnId]) VALUES (21, N'Location', N'Y', 0, 0, N'left', N'left', N'WIC Location Code', 3, 14)
INSERT [dbo].[ViewColumn] ([viewColumnId], [title], [enableSorting], [width], [columnOrder], [headerHorizontalAlignment], [dataHorizontalAlignment], [mouseOverTitle], [viewId], [displayColumnId]) VALUES (33, N'URN', N'N', 0, 1, N'left', N'left', N'Patient ID', 3, 18)
INSERT [dbo].[ViewColumn] ([viewColumnId], [title], [enableSorting], [width], [columnOrder], [headerHorizontalAlignment], [dataHorizontalAlignment], [mouseOverTitle], [viewId], [displayColumnId]) VALUES (34, N'Name', N'Y', 0, 2, N'left', N'left', N'Patient Name', 3, 4)
INSERT [dbo].[ViewColumn] ([viewColumnId], [title], [enableSorting], [width], [columnOrder], [headerHorizontalAlignment], [dataHorizontalAlignment], [mouseOverTitle], [viewId], [displayColumnId]) VALUES (35, N'Arrived', N'Y', 0, 3, N'left', N'left', N'Patient Arrive time', 3, 8)
INSERT [dbo].[ViewColumn] ([viewColumnId], [title], [enableSorting], [width], [columnOrder], [headerHorizontalAlignment], [dataHorizontalAlignment], [mouseOverTitle], [viewId], [displayColumnId]) VALUES (36, N'Sex', N'N', 0, 4, N'right', N'right', N'Patient Gender', 3, 5)
INSERT [dbo].[ViewColumn] ([viewColumnId], [title], [enableSorting], [width], [columnOrder], [headerHorizontalAlignment], [dataHorizontalAlignment], [mouseOverTitle], [viewId], [displayColumnId]) VALUES (37, N'/', N'N', 0, 5, N'center', N'center', N'', 3, 6)
INSERT [dbo].[ViewColumn] ([viewColumnId], [title], [enableSorting], [width], [columnOrder], [headerHorizontalAlignment], [dataHorizontalAlignment], [mouseOverTitle], [viewId], [displayColumnId]) VALUES (38, N'Age', N'Y', 0, 6, N'left', N'left', N'Patient Age', 3, 7)
INSERT [dbo].[ViewColumn] ([viewColumnId], [title], [enableSorting], [width], [columnOrder], [headerHorizontalAlignment], [dataHorizontalAlignment], [mouseOverTitle], [viewId], [displayColumnId]) VALUES (39, N'Waiting Time', N'N', 0, 7, N'center', N'center', N'', 3, 19)
INSERT [dbo].[ViewColumn] ([viewColumnId], [title], [enableSorting], [width], [columnOrder], [headerHorizontalAlignment], [dataHorizontalAlignment], [mouseOverTitle], [viewId], [displayColumnId]) VALUES (40, N'Status', N'Y', 0, 8, N'right', N'right', N'Status', 3, 12)
INSERT [dbo].[ViewColumn] ([viewColumnId], [title], [enableSorting], [width], [columnOrder], [headerHorizontalAlignment], [dataHorizontalAlignment], [mouseOverTitle], [viewId], [displayColumnId]) VALUES (41, N'/', N'N', 0, 9, N'center', N'center', N'', 3, 6)
INSERT [dbo].[ViewColumn] ([viewColumnId], [title], [enableSorting], [width], [columnOrder], [headerHorizontalAlignment], [dataHorizontalAlignment], [mouseOverTitle], [viewId], [displayColumnId]) VALUES (42, N'Assigned Nurse', N'N', 0, 10, N'left', N'left', N'', 3, 17)
INSERT [dbo].[ViewColumn] ([viewColumnId], [title], [enableSorting], [width], [columnOrder], [headerHorizontalAlignment], [dataHorizontalAlignment], [mouseOverTitle], [viewId], [displayColumnId]) VALUES (45, N'Location', N'N', 0, 0, N'left', N'left', N'', 2, 14)
INSERT [dbo].[ViewColumn] ([viewColumnId], [title], [enableSorting], [width], [columnOrder], [headerHorizontalAlignment], [dataHorizontalAlignment], [mouseOverTitle], [viewId], [displayColumnId]) VALUES (46, N'URN', N'N', 0, 1, N'left', N'left', N'', 2, 18)
INSERT [dbo].[ViewColumn] ([viewColumnId], [title], [enableSorting], [width], [columnOrder], [headerHorizontalAlignment], [dataHorizontalAlignment], [mouseOverTitle], [viewId], [displayColumnId]) VALUES (47, N'Patient Name', N'Y', 0, 2, N'left', N'left', N'', 2, 4)
INSERT [dbo].[ViewColumn] ([viewColumnId], [title], [enableSorting], [width], [columnOrder], [headerHorizontalAlignment], [dataHorizontalAlignment], [mouseOverTitle], [viewId], [displayColumnId]) VALUES (48, N'Arrived', N'N', 0, 3, N'center', N'center', N'', 2, 8)
INSERT [dbo].[ViewColumn] ([viewColumnId], [title], [enableSorting], [width], [columnOrder], [headerHorizontalAlignment], [dataHorizontalAlignment], [mouseOverTitle], [viewId], [displayColumnId]) VALUES (49, N'Sex', N'N', 0, 4, N'right', N'right', N'Patient Gender', 2, 5)
INSERT [dbo].[ViewColumn] ([viewColumnId], [title], [enableSorting], [width], [columnOrder], [headerHorizontalAlignment], [dataHorizontalAlignment], [mouseOverTitle], [viewId], [displayColumnId]) VALUES (50, N'/', N'N', 0, 5, N'center', N'center', N'', 2, 6)
INSERT [dbo].[ViewColumn] ([viewColumnId], [title], [enableSorting], [width], [columnOrder], [headerHorizontalAlignment], [dataHorizontalAlignment], [mouseOverTitle], [viewId], [displayColumnId]) VALUES (51, N'Age', N'N', 0, 6, N'left', N'left', N'Patient Age', 2, 7)
INSERT [dbo].[ViewColumn] ([viewColumnId], [title], [enableSorting], [width], [columnOrder], [headerHorizontalAlignment], [dataHorizontalAlignment], [mouseOverTitle], [viewId], [displayColumnId]) VALUES (52, N'Waiting Time', N'Y', 0, 7, N'center', N'center', N'', 2, 19)
INSERT [dbo].[ViewColumn] ([viewColumnId], [title], [enableSorting], [width], [columnOrder], [headerHorizontalAlignment], [dataHorizontalAlignment], [mouseOverTitle], [viewId], [displayColumnId]) VALUES (53, N'Status', N'Y', 0, 8, N'right', N'right', N'', 2, 12)
INSERT [dbo].[ViewColumn] ([viewColumnId], [title], [enableSorting], [width], [columnOrder], [headerHorizontalAlignment], [dataHorizontalAlignment], [mouseOverTitle], [viewId], [displayColumnId]) VALUES (54, N'/', N'N', 0, 9, N'center', N'center', N'', 2, 6)
INSERT [dbo].[ViewColumn] ([viewColumnId], [title], [enableSorting], [width], [columnOrder], [headerHorizontalAlignment], [dataHorizontalAlignment], [mouseOverTitle], [viewId], [displayColumnId]) VALUES (55, N'Assigned Nurse', N'N', 0, 10, N'left', N'left', N'', 2, 17)
INSERT [dbo].[ViewColumn] ([viewColumnId], [title], [enableSorting], [width], [columnOrder], [headerHorizontalAlignment], [dataHorizontalAlignment], [mouseOverTitle], [viewId], [displayColumnId]) VALUES (62, N'Patient Alert', N'N', 0, 11, N'', N'', N'', 2, 3)
INSERT [dbo].[ViewColumn] ([viewColumnId], [title], [enableSorting], [width], [columnOrder], [headerHorizontalAlignment], [dataHorizontalAlignment], [mouseOverTitle], [viewId], [displayColumnId]) VALUES (63, N'Presenting Complaint', N'N', 0, 12, N'', N'', N'', 2, 13)
INSERT [dbo].[ViewColumn] ([viewColumnId], [title], [enableSorting], [width], [columnOrder], [headerHorizontalAlignment], [dataHorizontalAlignment], [mouseOverTitle], [viewId], [displayColumnId]) VALUES (64, N'Patient Alert', N'N', 0, 11, N'', N'', N'', 3, 3)
INSERT [dbo].[ViewColumn] ([viewColumnId], [title], [enableSorting], [width], [columnOrder], [headerHorizontalAlignment], [dataHorizontalAlignment], [mouseOverTitle], [viewId], [displayColumnId]) VALUES (66, N'Presenting Complaint', N'N', 0, 12, N'', N'', N'', 3, 13)
SET IDENTITY_INSERT [dbo].[ViewColumn] OFF
/****** Object:  Table [dbo].[Site]    Script Date: 06/18/2015 12:04:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Site]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Site](
	[siteId] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[code] [nvarchar](20) NOT NULL,
	[description] [nvarchar](1000) NULL,
	[allowAdmit] [nchar](1) NOT NULL,
	[allowTransfer] [nchar](1) NOT NULL,
	[allowDischarge] [nchar](1) NOT NULL,
	[allowSelfDischarge] [nchar](1) NOT NULL,
	[allowRemoveDoctorSeenBy] [nchar](1) NOT NULL,
	[reAdmissionWarningPeriod] [int] NULL,
	[defaultViewId] [int] NULL,
	[facilityId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[siteId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[Site] ON
INSERT [dbo].[Site] ([siteId], [name], [code], [description], [allowAdmit], [allowTransfer], [allowDischarge], [allowSelfDischarge], [allowRemoveDoctorSeenBy], [reAdmissionWarningPeriod], [defaultViewId], [facilityId]) VALUES (2, N'Belconnen Community Health Centre', N'WICBHC', N'', N'N', N'N', N'N', N'N', N'N', NULL, 2, 2)
INSERT [dbo].[Site] ([siteId], [name], [code], [description], [allowAdmit], [allowTransfer], [allowDischarge], [allowSelfDischarge], [allowRemoveDoctorSeenBy], [reAdmissionWarningPeriod], [defaultViewId], [facilityId]) VALUES (3, N'Tuggeranong Community Health Centre', N'WICTHC', N'', N'Y', N'Y', N'Y', N'Y', N'Y', NULL, 3, 2)
SET IDENTITY_INSERT [dbo].[Site] OFF
/****** Object:  Table [dbo].[SchemaMetaDataHistory]    Script Date: 06/18/2015 12:04:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SchemaMetaDataHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SchemaMetaDataHistory](
	[uniqueId] [int] NOT NULL,
	[version] [nvarchar](128) NULL,
	[updatedBy] [nvarchar](128) NULL,
	[updatedAt] [datetime] NULL,
	[comments] [nvarchar](128) NULL,
	[schemaMetaData] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[uniqueId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[SchemaMetaDataHistory] ([uniqueId], [version], [updatedBy], [updatedAt], [comments], [schemaMetaData]) VALUES (1, N'5.1.3.3151''', N'Upgrade', CAST(0x0000A40600000000 AS DateTime), N'Upgrade to cWhiteboard 5.1.3', 1)
INSERT [dbo].[SchemaMetaDataHistory] ([uniqueId], [version], [updatedBy], [updatedAt], [comments], [schemaMetaData]) VALUES (2, N'5.1.4.1', N'Upgrade', CAST(0x0000A41000EC8BCC AS DateTime), N'Upgrade to cWhiteboard 5.1.4', 1)
INSERT [dbo].[SchemaMetaDataHistory] ([uniqueId], [version], [updatedBy], [updatedAt], [comments], [schemaMetaData]) VALUES (3, N'5.1.5.1', N'Upgrade', CAST(0x0000A41000ECF57D AS DateTime), N'Upgrade to cWhiteboard 5.1.5', 1)
INSERT [dbo].[SchemaMetaDataHistory] ([uniqueId], [version], [updatedBy], [updatedAt], [comments], [schemaMetaData]) VALUES (4, N'5.1.6.3492', N'Upgrade', CAST(0x0000A41000EE75D0 AS DateTime), N'Upgrade to cWhiteboard 5.1.6', 1)
/****** Object:  Table [dbo].[PatientMapSpecialtyIcon]    Script Date: 06/18/2015 12:04:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientMapSpecialtyIcon]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PatientMapSpecialtyIcon](
	[iconId] [int] IDENTITY(1,1) NOT NULL,
	[magicSpecialty] [nvarchar](10) NULL,
	[singlePatientIconPath] [nvarchar](255) NOT NULL,
	[multiplePatientIconPath] [nvarchar](255) NOT NULL,
	[specialtyId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[iconId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[PatientMapSpecialtyIcon] ON
INSERT [dbo].[PatientMapSpecialtyIcon] ([iconId], [magicSpecialty], [singlePatientIconPath], [multiplePatientIconPath], [specialtyId]) VALUES (3, N'Multiple', N'patient.gif', N'patients.gif', NULL)
INSERT [dbo].[PatientMapSpecialtyIcon] ([iconId], [magicSpecialty], [singlePatientIconPath], [multiplePatientIconPath], [specialtyId]) VALUES (4, N'Others', N'patient.gif', N'patients.gif', NULL)
INSERT [dbo].[PatientMapSpecialtyIcon] ([iconId], [magicSpecialty], [singlePatientIconPath], [multiplePatientIconPath], [specialtyId]) VALUES (5, NULL, N'patient.gif', N'patients.gif', 1)
SET IDENTITY_INSERT [dbo].[PatientMapSpecialtyIcon] OFF
/****** Object:  Table [dbo].[ImportInformation]    Script Date: 06/18/2015 12:04:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ImportInformation]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ImportInformation](
	[importEntityTypeString] [nvarchar](40) NOT NULL,
	[selectStatement] [nvarchar](1000) NULL,
	[dataSourceId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[importEntityTypeString] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[ImportInformation] ([importEntityTypeString], [selectStatement], [dataSourceId]) VALUES (N'Consultant', N'SELECT DISTINCT 
CAST(OP.[clinicianID] AS nvarchar(20)) AS ''Code''
  ,CAST(CL.familyname AS nvarchar(25)) AS ''Surname''
  ,CAST(CL.givenname AS nvarchar(20)) AS ''FirstGivenName''
	,CAST(CL.middleInitialorName AS nvarchar(20)) AS ''SecondGivenName''
		,'''' AS ''ThirdGivenName''
	,CASE WHEN CL.title = ''Not Specified'' THEN '''' ELSE CAST(CL.title AS nvarchar(5)) END AS ''Title''
  FROM [ACTPAS_CDR_VIEWS].[dbo].[Orion_outpatients] OP
  INNER JOIN [ACTPAS_CDR_VIEWS].[dbo].[Orion_Clinicians] CL on OP.clinicianID = CL.ClinicianID
  where outpatientClinicId like ''%wic%''', 2)
INSERT [dbo].[ImportInformation] ([importEntityTypeString], [selectStatement], [dataSourceId]) VALUES (N'ConsultantSpecialtyFacilityLink', N'', 2)
INSERT [dbo].[ImportInformation] ([importEntityTypeString], [selectStatement], [dataSourceId]) VALUES (N'Location', N'', 2)
INSERT [dbo].[ImportInformation] ([importEntityTypeString], [selectStatement], [dataSourceId]) VALUES (N'Specialty', N'', 2)
/****** Object:  Table [dbo].[Filter]    Script Date: 06/18/2015 12:04:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Filter]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Filter](
	[filterId] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[description] [nvarchar](1000) NULL,
	[displayType] [nvarchar](1) NOT NULL,
	[refreshOptions] [nchar](1) NOT NULL,
	[locationFilter] [nchar](1) NOT NULL,
	[dynamicFilter] [nchar](1) NOT NULL,
	[dynamicOptionSql] [nvarchar](1000) NULL,
	[dynamicActionSql] [nvarchar](1000) NULL,
	[dataSourceId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[filterId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[Filter] ON
INSERT [dbo].[Filter] ([filterId], [name], [description], [displayType], [refreshOptions], [locationFilter], [dynamicFilter], [dynamicOptionSql], [dynamicActionSql], [dataSourceId]) VALUES (1, N'Age', N'This is a sample Filter that ships with cWhiteboard', N'S', N'N', N'N', N'N', NULL, NULL, NULL)
INSERT [dbo].[Filter] ([filterId], [name], [description], [displayType], [refreshOptions], [locationFilter], [dynamicFilter], [dynamicOptionSql], [dynamicActionSql], [dataSourceId]) VALUES (2, N'Area', N'This is a sample Filter that ships with cWhiteboard', N'S', N'N', N'Y', N'Y', N'SELECT areaId AS code, name AS description FROM Area WHERE siteid = <%=siteId%> ORDER BY description', N'siteArea.areaId = <%=code%> OR (siteCachePrevLocation.areaId = <%=code%> AND siteCache.siteDepartedDttm IS NOT NULL)', NULL)
INSERT [dbo].[Filter] ([filterId], [name], [description], [displayType], [refreshOptions], [locationFilter], [dynamicFilter], [dynamicOptionSql], [dynamicActionSql], [dataSourceId]) VALUES (3, N'Showing', N'This is a sample Filter that ships with cWhiteboard', N'R', N'N', N'N', N'N', NULL, NULL, NULL)
INSERT [dbo].[Filter] ([filterId], [name], [description], [displayType], [refreshOptions], [locationFilter], [dynamicFilter], [dynamicOptionSql], [dynamicActionSql], [dataSourceId]) VALUES (4, N'Unlimited Specialty Filter', N'This is a sample Filter that ships with cWhiteboard (All specialties will be displayed)', N'S', N'N', N'N', N'Y', N'SELECT specialty.specialtyId, specialty.description FROM Specialty specialty, SpecialtyFacilityLink specialtyFacilityLink WHERE specialty.specialtyId = specialtyFacilityLink.specialtyId AND specialtyFacilityLink.facilityId = <%=facilityId%> ORDER BY specialty.description', N'siteCache.specialtyId = <%=code%>', NULL)
INSERT [dbo].[Filter] ([filterId], [name], [description], [displayType], [refreshOptions], [locationFilter], [dynamicFilter], [dynamicOptionSql], [dynamicActionSql], [dataSourceId]) VALUES (5, N'Cache Limited Specialty Filter', N'This is a sample Filter that ships with cWhiteboard (Only specialties that are assigned to patients will be displayed)', N'S', N'Y', N'N', N'Y', N'SELECT DISTINCT specialty.specialtyId, specialty.description FROM Specialty specialty, SpecialtyFacilityLink specialtyFacilityLink, Cache cache WHERE specialty.specialtyId = specialtyFacilityLink.specialtyId AND specialty.specialtyId = cache.specialtyId AND specialtyFacilityLink.facilityId = <%=facilityId%> ORDER BY specialty.description', N'siteCache.specialtyId = <%=code%>', NULL)
INSERT [dbo].[Filter] ([filterId], [name], [description], [displayType], [refreshOptions], [locationFilter], [dynamicFilter], [dynamicOptionSql], [dynamicActionSql], [dataSourceId]) VALUES (6, N'Assigned Doctor', N'This is a sample Filter that ships with cWhiteboard', N'S', N'Y', N'N', N'Y', N'SELECT DISTINCT doctor.doctorId AS code, doctor.givenName + '' '' + doctor.surname AS description FROM Cache cache, Doctor doctor WHERE doctor.doctorId = cache.assignedDoctorId AND cache.siteId = <%=siteId%> ORDER BY description', N'siteCache.assignedDoctorId = <%=code%>', NULL)
INSERT [dbo].[Filter] ([filterId], [name], [description], [displayType], [refreshOptions], [locationFilter], [dynamicFilter], [dynamicOptionSql], [dynamicActionSql], [dataSourceId]) VALUES (7, N'Assigned Nurse', N'This is a sample Filter that ships with cWhiteboard', N'S', N'Y', N'N', N'Y', N'SELECT DISTINCT nurse.nurseId AS code, nurse.givenName + '' '' + nurse.surname AS description FROM Cache cache, Nurse nurse WHERE nurse.nurseId = cache.assignedNurseId AND cache.siteId = <%=siteId%> ORDER BY description', N'siteCache.assignedNurseId = <%=code%>', NULL)
INSERT [dbo].[Filter] ([filterId], [name], [description], [displayType], [refreshOptions], [locationFilter], [dynamicFilter], [dynamicOptionSql], [dynamicActionSql], [dataSourceId]) VALUES (8, N'Nurse Practitioner', N'', N'S', N'N', N'N', N'Y', N'SELECT DISTINCT Consultant.consultantId AS code, Consultant.firstGivenName + '' '' + Consultant.surname AS description 
FROM Cache cache, Consultant consultant 
WHERE Consultant.consultantId = cache.assignedConsultantId
AND cache.siteId = <%=siteId%> 
ORDER BY description', N'siteCache.assignedConsultantId = <%=code%>', 3)
SET IDENTITY_INSERT [dbo].[Filter] OFF
/****** Object:  Table [dbo].[ExternalPatientId]    Script Date: 06/18/2015 12:04:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ExternalPatientId]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ExternalPatientId](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[externalPatientId] [nvarchar](20) NOT NULL,
	[primaryId] [nchar](1) NOT NULL,
	[patientId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[DiagnosisSearchEnable]    Script Date: 06/18/2015 12:04:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DiagnosisSearchEnable]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DiagnosisSearchEnable](
	[diagnosisSearchEnableId] [int] IDENTITY(1,1) NOT NULL,
	[codingSubset] [nvarchar](50) NOT NULL,
	[enableTransfer] [nchar](1) NULL,
	[enableSelfDischarge] [nchar](1) NULL,
	[enableAdmit] [nchar](1) NULL,
	[specialtyId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[diagnosisSearchEnableId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Diagnosis]    Script Date: 06/18/2015 12:04:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Diagnosis]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Diagnosis](
	[diagnosisId] [int] IDENTITY(1,1) NOT NULL,
	[episodeType] [nvarchar](50) NOT NULL,
	[encounterNumber] [nvarchar](50) NOT NULL,
	[actionType] [nvarchar](50) NOT NULL,
	[diagnosisCode] [nvarchar](10) NOT NULL,
	[diagnosisDescription] [nvarchar](255) NULL,
	[isPrimary] [nchar](1) NULL,
	[lastUpdatedDttm] [datetime] NULL,
	[specialtyId] [int] NOT NULL,
	[patientId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[diagnosisId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ViewActionButton]    Script Date: 06/18/2015 12:04:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ViewActionButton]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ViewActionButton](
	[viewActionButtonId] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](50) NULL,
	[actionButtonOrder] [int] NULL,
	[viewId] [int] NULL,
	[actionButtonId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[viewActionButtonId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[ViewActionButton] ON
INSERT [dbo].[ViewActionButton] ([viewActionButtonId], [title], [actionButtonOrder], [viewId], [actionButtonId]) VALUES (4, N'Nurse Handover', 0, 3, 2)
INSERT [dbo].[ViewActionButton] ([viewActionButtonId], [title], [actionButtonOrder], [viewId], [actionButtonId]) VALUES (5, N'Nurse Handover', 0, 2, 2)
SET IDENTITY_INSERT [dbo].[ViewActionButton] OFF
/****** Object:  Table [dbo].[Result]    Script Date: 06/18/2015 12:04:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Result]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Result](
	[encounterNumber] [nvarchar](20) NOT NULL,
	[patientId] [int] NOT NULL,
	[lastUpdateDttm] [datetime] NOT NULL CONSTRAINT [DF_Result_LastUpdateDttm]  DEFAULT (getdate()),
	[biochemistryColor] [nvarchar](20) NULL,
	[biochemistryInitial] [nchar](1) NULL,
	[haematologyColor] [nvarchar](20) NULL,
	[haematologyInitial] [nchar](1) NULL,
	[microbiologyColor] [nvarchar](20) NULL,
	[microbiologyInitial] [nchar](1) NULL,
	[radiologyStatus] [nvarchar](1) NULL,
	[otherColor] [nvarchar](20) NULL,
	[otherInitial] [nchar](1) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SpecialtyFacilityLink]    Script Date: 06/18/2015 12:04:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SpecialtyFacilityLink]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SpecialtyFacilityLink](
	[specialtyFacilityLinkId] [int] IDENTITY(1,1) NOT NULL,
	[facilityId] [int] NOT NULL,
	[specialtyId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[specialtyFacilityLinkId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[SpecialtyFacilityLink] ON
INSERT [dbo].[SpecialtyFacilityLink] ([specialtyFacilityLinkId], [facilityId], [specialtyId]) VALUES (1, 2, 1)
SET IDENTITY_INSERT [dbo].[SpecialtyFacilityLink] OFF
/****** Object:  Table [dbo].[ViewFilter]    Script Date: 06/18/2015 12:04:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ViewFilter]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ViewFilter](
	[viewFilterId] [int] IDENTITY(1,1) NOT NULL,
	[XPos] [int] NULL,
	[YPos] [int] NULL,
	[outerCellWidth] [nvarchar](10) NULL,
	[outerCellHeight] [nvarchar](10) NULL,
	[title] [nvarchar](30) NULL,
	[defaultValue] [nvarchar](100) NULL,
	[defaultValueDescription] [nvarchar](255) NULL,
	[labelCellWidth] [nvarchar](10) NULL,
	[labelAlignment] [nvarchar](10) NULL,
	[innerCellWidth] [nvarchar](10) NULL,
	[innerCellAlignment] [nvarchar](10) NULL,
	[controlCellWidth] [nvarchar](10) NULL,
	[controlAlignment] [nvarchar](10) NULL,
	[viewId] [int] NOT NULL,
	[filterId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[viewFilterId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[ViewFilter] ON
INSERT [dbo].[ViewFilter] ([viewFilterId], [XPos], [YPos], [outerCellWidth], [outerCellHeight], [title], [defaultValue], [defaultValueDescription], [labelCellWidth], [labelAlignment], [innerCellWidth], [innerCellAlignment], [controlCellWidth], [controlAlignment], [viewId], [filterId]) VALUES (7, NULL, NULL, NULL, NULL, N'Area', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2)
INSERT [dbo].[ViewFilter] ([viewFilterId], [XPos], [YPos], [outerCellWidth], [outerCellHeight], [title], [defaultValue], [defaultValueDescription], [labelCellWidth], [labelAlignment], [innerCellWidth], [innerCellAlignment], [controlCellWidth], [controlAlignment], [viewId], [filterId]) VALUES (8, 0, 0, NULL, NULL, N'Assigned Nurse', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 7)
INSERT [dbo].[ViewFilter] ([viewFilterId], [XPos], [YPos], [outerCellWidth], [outerCellHeight], [title], [defaultValue], [defaultValueDescription], [labelCellWidth], [labelAlignment], [innerCellWidth], [innerCellAlignment], [controlCellWidth], [controlAlignment], [viewId], [filterId]) VALUES (9, 1, 0, NULL, NULL, N'Nurse Practitioner', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 8)
INSERT [dbo].[ViewFilter] ([viewFilterId], [XPos], [YPos], [outerCellWidth], [outerCellHeight], [title], [defaultValue], [defaultValueDescription], [labelCellWidth], [labelAlignment], [innerCellWidth], [innerCellAlignment], [controlCellWidth], [controlAlignment], [viewId], [filterId]) VALUES (10, 0, 0, NULL, NULL, N'Assigned Nurse', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 7)
INSERT [dbo].[ViewFilter] ([viewFilterId], [XPos], [YPos], [outerCellWidth], [outerCellHeight], [title], [defaultValue], [defaultValueDescription], [labelCellWidth], [labelAlignment], [innerCellWidth], [innerCellAlignment], [controlCellWidth], [controlAlignment], [viewId], [filterId]) VALUES (11, 1, 0, NULL, NULL, N'Nurse Practitioner', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 8)
SET IDENTITY_INSERT [dbo].[ViewFilter] OFF
/****** Object:  Table [dbo].[SiteViewLink]    Script Date: 06/18/2015 12:04:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SiteViewLink]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SiteViewLink](
	[siteId] [int] NOT NULL,
	[viewId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[siteId] ASC,
	[viewId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[SiteViewLink] ([siteId], [viewId]) VALUES (2, 2)
INSERT [dbo].[SiteViewLink] ([siteId], [viewId]) VALUES (3, 3)
/****** Object:  Table [dbo].[LastUsedView]    Script Date: 06/18/2015 12:04:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LastUsedView]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LastUsedView](
	[lastUsedViewId] [int] IDENTITY(1,1) NOT NULL,
	[concertoId] [nvarchar](50) NOT NULL,
	[displayVacantLocations] [nchar](1) NOT NULL,
	[viewId] [int] NOT NULL,
	[siteId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[lastUsedViewId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[LastUsedView] ON
INSERT [dbo].[LastUsedView] ([lastUsedViewId], [concertoId], [displayVacantLocations], [viewId], [siteId]) VALUES (1, N'wade', N'N', 2, 2)
INSERT [dbo].[LastUsedView] ([lastUsedViewId], [concertoId], [displayVacantLocations], [viewId], [siteId]) VALUES (2, N'wade', N'N', 3, 3)
INSERT [dbo].[LastUsedView] ([lastUsedViewId], [concertoId], [displayVacantLocations], [viewId], [siteId]) VALUES (3, N'wic_1', N'N', 3, 3)
INSERT [dbo].[LastUsedView] ([lastUsedViewId], [concertoId], [displayVacantLocations], [viewId], [siteId]) VALUES (4, N'wic_1', N'N', 2, 2)
INSERT [dbo].[LastUsedView] ([lastUsedViewId], [concertoId], [displayVacantLocations], [viewId], [siteId]) VALUES (5, N'rabbani', N'N', 2, 2)
INSERT [dbo].[LastUsedView] ([lastUsedViewId], [concertoId], [displayVacantLocations], [viewId], [siteId]) VALUES (6, N'wic_admin', N'N', 2, 2)
INSERT [dbo].[LastUsedView] ([lastUsedViewId], [concertoId], [displayVacantLocations], [viewId], [siteId]) VALUES (7, N'rabbani', N'N', 3, 3)
INSERT [dbo].[LastUsedView] ([lastUsedViewId], [concertoId], [displayVacantLocations], [viewId], [siteId]) VALUES (8, N'wic_admin', N'N', 3, 3)
INSERT [dbo].[LastUsedView] ([lastUsedViewId], [concertoId], [displayVacantLocations], [viewId], [siteId]) VALUES (9, N'wic_admin', N'N', 3, 3)
INSERT [dbo].[LastUsedView] ([lastUsedViewId], [concertoId], [displayVacantLocations], [viewId], [siteId]) VALUES (10, N'nitten', N'N', 2, 2)
INSERT [dbo].[LastUsedView] ([lastUsedViewId], [concertoId], [displayVacantLocations], [viewId], [siteId]) VALUES (11, N'nitten', N'N', 3, 3)
SET IDENTITY_INSERT [dbo].[LastUsedView] OFF
/****** Object:  Table [dbo].[Area]    Script Date: 06/18/2015 12:04:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Area]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Area](
	[areaId] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[description] [nvarchar](1000) NULL,
	[siteId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[areaId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ConsultantSpecialtyFacLink]    Script Date: 06/18/2015 12:04:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ConsultantSpecialtyFacLink]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ConsultantSpecialtyFacLink](
	[consultantSpecialtyFacLinkId] [int] IDENTITY(1,1) NOT NULL,
	[specialtyFacilityLinkId] [int] NOT NULL,
	[consultantId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[consultantSpecialtyFacLinkId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[NurseAssignment]    Script Date: 06/18/2015 12:04:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NurseAssignment]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NurseAssignment](
	[nurseAssignmentId] [int] IDENTITY(1,1) NOT NULL,
	[nurseId] [int] NOT NULL,
	[siteId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[nurseAssignmentId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[NurseAssignment] ON
INSERT [dbo].[NurseAssignment] ([nurseAssignmentId], [nurseId], [siteId]) VALUES (1, 1, 2)
INSERT [dbo].[NurseAssignment] ([nurseAssignmentId], [nurseId], [siteId]) VALUES (2, 1, 3)
INSERT [dbo].[NurseAssignment] ([nurseAssignmentId], [nurseId], [siteId]) VALUES (3, 2, 2)
SET IDENTITY_INSERT [dbo].[NurseAssignment] OFF
/****** Object:  Table [dbo].[FilterOption]    Script Date: 06/18/2015 12:04:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FilterOption]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FilterOption](
	[filterOptionId] [int] IDENTITY(1,1) NOT NULL,
	[filterOptionName] [nvarchar](50) NOT NULL,
	[actionSql] [nvarchar](300) NULL,
	[optionOrder] [int] NOT NULL,
	[filterId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[filterOptionId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[FilterOption] ON
INSERT [dbo].[FilterOption] ([filterOptionId], [filterOptionName], [actionSql], [optionOrder], [filterId]) VALUES (1, N'Under 15', N'patient.DateOfBirth > DATEADD(YEAR, -15, GETDATE())', 0, 1)
INSERT [dbo].[FilterOption] ([filterOptionId], [filterOptionName], [actionSql], [optionOrder], [filterId]) VALUES (2, N'Over 15 (Inclusive)', N'patient.dateOfBirth < DATEADD(YEAR, -15, GETDATE())', 1, 1)
INSERT [dbo].[FilterOption] ([filterOptionId], [filterOptionName], [actionSql], [optionOrder], [filterId]) VALUES (3, N'Not Registered', N'externalPatientId.externalPatientId LIKE ''Temp:%''', 0, 3)
INSERT [dbo].[FilterOption] ([filterOptionId], [filterOptionName], [actionSql], [optionOrder], [filterId]) VALUES (4, N'Current', N'siteCache.siteDepartedDttm IS NULL AND siteCache.arrivedDttm IS NOT NULL', 1, 3)
INSERT [dbo].[FilterOption] ([filterOptionId], [filterOptionName], [actionSql], [optionOrder], [filterId]) VALUES (5, N'All', N'', 2, 3)
INSERT [dbo].[FilterOption] ([filterOptionId], [filterOptionName], [actionSql], [optionOrder], [filterId]) VALUES (6, N'Not Seen', N'siteCache.doctorSeenByDttm IS NULL AND siteCache.siteDepartedDttm IS NULL AND siteCache.arrivedDttm IS NOT NULL', 3, 3)
INSERT [dbo].[FilterOption] ([filterOptionId], [filterOptionName], [actionSql], [optionOrder], [filterId]) VALUES (7, N'Discharged', N'siteCache.siteDepartedDttm > getdate() - 3', 4, 3)
INSERT [dbo].[FilterOption] ([filterOptionId], [filterOptionName], [actionSql], [optionOrder], [filterId]) VALUES (8, N'Not Arrived', N'siteCache.arrivedDttm IS NULL', 5, 3)
SET IDENTITY_INSERT [dbo].[FilterOption] OFF
/****** Object:  Table [dbo].[PatientMapImage]    Script Date: 06/18/2015 12:04:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientMapImage]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PatientMapImage](
	[imageId] [int] IDENTITY(1,1) NOT NULL,
	[imageUrl] [nvarchar](255) NULL,
	[xPos] [int] NOT NULL,
	[yPos] [int] NOT NULL,
	[width] [int] NOT NULL,
	[height] [int] NOT NULL,
	[siteId] [int] NULL,
	[areaId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[imageId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[PatientMapImage] ON
INSERT [dbo].[PatientMapImage] ([imageId], [imageUrl], [xPos], [yPos], [width], [height], [siteId], [areaId]) VALUES (2, N'http://devapp057vs.test.act.gov.au/whiteboard/images/patientmap/WalkIN/BelconnenWalkInCenter_BluePrint.PNG', 0, 0, 1000, 940, 2, NULL)
INSERT [dbo].[PatientMapImage] ([imageId], [imageUrl], [xPos], [yPos], [width], [height], [siteId], [areaId]) VALUES (3, N'http://devapp057vs.test.act.gov.au/whiteboard/images/patientmap/WalkIN/TuggeranongWalkInCenter_BluePrint.PNG', 0, 0, 1000, 870, 3, NULL)
SET IDENTITY_INSERT [dbo].[PatientMapImage] OFF
/****** Object:  Table [dbo].[Location]    Script Date: 06/18/2015 12:04:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Location]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Location](
	[locationId] [int] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](20) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[singlePatientOnly] [nchar](1) NOT NULL,
	[unallocatedLocation] [nchar](1) NOT NULL,
	[siteId] [int] NOT NULL,
	[areaId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[locationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[Location] ON
INSERT [dbo].[Location] ([locationId], [code], [name], [singlePatientOnly], [unallocatedLocation], [siteId], [areaId]) VALUES (2, N'Unallocated', N'Unallocated', N'N', N'Y', 2, NULL)
INSERT [dbo].[Location] ([locationId], [code], [name], [singlePatientOnly], [unallocatedLocation], [siteId], [areaId]) VALUES (3, N'BHCTR10', N'Treatment Room 10', N'N', N'N', 2, NULL)
INSERT [dbo].[Location] ([locationId], [code], [name], [singlePatientOnly], [unallocatedLocation], [siteId], [areaId]) VALUES (4, N'BHCTR11', N'Treatment Room 11', N'N', N'N', 2, NULL)
INSERT [dbo].[Location] ([locationId], [code], [name], [singlePatientOnly], [unallocatedLocation], [siteId], [areaId]) VALUES (5, N'BHCTR12', N'Treatment Room 12', N'N', N'N', 2, NULL)
INSERT [dbo].[Location] ([locationId], [code], [name], [singlePatientOnly], [unallocatedLocation], [siteId], [areaId]) VALUES (6, N'BHCTR13', N'Treatment Room 13', N'N', N'N', 2, NULL)
INSERT [dbo].[Location] ([locationId], [code], [name], [singlePatientOnly], [unallocatedLocation], [siteId], [areaId]) VALUES (7, N'WICBHC', N'Waiting Room', N'N', N'N', 2, NULL)
INSERT [dbo].[Location] ([locationId], [code], [name], [singlePatientOnly], [unallocatedLocation], [siteId], [areaId]) VALUES (8, N'Unallocated', N'Unallocated', N'N', N'Y', 3, NULL)
INSERT [dbo].[Location] ([locationId], [code], [name], [singlePatientOnly], [unallocatedLocation], [siteId], [areaId]) VALUES (9, N'TCHCTR13', N'Treatment Room 13', N'N', N'N', 3, NULL)
INSERT [dbo].[Location] ([locationId], [code], [name], [singlePatientOnly], [unallocatedLocation], [siteId], [areaId]) VALUES (10, N'WICTHC', N'Waiting Room', N'N', N'N', 3, NULL)
INSERT [dbo].[Location] ([locationId], [code], [name], [singlePatientOnly], [unallocatedLocation], [siteId], [areaId]) VALUES (11, N'TCHCTR14', N'Treatment Room 14', N'N', N'N', 3, NULL)
INSERT [dbo].[Location] ([locationId], [code], [name], [singlePatientOnly], [unallocatedLocation], [siteId], [areaId]) VALUES (12, N'TCHCTR15', N'Treatment Room 15', N'N', N'N', 3, NULL)
INSERT [dbo].[Location] ([locationId], [code], [name], [singlePatientOnly], [unallocatedLocation], [siteId], [areaId]) VALUES (13, N'TCHCTR16', N'Treatment Room 16', N'N', N'N', 3, NULL)
SET IDENTITY_INSERT [dbo].[Location] OFF
/****** Object:  Table [dbo].[DoctorConsultantLink]    Script Date: 06/18/2015 12:04:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DoctorConsultantLink]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DoctorConsultantLink](
	[doctorConsultantLinkId] [int] IDENTITY(1,1) NOT NULL,
	[consultantSpecialtyFacLinkId] [int] NOT NULL,
	[doctorId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[doctorConsultantLinkId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Cache]    Script Date: 06/18/2015 12:04:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cache]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Cache](
	[cacheNumber] [int] IDENTITY(1,1) NOT NULL,
	[episodeType] [nvarchar](10) NOT NULL,
	[encounterNumber] [nvarchar](20) NOT NULL,
	[stayReferenceNumber] [nvarchar](15) NULL,
	[patientAlert] [nvarchar](500) NULL,
	[nameSimilarityFlag] [nvarchar](1) NULL,
	[reAdmissionWarningFlag] [nvarchar](1) NULL,
	[currentStatus] [nvarchar](50) NULL,
	[currentStatusDttm] [datetime] NOT NULL,
	[presentingComplaint] [nvarchar](512) NULL,
	[arrivedDttm] [datetime] NULL,
	[expectedArrivalDttm] [datetime] NULL,
	[registrationDttm] [datetime] NOT NULL,
	[triagedDttm] [datetime] NULL,
	[triageCategory] [nvarchar](20) NULL,
	[doctorSeenByDttm] [datetime] NULL,
	[enableRemoveDoctorSeenBy] [nchar](1) NOT NULL,
	[nurseSeenByDttm] [datetime] NULL,
	[enableRemoveNurseSeenBy] [nchar](1) NOT NULL,
	[dischargeType] [nvarchar](30) NULL,
	[dischargeClinicianType] [nvarchar](10) NULL,
	[dischargeClinicianId] [int] NULL,
	[medicalDischargeDttm] [datetime] NULL,
	[siteDepartedDttm] [datetime] NULL,
	[bedRequestStatus] [nvarchar](1) NULL,
	[cacheLastUpdateDttm] [datetime] NOT NULL,
	[transactionDttm] [datetime] NOT NULL,
	[aaeDischargeMethodType] [nvarchar](30) NULL,
	[aaeDischargeDestinationType] [nvarchar](30) NULL,
	[seenByDoctorId] [int] NULL,
	[siteId] [int] NOT NULL,
	[assignedDoctorId] [int] NULL,
	[specialtyId] [int] NOT NULL,
	[assignedNurseId] [int] NULL,
	[assignedConsultantId] [int] NULL,
	[seenByNurseId] [int] NULL,
	[treatmentProtocolId] [int] NULL,
	[patientId] [int] NOT NULL,
	[locationId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cacheNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PatientMapCubicle]    Script Date: 06/18/2015 12:04:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientMapCubicle]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PatientMapCubicle](
	[cubicleId] [int] IDENTITY(1,1) NOT NULL,
	[linkedAreaId] [int] NULL,
	[locationId] [int] NULL,
	[imageId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[cubicleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[PatientMapCubicle] ON
INSERT [dbo].[PatientMapCubicle] ([cubicleId], [linkedAreaId], [locationId], [imageId]) VALUES (1, NULL, 6, 2)
INSERT [dbo].[PatientMapCubicle] ([cubicleId], [linkedAreaId], [locationId], [imageId]) VALUES (2, NULL, 5, 2)
INSERT [dbo].[PatientMapCubicle] ([cubicleId], [linkedAreaId], [locationId], [imageId]) VALUES (3, NULL, 4, 2)
INSERT [dbo].[PatientMapCubicle] ([cubicleId], [linkedAreaId], [locationId], [imageId]) VALUES (4, NULL, 3, 2)
INSERT [dbo].[PatientMapCubicle] ([cubicleId], [linkedAreaId], [locationId], [imageId]) VALUES (5, NULL, 7, 2)
INSERT [dbo].[PatientMapCubicle] ([cubicleId], [linkedAreaId], [locationId], [imageId]) VALUES (6, NULL, 13, 3)
INSERT [dbo].[PatientMapCubicle] ([cubicleId], [linkedAreaId], [locationId], [imageId]) VALUES (8, NULL, 12, 3)
INSERT [dbo].[PatientMapCubicle] ([cubicleId], [linkedAreaId], [locationId], [imageId]) VALUES (9, NULL, 11, 3)
INSERT [dbo].[PatientMapCubicle] ([cubicleId], [linkedAreaId], [locationId], [imageId]) VALUES (10, NULL, 9, 3)
INSERT [dbo].[PatientMapCubicle] ([cubicleId], [linkedAreaId], [locationId], [imageId]) VALUES (11, NULL, 10, 3)
SET IDENTITY_INSERT [dbo].[PatientMapCubicle] OFF
/****** Object:  StoredProcedure [dbo].[UpdateDischarge]    Script Date: 06/18/2015 12:04:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateDischarge]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- Update Discharge Stored procedure called by Rhapsody
CREATE PROCEDURE [dbo].[UpdateDischarge] (
	@encounter_nbr varchar(50),
	@carer_ident varchar(50),
	@carer_type varchar(50),
	@discharge_type varchar(50),
	@medical_discharge_dttm datetime,
	@physical_discharge_dttm datetime
) AS

IF @physical_discharge_dttm is null or @physical_discharge_dttm = ''''	-- medical discharge
	UPDATE Cache SET 
	currentStatus = ''Disch'',
	currentStatusDttm = @medical_discharge_dttm,
	dischargeClinicianId = @carer_ident,
	dischargeClinicianType = @carer_type,
	dischargeType = @discharge_type,
	medicalDischargeDttm = @medical_discharge_dttm,
	enableRemoveDoctorSeenBy = ''N'',
	enableRemoveNurseSeenBy = ''N'',
	cacheLastUpdateDttm = GETDATE()
	WHERE encounterNumber = @encounter_nbr
ELSE
	UPDATE Cache SET 
	currentStatus = ''Disch'',
	currentStatusDttm = @physical_discharge_dttm,
	dischargeClinicianId = @carer_ident,
	dischargeClinicianType = @carer_type,
	dischargeType = @discharge_type,
	medicalDischargeDttm = @medical_discharge_dttm,
	siteDepartedDttm = @physical_discharge_dttm,
	enableRemoveDoctorSeenBy = ''N'',
	enableRemoveNurseSeenBy = ''N'',
	cacheLastUpdateDttm = GETDATE()
	WHERE encounterNumber = @encounter_nbr;
' 
END
GO
/****** Object:  Table [dbo].[PatientMapCubicleCoordinate]    Script Date: 06/18/2015 12:04:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientMapCubicleCoordinate]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PatientMapCubicleCoordinate](
	[sortOrder] [int] NOT NULL,
	[xPos] [int] NOT NULL,
	[yPos] [int] NOT NULL,
	[cubicleId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cubicleId] ASC,
	[sortOrder] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[PatientMapCubicleCoordinate] ([sortOrder], [xPos], [yPos], [cubicleId]) VALUES (1, 260, 20, 1)
INSERT [dbo].[PatientMapCubicleCoordinate] ([sortOrder], [xPos], [yPos], [cubicleId]) VALUES (2, 172, 103, 1)
INSERT [dbo].[PatientMapCubicleCoordinate] ([sortOrder], [xPos], [yPos], [cubicleId]) VALUES (3, 285, 183, 1)
INSERT [dbo].[PatientMapCubicleCoordinate] ([sortOrder], [xPos], [yPos], [cubicleId]) VALUES (4, 373, 88, 1)
INSERT [dbo].[PatientMapCubicleCoordinate] ([sortOrder], [xPos], [yPos], [cubicleId]) VALUES (5, 260, 21, 1)
INSERT [dbo].[PatientMapCubicleCoordinate] ([sortOrder], [xPos], [yPos], [cubicleId]) VALUES (1, 383, 99, 2)
INSERT [dbo].[PatientMapCubicleCoordinate] ([sortOrder], [xPos], [yPos], [cubicleId]) VALUES (2, 296, 190, 2)
INSERT [dbo].[PatientMapCubicleCoordinate] ([sortOrder], [xPos], [yPos], [cubicleId]) VALUES (3, 395, 256, 2)
INSERT [dbo].[PatientMapCubicleCoordinate] ([sortOrder], [xPos], [yPos], [cubicleId]) VALUES (4, 483, 174, 2)
INSERT [dbo].[PatientMapCubicleCoordinate] ([sortOrder], [xPos], [yPos], [cubicleId]) VALUES (5, 384, 98, 2)
INSERT [dbo].[PatientMapCubicleCoordinate] ([sortOrder], [xPos], [yPos], [cubicleId]) VALUES (1, 487, 182, 3)
INSERT [dbo].[PatientMapCubicleCoordinate] ([sortOrder], [xPos], [yPos], [cubicleId]) VALUES (2, 493, 179, 3)
INSERT [dbo].[PatientMapCubicleCoordinate] ([sortOrder], [xPos], [yPos], [cubicleId]) VALUES (3, 407, 263, 3)
INSERT [dbo].[PatientMapCubicleCoordinate] ([sortOrder], [xPos], [yPos], [cubicleId]) VALUES (4, 489, 301, 3)
INSERT [dbo].[PatientMapCubicleCoordinate] ([sortOrder], [xPos], [yPos], [cubicleId]) VALUES (5, 605, 260, 3)
INSERT [dbo].[PatientMapCubicleCoordinate] ([sortOrder], [xPos], [yPos], [cubicleId]) VALUES (6, 498, 183, 3)
INSERT [dbo].[PatientMapCubicleCoordinate] ([sortOrder], [xPos], [yPos], [cubicleId]) VALUES (1, 626, 273, 4)
INSERT [dbo].[PatientMapCubicleCoordinate] ([sortOrder], [xPos], [yPos], [cubicleId]) VALUES (2, 544, 347, 4)
INSERT [dbo].[PatientMapCubicleCoordinate] ([sortOrder], [xPos], [yPos], [cubicleId]) VALUES (3, 659, 437, 4)
INSERT [dbo].[PatientMapCubicleCoordinate] ([sortOrder], [xPos], [yPos], [cubicleId]) VALUES (4, 735, 370, 4)
INSERT [dbo].[PatientMapCubicleCoordinate] ([sortOrder], [xPos], [yPos], [cubicleId]) VALUES (5, 625, 279, 4)
INSERT [dbo].[PatientMapCubicleCoordinate] ([sortOrder], [xPos], [yPos], [cubicleId]) VALUES (1, 587, 458, 5)
INSERT [dbo].[PatientMapCubicleCoordinate] ([sortOrder], [xPos], [yPos], [cubicleId]) VALUES (2, 581, 528, 5)
INSERT [dbo].[PatientMapCubicleCoordinate] ([sortOrder], [xPos], [yPos], [cubicleId]) VALUES (3, 733, 528, 5)
INSERT [dbo].[PatientMapCubicleCoordinate] ([sortOrder], [xPos], [yPos], [cubicleId]) VALUES (1, 63, 59, 6)
INSERT [dbo].[PatientMapCubicleCoordinate] ([sortOrder], [xPos], [yPos], [cubicleId]) VALUES (2, 279, 59, 6)
INSERT [dbo].[PatientMapCubicleCoordinate] ([sortOrder], [xPos], [yPos], [cubicleId]) VALUES (3, 282, 248, 6)
INSERT [dbo].[PatientMapCubicleCoordinate] ([sortOrder], [xPos], [yPos], [cubicleId]) VALUES (4, 67, 253, 6)
INSERT [dbo].[PatientMapCubicleCoordinate] ([sortOrder], [xPos], [yPos], [cubicleId]) VALUES (5, 64, 60, 6)
INSERT [dbo].[PatientMapCubicleCoordinate] ([sortOrder], [xPos], [yPos], [cubicleId]) VALUES (1, 312, 53, 8)
INSERT [dbo].[PatientMapCubicleCoordinate] ([sortOrder], [xPos], [yPos], [cubicleId]) VALUES (2, 500, 56, 8)
INSERT [dbo].[PatientMapCubicleCoordinate] ([sortOrder], [xPos], [yPos], [cubicleId]) VALUES (3, 507, 234, 8)
INSERT [dbo].[PatientMapCubicleCoordinate] ([sortOrder], [xPos], [yPos], [cubicleId]) VALUES (4, 312, 248, 8)
INSERT [dbo].[PatientMapCubicleCoordinate] ([sortOrder], [xPos], [yPos], [cubicleId]) VALUES (1, 525, 61, 9)
INSERT [dbo].[PatientMapCubicleCoordinate] ([sortOrder], [xPos], [yPos], [cubicleId]) VALUES (2, 726, 62, 9)
INSERT [dbo].[PatientMapCubicleCoordinate] ([sortOrder], [xPos], [yPos], [cubicleId]) VALUES (3, 719, 277, 9)
INSERT [dbo].[PatientMapCubicleCoordinate] ([sortOrder], [xPos], [yPos], [cubicleId]) VALUES (4, 529, 222, 9)
INSERT [dbo].[PatientMapCubicleCoordinate] ([sortOrder], [xPos], [yPos], [cubicleId]) VALUES (5, 529, 64, 9)
INSERT [dbo].[PatientMapCubicleCoordinate] ([sortOrder], [xPos], [yPos], [cubicleId]) VALUES (1, 105, 381, 10)
INSERT [dbo].[PatientMapCubicleCoordinate] ([sortOrder], [xPos], [yPos], [cubicleId]) VALUES (2, 225, 377, 10)
INSERT [dbo].[PatientMapCubicleCoordinate] ([sortOrder], [xPos], [yPos], [cubicleId]) VALUES (3, 216, 549, 10)
INSERT [dbo].[PatientMapCubicleCoordinate] ([sortOrder], [xPos], [yPos], [cubicleId]) VALUES (4, 92, 545, 10)
INSERT [dbo].[PatientMapCubicleCoordinate] ([sortOrder], [xPos], [yPos], [cubicleId]) VALUES (5, 107, 387, 10)
INSERT [dbo].[PatientMapCubicleCoordinate] ([sortOrder], [xPos], [yPos], [cubicleId]) VALUES (1, 241, 284, 11)
INSERT [dbo].[PatientMapCubicleCoordinate] ([sortOrder], [xPos], [yPos], [cubicleId]) VALUES (2, 334, 278, 11)
INSERT [dbo].[PatientMapCubicleCoordinate] ([sortOrder], [xPos], [yPos], [cubicleId]) VALUES (3, 328, 354, 11)
INSERT [dbo].[PatientMapCubicleCoordinate] ([sortOrder], [xPos], [yPos], [cubicleId]) VALUES (4, 235, 354, 11)
INSERT [dbo].[PatientMapCubicleCoordinate] ([sortOrder], [xPos], [yPos], [cubicleId]) VALUES (5, 240, 282, 11)
/****** Object:  Table [dbo].[CacheTableHistory]    Script Date: 06/18/2015 12:04:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CacheTableHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CacheTableHistory](
	[cacheTableHistoryId] [int] IDENTITY(1,1) NOT NULL,
	[lastPerformedAction] [nvarchar](40) NULL,
	[enableRemoveDoctorSeenBy] [nchar](1) NULL,
	[enableRemoveNurseSeenBy] [nchar](1) NULL,
	[currentStatus] [nvarchar](50) NULL,
	[dischargeType] [nvarchar](30) NULL,
	[locationId] [int] NULL,
	[assignedConsultantId] [int] NULL,
	[cacheNumber] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cacheTableHistoryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  ForeignKey [FK_ActButtonParam_ActionButton]    Script Date: 06/18/2015 12:04:35 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ActButtonParam_ActionButton]') AND parent_object_id = OBJECT_ID(N'[dbo].[ActionButtonParameter]'))
ALTER TABLE [dbo].[ActionButtonParameter]  WITH CHECK ADD  CONSTRAINT [FK_ActButtonParam_ActionButton] FOREIGN KEY([actionButtonId])
REFERENCES [dbo].[ActionButton] ([actionButtonId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ActButtonParam_ActionButton]') AND parent_object_id = OBJECT_ID(N'[dbo].[ActionButtonParameter]'))
ALTER TABLE [dbo].[ActionButtonParameter] CHECK CONSTRAINT [FK_ActButtonParam_ActionButton]
GO
/****** Object:  ForeignKey [FK_ActButtonParam_RefColumn]    Script Date: 06/18/2015 12:04:35 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ActButtonParam_RefColumn]') AND parent_object_id = OBJECT_ID(N'[dbo].[ActionButtonParameter]'))
ALTER TABLE [dbo].[ActionButtonParameter]  WITH CHECK ADD  CONSTRAINT [FK_ActButtonParam_RefColumn] FOREIGN KEY([referenceColumnId])
REFERENCES [dbo].[ReferenceColumn] ([referenceColumnId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ActButtonParam_RefColumn]') AND parent_object_id = OBJECT_ID(N'[dbo].[ActionButtonParameter]'))
ALTER TABLE [dbo].[ActionButtonParameter] CHECK CONSTRAINT [FK_ActButtonParam_RefColumn]
GO
/****** Object:  ForeignKey [FK_Area_Site]    Script Date: 06/18/2015 12:04:35 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Area_Site]') AND parent_object_id = OBJECT_ID(N'[dbo].[Area]'))
ALTER TABLE [dbo].[Area]  WITH CHECK ADD  CONSTRAINT [FK_Area_Site] FOREIGN KEY([siteId])
REFERENCES [dbo].[Site] ([siteId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Area_Site]') AND parent_object_id = OBJECT_ID(N'[dbo].[Area]'))
ALTER TABLE [dbo].[Area] CHECK CONSTRAINT [FK_Area_Site]
GO
/****** Object:  ForeignKey [FK_Cache_AssignedConsultant]    Script Date: 06/18/2015 12:04:35 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Cache_AssignedConsultant]') AND parent_object_id = OBJECT_ID(N'[dbo].[Cache]'))
ALTER TABLE [dbo].[Cache]  WITH CHECK ADD  CONSTRAINT [FK_Cache_AssignedConsultant] FOREIGN KEY([assignedConsultantId])
REFERENCES [dbo].[Consultant] ([consultantId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Cache_AssignedConsultant]') AND parent_object_id = OBJECT_ID(N'[dbo].[Cache]'))
ALTER TABLE [dbo].[Cache] CHECK CONSTRAINT [FK_Cache_AssignedConsultant]
GO
/****** Object:  ForeignKey [FK_Cache_AssignedDoctor]    Script Date: 06/18/2015 12:04:35 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Cache_AssignedDoctor]') AND parent_object_id = OBJECT_ID(N'[dbo].[Cache]'))
ALTER TABLE [dbo].[Cache]  WITH CHECK ADD  CONSTRAINT [FK_Cache_AssignedDoctor] FOREIGN KEY([assignedDoctorId])
REFERENCES [dbo].[Doctor] ([doctorId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Cache_AssignedDoctor]') AND parent_object_id = OBJECT_ID(N'[dbo].[Cache]'))
ALTER TABLE [dbo].[Cache] CHECK CONSTRAINT [FK_Cache_AssignedDoctor]
GO
/****** Object:  ForeignKey [FK_Cache_AssignedNurse]    Script Date: 06/18/2015 12:04:35 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Cache_AssignedNurse]') AND parent_object_id = OBJECT_ID(N'[dbo].[Cache]'))
ALTER TABLE [dbo].[Cache]  WITH CHECK ADD  CONSTRAINT [FK_Cache_AssignedNurse] FOREIGN KEY([assignedNurseId])
REFERENCES [dbo].[Nurse] ([nurseId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Cache_AssignedNurse]') AND parent_object_id = OBJECT_ID(N'[dbo].[Cache]'))
ALTER TABLE [dbo].[Cache] CHECK CONSTRAINT [FK_Cache_AssignedNurse]
GO
/****** Object:  ForeignKey [FK_Cache_Location]    Script Date: 06/18/2015 12:04:35 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Cache_Location]') AND parent_object_id = OBJECT_ID(N'[dbo].[Cache]'))
ALTER TABLE [dbo].[Cache]  WITH CHECK ADD  CONSTRAINT [FK_Cache_Location] FOREIGN KEY([locationId])
REFERENCES [dbo].[Location] ([locationId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Cache_Location]') AND parent_object_id = OBJECT_ID(N'[dbo].[Cache]'))
ALTER TABLE [dbo].[Cache] CHECK CONSTRAINT [FK_Cache_Location]
GO
/****** Object:  ForeignKey [FK_Cache_Patient]    Script Date: 06/18/2015 12:04:35 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Cache_Patient]') AND parent_object_id = OBJECT_ID(N'[dbo].[Cache]'))
ALTER TABLE [dbo].[Cache]  WITH CHECK ADD  CONSTRAINT [FK_Cache_Patient] FOREIGN KEY([patientId])
REFERENCES [dbo].[Patient] ([patientId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Cache_Patient]') AND parent_object_id = OBJECT_ID(N'[dbo].[Cache]'))
ALTER TABLE [dbo].[Cache] CHECK CONSTRAINT [FK_Cache_Patient]
GO
/****** Object:  ForeignKey [FK_Cache_SeenByDoctor]    Script Date: 06/18/2015 12:04:35 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Cache_SeenByDoctor]') AND parent_object_id = OBJECT_ID(N'[dbo].[Cache]'))
ALTER TABLE [dbo].[Cache]  WITH CHECK ADD  CONSTRAINT [FK_Cache_SeenByDoctor] FOREIGN KEY([seenByDoctorId])
REFERENCES [dbo].[Doctor] ([doctorId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Cache_SeenByDoctor]') AND parent_object_id = OBJECT_ID(N'[dbo].[Cache]'))
ALTER TABLE [dbo].[Cache] CHECK CONSTRAINT [FK_Cache_SeenByDoctor]
GO
/****** Object:  ForeignKey [FK_Cache_SeenByNurse]    Script Date: 06/18/2015 12:04:35 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Cache_SeenByNurse]') AND parent_object_id = OBJECT_ID(N'[dbo].[Cache]'))
ALTER TABLE [dbo].[Cache]  WITH CHECK ADD  CONSTRAINT [FK_Cache_SeenByNurse] FOREIGN KEY([seenByNurseId])
REFERENCES [dbo].[Nurse] ([nurseId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Cache_SeenByNurse]') AND parent_object_id = OBJECT_ID(N'[dbo].[Cache]'))
ALTER TABLE [dbo].[Cache] CHECK CONSTRAINT [FK_Cache_SeenByNurse]
GO
/****** Object:  ForeignKey [FK_Cache_Site]    Script Date: 06/18/2015 12:04:35 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Cache_Site]') AND parent_object_id = OBJECT_ID(N'[dbo].[Cache]'))
ALTER TABLE [dbo].[Cache]  WITH CHECK ADD  CONSTRAINT [FK_Cache_Site] FOREIGN KEY([siteId])
REFERENCES [dbo].[Site] ([siteId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Cache_Site]') AND parent_object_id = OBJECT_ID(N'[dbo].[Cache]'))
ALTER TABLE [dbo].[Cache] CHECK CONSTRAINT [FK_Cache_Site]
GO
/****** Object:  ForeignKey [FK_Cache_Specialty]    Script Date: 06/18/2015 12:04:35 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Cache_Specialty]') AND parent_object_id = OBJECT_ID(N'[dbo].[Cache]'))
ALTER TABLE [dbo].[Cache]  WITH CHECK ADD  CONSTRAINT [FK_Cache_Specialty] FOREIGN KEY([specialtyId])
REFERENCES [dbo].[Specialty] ([specialtyId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Cache_Specialty]') AND parent_object_id = OBJECT_ID(N'[dbo].[Cache]'))
ALTER TABLE [dbo].[Cache] CHECK CONSTRAINT [FK_Cache_Specialty]
GO
/****** Object:  ForeignKey [FK_Cache_TreatmentProtocol]    Script Date: 06/18/2015 12:04:35 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Cache_TreatmentProtocol]') AND parent_object_id = OBJECT_ID(N'[dbo].[Cache]'))
ALTER TABLE [dbo].[Cache]  WITH CHECK ADD  CONSTRAINT [FK_Cache_TreatmentProtocol] FOREIGN KEY([treatmentProtocolId])
REFERENCES [dbo].[TreatmentProtocol] ([treatmentProtocolId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Cache_TreatmentProtocol]') AND parent_object_id = OBJECT_ID(N'[dbo].[Cache]'))
ALTER TABLE [dbo].[Cache] CHECK CONSTRAINT [FK_Cache_TreatmentProtocol]
GO
/****** Object:  ForeignKey [FK_CacheTableHist_Consultant]    Script Date: 06/18/2015 12:04:35 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CacheTableHist_Consultant]') AND parent_object_id = OBJECT_ID(N'[dbo].[CacheTableHistory]'))
ALTER TABLE [dbo].[CacheTableHistory]  WITH CHECK ADD  CONSTRAINT [FK_CacheTableHist_Consultant] FOREIGN KEY([assignedConsultantId])
REFERENCES [dbo].[Consultant] ([consultantId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CacheTableHist_Consultant]') AND parent_object_id = OBJECT_ID(N'[dbo].[CacheTableHistory]'))
ALTER TABLE [dbo].[CacheTableHistory] CHECK CONSTRAINT [FK_CacheTableHist_Consultant]
GO
/****** Object:  ForeignKey [FK_CacheTableHist_Location]    Script Date: 06/18/2015 12:04:35 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CacheTableHist_Location]') AND parent_object_id = OBJECT_ID(N'[dbo].[CacheTableHistory]'))
ALTER TABLE [dbo].[CacheTableHistory]  WITH CHECK ADD  CONSTRAINT [FK_CacheTableHist_Location] FOREIGN KEY([locationId])
REFERENCES [dbo].[Location] ([locationId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CacheTableHist_Location]') AND parent_object_id = OBJECT_ID(N'[dbo].[CacheTableHistory]'))
ALTER TABLE [dbo].[CacheTableHistory] CHECK CONSTRAINT [FK_CacheTableHist_Location]
GO
/****** Object:  ForeignKey [FK_CacheTableHistory_Cache]    Script Date: 06/18/2015 12:04:35 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CacheTableHistory_Cache]') AND parent_object_id = OBJECT_ID(N'[dbo].[CacheTableHistory]'))
ALTER TABLE [dbo].[CacheTableHistory]  WITH CHECK ADD  CONSTRAINT [FK_CacheTableHistory_Cache] FOREIGN KEY([cacheNumber])
REFERENCES [dbo].[Cache] ([cacheNumber])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CacheTableHistory_Cache]') AND parent_object_id = OBJECT_ID(N'[dbo].[CacheTableHistory]'))
ALTER TABLE [dbo].[CacheTableHistory] CHECK CONSTRAINT [FK_CacheTableHistory_Cache]
GO
/****** Object:  ForeignKey [FK_ConSpecFacLink_Consultant]    Script Date: 06/18/2015 12:04:35 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ConSpecFacLink_Consultant]') AND parent_object_id = OBJECT_ID(N'[dbo].[ConsultantSpecialtyFacLink]'))
ALTER TABLE [dbo].[ConsultantSpecialtyFacLink]  WITH CHECK ADD  CONSTRAINT [FK_ConSpecFacLink_Consultant] FOREIGN KEY([consultantId])
REFERENCES [dbo].[Consultant] ([consultantId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ConSpecFacLink_Consultant]') AND parent_object_id = OBJECT_ID(N'[dbo].[ConsultantSpecialtyFacLink]'))
ALTER TABLE [dbo].[ConsultantSpecialtyFacLink] CHECK CONSTRAINT [FK_ConSpecFacLink_Consultant]
GO
/****** Object:  ForeignKey [FK_ConSpecFacLink_SpecFacLink]    Script Date: 06/18/2015 12:04:35 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ConSpecFacLink_SpecFacLink]') AND parent_object_id = OBJECT_ID(N'[dbo].[ConsultantSpecialtyFacLink]'))
ALTER TABLE [dbo].[ConsultantSpecialtyFacLink]  WITH CHECK ADD  CONSTRAINT [FK_ConSpecFacLink_SpecFacLink] FOREIGN KEY([specialtyFacilityLinkId])
REFERENCES [dbo].[SpecialtyFacilityLink] ([specialtyFacilityLinkId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ConSpecFacLink_SpecFacLink]') AND parent_object_id = OBJECT_ID(N'[dbo].[ConsultantSpecialtyFacLink]'))
ALTER TABLE [dbo].[ConsultantSpecialtyFacLink] CHECK CONSTRAINT [FK_ConSpecFacLink_SpecFacLink]
GO
/****** Object:  ForeignKey [FK_Diagnosis_Patient]    Script Date: 06/18/2015 12:04:36 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Diagnosis_Patient]') AND parent_object_id = OBJECT_ID(N'[dbo].[Diagnosis]'))
ALTER TABLE [dbo].[Diagnosis]  WITH CHECK ADD  CONSTRAINT [FK_Diagnosis_Patient] FOREIGN KEY([patientId])
REFERENCES [dbo].[Patient] ([patientId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Diagnosis_Patient]') AND parent_object_id = OBJECT_ID(N'[dbo].[Diagnosis]'))
ALTER TABLE [dbo].[Diagnosis] CHECK CONSTRAINT [FK_Diagnosis_Patient]
GO
/****** Object:  ForeignKey [FK_Diagnosis_Specialty]    Script Date: 06/18/2015 12:04:36 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Diagnosis_Specialty]') AND parent_object_id = OBJECT_ID(N'[dbo].[Diagnosis]'))
ALTER TABLE [dbo].[Diagnosis]  WITH CHECK ADD  CONSTRAINT [FK_Diagnosis_Specialty] FOREIGN KEY([specialtyId])
REFERENCES [dbo].[Specialty] ([specialtyId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Diagnosis_Specialty]') AND parent_object_id = OBJECT_ID(N'[dbo].[Diagnosis]'))
ALTER TABLE [dbo].[Diagnosis] CHECK CONSTRAINT [FK_Diagnosis_Specialty]
GO
/****** Object:  ForeignKey [FK_DiagSearchEnable_Specialty]    Script Date: 06/18/2015 12:04:36 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DiagSearchEnable_Specialty]') AND parent_object_id = OBJECT_ID(N'[dbo].[DiagnosisSearchEnable]'))
ALTER TABLE [dbo].[DiagnosisSearchEnable]  WITH CHECK ADD  CONSTRAINT [FK_DiagSearchEnable_Specialty] FOREIGN KEY([specialtyId])
REFERENCES [dbo].[Specialty] ([specialtyId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DiagSearchEnable_Specialty]') AND parent_object_id = OBJECT_ID(N'[dbo].[DiagnosisSearchEnable]'))
ALTER TABLE [dbo].[DiagnosisSearchEnable] CHECK CONSTRAINT [FK_DiagSearchEnable_Specialty]
GO
/****** Object:  ForeignKey [FK_DisplayColumn_PrimRefColumn]    Script Date: 06/18/2015 12:04:36 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DisplayColumn_PrimRefColumn]') AND parent_object_id = OBJECT_ID(N'[dbo].[DisplayColumn]'))
ALTER TABLE [dbo].[DisplayColumn]  WITH CHECK ADD  CONSTRAINT [FK_DisplayColumn_PrimRefColumn] FOREIGN KEY([primaryReferenceColumnId])
REFERENCES [dbo].[ReferenceColumn] ([referenceColumnId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DisplayColumn_PrimRefColumn]') AND parent_object_id = OBJECT_ID(N'[dbo].[DisplayColumn]'))
ALTER TABLE [dbo].[DisplayColumn] CHECK CONSTRAINT [FK_DisplayColumn_PrimRefColumn]
GO
/****** Object:  ForeignKey [FK_DocConLink_ConSpecFacLink]    Script Date: 06/18/2015 12:04:36 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DocConLink_ConSpecFacLink]') AND parent_object_id = OBJECT_ID(N'[dbo].[DoctorConsultantLink]'))
ALTER TABLE [dbo].[DoctorConsultantLink]  WITH CHECK ADD  CONSTRAINT [FK_DocConLink_ConSpecFacLink] FOREIGN KEY([consultantSpecialtyFacLinkId])
REFERENCES [dbo].[ConsultantSpecialtyFacLink] ([consultantSpecialtyFacLinkId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DocConLink_ConSpecFacLink]') AND parent_object_id = OBJECT_ID(N'[dbo].[DoctorConsultantLink]'))
ALTER TABLE [dbo].[DoctorConsultantLink] CHECK CONSTRAINT [FK_DocConLink_ConSpecFacLink]
GO
/****** Object:  ForeignKey [FK_DocConLink_Doctor]    Script Date: 06/18/2015 12:04:36 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DocConLink_Doctor]') AND parent_object_id = OBJECT_ID(N'[dbo].[DoctorConsultantLink]'))
ALTER TABLE [dbo].[DoctorConsultantLink]  WITH CHECK ADD  CONSTRAINT [FK_DocConLink_Doctor] FOREIGN KEY([doctorId])
REFERENCES [dbo].[Doctor] ([doctorId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DocConLink_Doctor]') AND parent_object_id = OBJECT_ID(N'[dbo].[DoctorConsultantLink]'))
ALTER TABLE [dbo].[DoctorConsultantLink] CHECK CONSTRAINT [FK_DocConLink_Doctor]
GO
/****** Object:  ForeignKey [FK_ExtPatientId_Patient]    Script Date: 06/18/2015 12:04:36 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ExtPatientId_Patient]') AND parent_object_id = OBJECT_ID(N'[dbo].[ExternalPatientId]'))
ALTER TABLE [dbo].[ExternalPatientId]  WITH CHECK ADD  CONSTRAINT [FK_ExtPatientId_Patient] FOREIGN KEY([patientId])
REFERENCES [dbo].[Patient] ([patientId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ExtPatientId_Patient]') AND parent_object_id = OBJECT_ID(N'[dbo].[ExternalPatientId]'))
ALTER TABLE [dbo].[ExternalPatientId] CHECK CONSTRAINT [FK_ExtPatientId_Patient]
GO
/****** Object:  ForeignKey [FK_Filter_DataSource]    Script Date: 06/18/2015 12:04:36 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Filter_DataSource]') AND parent_object_id = OBJECT_ID(N'[dbo].[Filter]'))
ALTER TABLE [dbo].[Filter]  WITH CHECK ADD  CONSTRAINT [FK_Filter_DataSource] FOREIGN KEY([dataSourceId])
REFERENCES [dbo].[DataSource] ([dataSourceId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Filter_DataSource]') AND parent_object_id = OBJECT_ID(N'[dbo].[Filter]'))
ALTER TABLE [dbo].[Filter] CHECK CONSTRAINT [FK_Filter_DataSource]
GO
/****** Object:  ForeignKey [FK_FilterOption_Filter]    Script Date: 06/18/2015 12:04:36 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FilterOption_Filter]') AND parent_object_id = OBJECT_ID(N'[dbo].[FilterOption]'))
ALTER TABLE [dbo].[FilterOption]  WITH CHECK ADD  CONSTRAINT [FK_FilterOption_Filter] FOREIGN KEY([filterId])
REFERENCES [dbo].[Filter] ([filterId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FilterOption_Filter]') AND parent_object_id = OBJECT_ID(N'[dbo].[FilterOption]'))
ALTER TABLE [dbo].[FilterOption] CHECK CONSTRAINT [FK_FilterOption_Filter]
GO
/****** Object:  ForeignKey [FK_ImportInfo_DataSource]    Script Date: 06/18/2015 12:04:36 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ImportInfo_DataSource]') AND parent_object_id = OBJECT_ID(N'[dbo].[ImportInformation]'))
ALTER TABLE [dbo].[ImportInformation]  WITH CHECK ADD  CONSTRAINT [FK_ImportInfo_DataSource] FOREIGN KEY([dataSourceId])
REFERENCES [dbo].[DataSource] ([dataSourceId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ImportInfo_DataSource]') AND parent_object_id = OBJECT_ID(N'[dbo].[ImportInformation]'))
ALTER TABLE [dbo].[ImportInformation] CHECK CONSTRAINT [FK_ImportInfo_DataSource]
GO
/****** Object:  ForeignKey [FK_LastUsedView_Site]    Script Date: 06/18/2015 12:04:36 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LastUsedView_Site]') AND parent_object_id = OBJECT_ID(N'[dbo].[LastUsedView]'))
ALTER TABLE [dbo].[LastUsedView]  WITH CHECK ADD  CONSTRAINT [FK_LastUsedView_Site] FOREIGN KEY([siteId])
REFERENCES [dbo].[Site] ([siteId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LastUsedView_Site]') AND parent_object_id = OBJECT_ID(N'[dbo].[LastUsedView]'))
ALTER TABLE [dbo].[LastUsedView] CHECK CONSTRAINT [FK_LastUsedView_Site]
GO
/****** Object:  ForeignKey [FK_LastUsedView_View]    Script Date: 06/18/2015 12:04:36 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LastUsedView_View]') AND parent_object_id = OBJECT_ID(N'[dbo].[LastUsedView]'))
ALTER TABLE [dbo].[LastUsedView]  WITH CHECK ADD  CONSTRAINT [FK_LastUsedView_View] FOREIGN KEY([viewId])
REFERENCES [dbo].[PresentationView] ([viewId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LastUsedView_View]') AND parent_object_id = OBJECT_ID(N'[dbo].[LastUsedView]'))
ALTER TABLE [dbo].[LastUsedView] CHECK CONSTRAINT [FK_LastUsedView_View]
GO
/****** Object:  ForeignKey [FK_Location_Area]    Script Date: 06/18/2015 12:04:36 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Location_Area]') AND parent_object_id = OBJECT_ID(N'[dbo].[Location]'))
ALTER TABLE [dbo].[Location]  WITH CHECK ADD  CONSTRAINT [FK_Location_Area] FOREIGN KEY([areaId])
REFERENCES [dbo].[Area] ([areaId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Location_Area]') AND parent_object_id = OBJECT_ID(N'[dbo].[Location]'))
ALTER TABLE [dbo].[Location] CHECK CONSTRAINT [FK_Location_Area]
GO
/****** Object:  ForeignKey [FK_Location_Site]    Script Date: 06/18/2015 12:04:36 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Location_Site]') AND parent_object_id = OBJECT_ID(N'[dbo].[Location]'))
ALTER TABLE [dbo].[Location]  WITH CHECK ADD  CONSTRAINT [FK_Location_Site] FOREIGN KEY([siteId])
REFERENCES [dbo].[Site] ([siteId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Location_Site]') AND parent_object_id = OBJECT_ID(N'[dbo].[Location]'))
ALTER TABLE [dbo].[Location] CHECK CONSTRAINT [FK_Location_Site]
GO
/****** Object:  ForeignKey [FK_NurseAssignment_Nurse]    Script Date: 06/18/2015 12:04:37 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_NurseAssignment_Nurse]') AND parent_object_id = OBJECT_ID(N'[dbo].[NurseAssignment]'))
ALTER TABLE [dbo].[NurseAssignment]  WITH CHECK ADD  CONSTRAINT [FK_NurseAssignment_Nurse] FOREIGN KEY([nurseId])
REFERENCES [dbo].[Nurse] ([nurseId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_NurseAssignment_Nurse]') AND parent_object_id = OBJECT_ID(N'[dbo].[NurseAssignment]'))
ALTER TABLE [dbo].[NurseAssignment] CHECK CONSTRAINT [FK_NurseAssignment_Nurse]
GO
/****** Object:  ForeignKey [FK_NurseAssignment_Site]    Script Date: 06/18/2015 12:04:37 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_NurseAssignment_Site]') AND parent_object_id = OBJECT_ID(N'[dbo].[NurseAssignment]'))
ALTER TABLE [dbo].[NurseAssignment]  WITH CHECK ADD  CONSTRAINT [FK_NurseAssignment_Site] FOREIGN KEY([siteId])
REFERENCES [dbo].[Site] ([siteId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_NurseAssignment_Site]') AND parent_object_id = OBJECT_ID(N'[dbo].[NurseAssignment]'))
ALTER TABLE [dbo].[NurseAssignment] CHECK CONSTRAINT [FK_NurseAssignment_Site]
GO
/****** Object:  ForeignKey [FK_PatMapCubicle_Image]    Script Date: 06/18/2015 12:04:37 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatMapCubicle_Image]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientMapCubicle]'))
ALTER TABLE [dbo].[PatientMapCubicle]  WITH CHECK ADD  CONSTRAINT [FK_PatMapCubicle_Image] FOREIGN KEY([imageId])
REFERENCES [dbo].[PatientMapImage] ([imageId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatMapCubicle_Image]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientMapCubicle]'))
ALTER TABLE [dbo].[PatientMapCubicle] CHECK CONSTRAINT [FK_PatMapCubicle_Image]
GO
/****** Object:  ForeignKey [FK_PatMapCubicle_LinkedArea]    Script Date: 06/18/2015 12:04:37 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatMapCubicle_LinkedArea]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientMapCubicle]'))
ALTER TABLE [dbo].[PatientMapCubicle]  WITH CHECK ADD  CONSTRAINT [FK_PatMapCubicle_LinkedArea] FOREIGN KEY([linkedAreaId])
REFERENCES [dbo].[Area] ([areaId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatMapCubicle_LinkedArea]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientMapCubicle]'))
ALTER TABLE [dbo].[PatientMapCubicle] CHECK CONSTRAINT [FK_PatMapCubicle_LinkedArea]
GO
/****** Object:  ForeignKey [FK_PatMapCubicle_Location]    Script Date: 06/18/2015 12:04:37 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatMapCubicle_Location]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientMapCubicle]'))
ALTER TABLE [dbo].[PatientMapCubicle]  WITH CHECK ADD  CONSTRAINT [FK_PatMapCubicle_Location] FOREIGN KEY([locationId])
REFERENCES [dbo].[Location] ([locationId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatMapCubicle_Location]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientMapCubicle]'))
ALTER TABLE [dbo].[PatientMapCubicle] CHECK CONSTRAINT [FK_PatMapCubicle_Location]
GO
/****** Object:  ForeignKey [FK_PatMapCubiCoord_PatMapCubi]    Script Date: 06/18/2015 12:04:37 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatMapCubiCoord_PatMapCubi]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientMapCubicleCoordinate]'))
ALTER TABLE [dbo].[PatientMapCubicleCoordinate]  WITH CHECK ADD  CONSTRAINT [FK_PatMapCubiCoord_PatMapCubi] FOREIGN KEY([cubicleId])
REFERENCES [dbo].[PatientMapCubicle] ([cubicleId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatMapCubiCoord_PatMapCubi]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientMapCubicleCoordinate]'))
ALTER TABLE [dbo].[PatientMapCubicleCoordinate] CHECK CONSTRAINT [FK_PatMapCubiCoord_PatMapCubi]
GO
/****** Object:  ForeignKey [FK_PatMapImage_Area]    Script Date: 06/18/2015 12:04:37 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatMapImage_Area]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientMapImage]'))
ALTER TABLE [dbo].[PatientMapImage]  WITH CHECK ADD  CONSTRAINT [FK_PatMapImage_Area] FOREIGN KEY([areaId])
REFERENCES [dbo].[Area] ([areaId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatMapImage_Area]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientMapImage]'))
ALTER TABLE [dbo].[PatientMapImage] CHECK CONSTRAINT [FK_PatMapImage_Area]
GO
/****** Object:  ForeignKey [FK_PatMapImage_Site]    Script Date: 06/18/2015 12:04:37 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatMapImage_Site]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientMapImage]'))
ALTER TABLE [dbo].[PatientMapImage]  WITH CHECK ADD  CONSTRAINT [FK_PatMapImage_Site] FOREIGN KEY([siteId])
REFERENCES [dbo].[Site] ([siteId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatMapImage_Site]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientMapImage]'))
ALTER TABLE [dbo].[PatientMapImage] CHECK CONSTRAINT [FK_PatMapImage_Site]
GO
/****** Object:  ForeignKey [FK_PatMapSpecIcon_Specialty]    Script Date: 06/18/2015 12:04:37 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatMapSpecIcon_Specialty]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientMapSpecialtyIcon]'))
ALTER TABLE [dbo].[PatientMapSpecialtyIcon]  WITH CHECK ADD  CONSTRAINT [FK_PatMapSpecIcon_Specialty] FOREIGN KEY([specialtyId])
REFERENCES [dbo].[Specialty] ([specialtyId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatMapSpecIcon_Specialty]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientMapSpecialtyIcon]'))
ALTER TABLE [dbo].[PatientMapSpecialtyIcon] CHECK CONSTRAINT [FK_PatMapSpecIcon_Specialty]
GO
/****** Object:  ForeignKey [FK_RefColumn_ActionButton]    Script Date: 06/18/2015 12:04:37 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RefColumn_ActionButton]') AND parent_object_id = OBJECT_ID(N'[dbo].[ReferenceColumn]'))
ALTER TABLE [dbo].[ReferenceColumn]  WITH CHECK ADD  CONSTRAINT [FK_RefColumn_ActionButton] FOREIGN KEY([actionButtonId])
REFERENCES [dbo].[ActionButton] ([actionButtonId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RefColumn_ActionButton]') AND parent_object_id = OBJECT_ID(N'[dbo].[ReferenceColumn]'))
ALTER TABLE [dbo].[ReferenceColumn] CHECK CONSTRAINT [FK_RefColumn_ActionButton]
GO
/****** Object:  ForeignKey [FK_RefColumn_DisplayColumn]    Script Date: 06/18/2015 12:04:37 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RefColumn_DisplayColumn]') AND parent_object_id = OBJECT_ID(N'[dbo].[ReferenceColumn]'))
ALTER TABLE [dbo].[ReferenceColumn]  WITH CHECK ADD  CONSTRAINT [FK_RefColumn_DisplayColumn] FOREIGN KEY([displayColumnId])
REFERENCES [dbo].[DisplayColumn] ([displayColumnId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RefColumn_DisplayColumn]') AND parent_object_id = OBJECT_ID(N'[dbo].[ReferenceColumn]'))
ALTER TABLE [dbo].[ReferenceColumn] CHECK CONSTRAINT [FK_RefColumn_DisplayColumn]
GO
/****** Object:  ForeignKey [FK_Result_Patient]    Script Date: 06/18/2015 12:04:37 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Result_Patient]') AND parent_object_id = OBJECT_ID(N'[dbo].[Result]'))
ALTER TABLE [dbo].[Result]  WITH NOCHECK ADD  CONSTRAINT [FK_Result_Patient] FOREIGN KEY([patientId])
REFERENCES [dbo].[Patient] ([patientId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Result_Patient]') AND parent_object_id = OBJECT_ID(N'[dbo].[Result]'))
ALTER TABLE [dbo].[Result] CHECK CONSTRAINT [FK_Result_Patient]
GO
/****** Object:  ForeignKey [FK_SchMetaDataHist_SchMetaData]    Script Date: 06/18/2015 12:04:37 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SchMetaDataHist_SchMetaData]') AND parent_object_id = OBJECT_ID(N'[dbo].[SchemaMetaDataHistory]'))
ALTER TABLE [dbo].[SchemaMetaDataHistory]  WITH CHECK ADD  CONSTRAINT [FK_SchMetaDataHist_SchMetaData] FOREIGN KEY([schemaMetaData])
REFERENCES [dbo].[SchemaMetaData] ([uniqueId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SchMetaDataHist_SchMetaData]') AND parent_object_id = OBJECT_ID(N'[dbo].[SchemaMetaDataHistory]'))
ALTER TABLE [dbo].[SchemaMetaDataHistory] CHECK CONSTRAINT [FK_SchMetaDataHist_SchMetaData]
GO
/****** Object:  ForeignKey [FK_Site_DefaultView]    Script Date: 06/18/2015 12:04:37 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Site_DefaultView]') AND parent_object_id = OBJECT_ID(N'[dbo].[Site]'))
ALTER TABLE [dbo].[Site]  WITH CHECK ADD  CONSTRAINT [FK_Site_DefaultView] FOREIGN KEY([defaultViewId])
REFERENCES [dbo].[PresentationView] ([viewId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Site_DefaultView]') AND parent_object_id = OBJECT_ID(N'[dbo].[Site]'))
ALTER TABLE [dbo].[Site] CHECK CONSTRAINT [FK_Site_DefaultView]
GO
/****** Object:  ForeignKey [FK_Site_Facility]    Script Date: 06/18/2015 12:04:37 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Site_Facility]') AND parent_object_id = OBJECT_ID(N'[dbo].[Site]'))
ALTER TABLE [dbo].[Site]  WITH CHECK ADD  CONSTRAINT [FK_Site_Facility] FOREIGN KEY([facilityId])
REFERENCES [dbo].[Facility] ([facilityId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Site_Facility]') AND parent_object_id = OBJECT_ID(N'[dbo].[Site]'))
ALTER TABLE [dbo].[Site] CHECK CONSTRAINT [FK_Site_Facility]
GO
/****** Object:  ForeignKey [FK_SiteViewLink_Site]    Script Date: 06/18/2015 12:04:37 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SiteViewLink_Site]') AND parent_object_id = OBJECT_ID(N'[dbo].[SiteViewLink]'))
ALTER TABLE [dbo].[SiteViewLink]  WITH CHECK ADD  CONSTRAINT [FK_SiteViewLink_Site] FOREIGN KEY([siteId])
REFERENCES [dbo].[Site] ([siteId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SiteViewLink_Site]') AND parent_object_id = OBJECT_ID(N'[dbo].[SiteViewLink]'))
ALTER TABLE [dbo].[SiteViewLink] CHECK CONSTRAINT [FK_SiteViewLink_Site]
GO
/****** Object:  ForeignKey [FK_SiteViewLink_View]    Script Date: 06/18/2015 12:04:37 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SiteViewLink_View]') AND parent_object_id = OBJECT_ID(N'[dbo].[SiteViewLink]'))
ALTER TABLE [dbo].[SiteViewLink]  WITH CHECK ADD  CONSTRAINT [FK_SiteViewLink_View] FOREIGN KEY([viewId])
REFERENCES [dbo].[PresentationView] ([viewId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SiteViewLink_View]') AND parent_object_id = OBJECT_ID(N'[dbo].[SiteViewLink]'))
ALTER TABLE [dbo].[SiteViewLink] CHECK CONSTRAINT [FK_SiteViewLink_View]
GO
/****** Object:  ForeignKey [FK_SpecFacLink_Facility]    Script Date: 06/18/2015 12:04:38 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SpecFacLink_Facility]') AND parent_object_id = OBJECT_ID(N'[dbo].[SpecialtyFacilityLink]'))
ALTER TABLE [dbo].[SpecialtyFacilityLink]  WITH CHECK ADD  CONSTRAINT [FK_SpecFacLink_Facility] FOREIGN KEY([facilityId])
REFERENCES [dbo].[Facility] ([facilityId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SpecFacLink_Facility]') AND parent_object_id = OBJECT_ID(N'[dbo].[SpecialtyFacilityLink]'))
ALTER TABLE [dbo].[SpecialtyFacilityLink] CHECK CONSTRAINT [FK_SpecFacLink_Facility]
GO
/****** Object:  ForeignKey [FK_SpecFacLink_Specialty]    Script Date: 06/18/2015 12:04:38 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SpecFacLink_Specialty]') AND parent_object_id = OBJECT_ID(N'[dbo].[SpecialtyFacilityLink]'))
ALTER TABLE [dbo].[SpecialtyFacilityLink]  WITH CHECK ADD  CONSTRAINT [FK_SpecFacLink_Specialty] FOREIGN KEY([specialtyId])
REFERENCES [dbo].[Specialty] ([specialtyId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SpecFacLink_Specialty]') AND parent_object_id = OBJECT_ID(N'[dbo].[SpecialtyFacilityLink]'))
ALTER TABLE [dbo].[SpecialtyFacilityLink] CHECK CONSTRAINT [FK_SpecFacLink_Specialty]
GO
/****** Object:  ForeignKey [FK_ViewActButton_ActButton]    Script Date: 06/18/2015 12:04:38 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ViewActButton_ActButton]') AND parent_object_id = OBJECT_ID(N'[dbo].[ViewActionButton]'))
ALTER TABLE [dbo].[ViewActionButton]  WITH CHECK ADD  CONSTRAINT [FK_ViewActButton_ActButton] FOREIGN KEY([actionButtonId])
REFERENCES [dbo].[ActionButton] ([actionButtonId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ViewActButton_ActButton]') AND parent_object_id = OBJECT_ID(N'[dbo].[ViewActionButton]'))
ALTER TABLE [dbo].[ViewActionButton] CHECK CONSTRAINT [FK_ViewActButton_ActButton]
GO
/****** Object:  ForeignKey [FK_ViewActButton_View]    Script Date: 06/18/2015 12:04:38 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ViewActButton_View]') AND parent_object_id = OBJECT_ID(N'[dbo].[ViewActionButton]'))
ALTER TABLE [dbo].[ViewActionButton]  WITH CHECK ADD  CONSTRAINT [FK_ViewActButton_View] FOREIGN KEY([viewId])
REFERENCES [dbo].[PresentationView] ([viewId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ViewActButton_View]') AND parent_object_id = OBJECT_ID(N'[dbo].[ViewActionButton]'))
ALTER TABLE [dbo].[ViewActionButton] CHECK CONSTRAINT [FK_ViewActButton_View]
GO
/****** Object:  ForeignKey [FK_ViewColumn_DisplayColumn]    Script Date: 06/18/2015 12:04:38 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ViewColumn_DisplayColumn]') AND parent_object_id = OBJECT_ID(N'[dbo].[ViewColumn]'))
ALTER TABLE [dbo].[ViewColumn]  WITH CHECK ADD  CONSTRAINT [FK_ViewColumn_DisplayColumn] FOREIGN KEY([displayColumnId])
REFERENCES [dbo].[DisplayColumn] ([displayColumnId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ViewColumn_DisplayColumn]') AND parent_object_id = OBJECT_ID(N'[dbo].[ViewColumn]'))
ALTER TABLE [dbo].[ViewColumn] CHECK CONSTRAINT [FK_ViewColumn_DisplayColumn]
GO
/****** Object:  ForeignKey [FK_ViewColumn_View]    Script Date: 06/18/2015 12:04:38 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ViewColumn_View]') AND parent_object_id = OBJECT_ID(N'[dbo].[ViewColumn]'))
ALTER TABLE [dbo].[ViewColumn]  WITH CHECK ADD  CONSTRAINT [FK_ViewColumn_View] FOREIGN KEY([viewId])
REFERENCES [dbo].[PresentationView] ([viewId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ViewColumn_View]') AND parent_object_id = OBJECT_ID(N'[dbo].[ViewColumn]'))
ALTER TABLE [dbo].[ViewColumn] CHECK CONSTRAINT [FK_ViewColumn_View]
GO
/****** Object:  ForeignKey [FK_ViewFilter_Filter]    Script Date: 06/18/2015 12:04:38 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ViewFilter_Filter]') AND parent_object_id = OBJECT_ID(N'[dbo].[ViewFilter]'))
ALTER TABLE [dbo].[ViewFilter]  WITH CHECK ADD  CONSTRAINT [FK_ViewFilter_Filter] FOREIGN KEY([filterId])
REFERENCES [dbo].[Filter] ([filterId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ViewFilter_Filter]') AND parent_object_id = OBJECT_ID(N'[dbo].[ViewFilter]'))
ALTER TABLE [dbo].[ViewFilter] CHECK CONSTRAINT [FK_ViewFilter_Filter]
GO
/****** Object:  ForeignKey [FK_ViewFilter_View]    Script Date: 06/18/2015 12:04:38 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ViewFilter_View]') AND parent_object_id = OBJECT_ID(N'[dbo].[ViewFilter]'))
ALTER TABLE [dbo].[ViewFilter]  WITH CHECK ADD  CONSTRAINT [FK_ViewFilter_View] FOREIGN KEY([viewId])
REFERENCES [dbo].[PresentationView] ([viewId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ViewFilter_View]') AND parent_object_id = OBJECT_ID(N'[dbo].[ViewFilter]'))
ALTER TABLE [dbo].[ViewFilter] CHECK CONSTRAINT [FK_ViewFilter_View]
GO
/****** Object:  ForeignKey [FK_WebLink_DisplayColumn]    Script Date: 06/18/2015 12:04:38 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WebLink_DisplayColumn]') AND parent_object_id = OBJECT_ID(N'[dbo].[WebLink]'))
ALTER TABLE [dbo].[WebLink]  WITH CHECK ADD  CONSTRAINT [FK_WebLink_DisplayColumn] FOREIGN KEY([displayColumnId])
REFERENCES [dbo].[DisplayColumn] ([displayColumnId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WebLink_DisplayColumn]') AND parent_object_id = OBJECT_ID(N'[dbo].[WebLink]'))
ALTER TABLE [dbo].[WebLink] CHECK CONSTRAINT [FK_WebLink_DisplayColumn]
GO
/****** Object:  ForeignKey [FK_WebLinkParam_RefColumn]    Script Date: 06/18/2015 12:04:38 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WebLinkParam_RefColumn]') AND parent_object_id = OBJECT_ID(N'[dbo].[WebLinkParameter]'))
ALTER TABLE [dbo].[WebLinkParameter]  WITH CHECK ADD  CONSTRAINT [FK_WebLinkParam_RefColumn] FOREIGN KEY([referenceColumnId])
REFERENCES [dbo].[ReferenceColumn] ([referenceColumnId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WebLinkParam_RefColumn]') AND parent_object_id = OBJECT_ID(N'[dbo].[WebLinkParameter]'))
ALTER TABLE [dbo].[WebLinkParameter] CHECK CONSTRAINT [FK_WebLinkParam_RefColumn]
GO
/****** Object:  ForeignKey [FK_WebLinkParam_WebLink]    Script Date: 06/18/2015 12:04:38 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WebLinkParam_WebLink]') AND parent_object_id = OBJECT_ID(N'[dbo].[WebLinkParameter]'))
ALTER TABLE [dbo].[WebLinkParameter]  WITH CHECK ADD  CONSTRAINT [FK_WebLinkParam_WebLink] FOREIGN KEY([webLinkId])
REFERENCES [dbo].[WebLink] ([webLinkId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WebLinkParam_WebLink]') AND parent_object_id = OBJECT_ID(N'[dbo].[WebLinkParameter]'))
ALTER TABLE [dbo].[WebLinkParameter] CHECK CONSTRAINT [FK_WebLinkParam_WebLink]
GO
