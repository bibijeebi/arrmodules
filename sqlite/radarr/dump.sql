BEGIN TRANSACTION;
CREATE TABLE "AlternativeTitles" ("Id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, "Title" TEXT NOT NULL, "CleanTitle" TEXT NOT NULL, "SourceType" INTEGER NOT NULL, "MovieMetadataId" INTEGER NOT NULL);
CREATE TABLE "AutoTagging" ("Id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, "Name" TEXT NOT NULL, "Specifications" TEXT NOT NULL DEFAULT '[]', "RemoveTagsAutomatically" INTEGER NOT NULL DEFAULT 0, "Tags" TEXT NOT NULL DEFAULT '[]');
CREATE TABLE "Blocklist" ("Id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, "SourceTitle" TEXT NOT NULL, "Quality" TEXT NOT NULL, "Date" DATETIME NOT NULL, "PublishedDate" DATETIME, "Size" INTEGER, "Protocol" INTEGER, "Indexer" TEXT, "Message" TEXT, "TorrentInfoHash" TEXT, "MovieId" INTEGER, "Languages" TEXT NOT NULL, "IndexerFlags" INTEGER NOT NULL);
CREATE TABLE "Collections" ("Id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, "TmdbId" INTEGER NOT NULL, "QualityProfileId" INTEGER NOT NULL, "RootFolderPath" TEXT NOT NULL, "MinimumAvailability" INTEGER NOT NULL, "SearchOnAdd" INTEGER NOT NULL, "Title" TEXT NOT NULL, "SortTitle" TEXT, "CleanTitle" TEXT NOT NULL, "Overview" TEXT, "Images" TEXT NOT NULL, "Monitored" INTEGER NOT NULL, "LastInfoSync" DATETIME, "Added" DATETIME, "Tags" TEXT);
CREATE TABLE "Commands" ("Id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, "Name" TEXT NOT NULL, "Body" TEXT NOT NULL, "Priority" INTEGER NOT NULL, "Status" INTEGER NOT NULL, "QueuedAt" DATETIME NOT NULL, "StartedAt" DATETIME, "EndedAt" DATETIME, "Duration" TEXT, "Exception" TEXT, "Trigger" INTEGER NOT NULL, "Result" INTEGER NOT NULL DEFAULT 1);
INSERT INTO "Commands" VALUES(1,'RefreshMonitoredDownloads','{
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "requiresDiskAccess": false,
  "isExclusive": false,
  "isTypeExclusive": false,
  "isLongRunning": false,
  "name": "RefreshMonitoredDownloads",
  "lastExecutionTime": "2024-10-30T03:06:00Z",
  "lastStartTime": "0001-01-01T04:57:00Z",
  "trigger": "scheduled",
  "suppressMessages": false
}',1,2,'2024-10-30 03:07:30.9550049Z','2024-10-30 03:07:30.9678677Z','2024-10-30 03:07:30.9882764Z','00:00:00.0204087',NULL,2,0);
INSERT INTO "Commands" VALUES(2,'ProcessMonitoredDownloads','{
  "requiresDiskAccess": true,
  "isLongRunning": true,
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "isExclusive": false,
  "isTypeExclusive": false,
  "name": "ProcessMonitoredDownloads",
  "trigger": "unspecified",
  "suppressMessages": false
}',1,2,'2024-10-30 03:07:30.9789775Z','2024-10-30 03:07:30.9879658Z','2024-10-30 03:07:30.9974549Z','00:00:00.0094891',NULL,0,0);
INSERT INTO "Commands" VALUES(3,'RefreshMonitoredDownloads','{
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "requiresDiskAccess": false,
  "isExclusive": false,
  "isTypeExclusive": false,
  "isLongRunning": false,
  "name": "RefreshMonitoredDownloads",
  "lastExecutionTime": "2024-10-30T03:07:31Z",
  "lastStartTime": "2024-10-30T03:07:30Z",
  "trigger": "scheduled",
  "suppressMessages": false
}',1,2,'2024-10-30 03:09:00.9689433Z','2024-10-30 03:09:00.9742592Z','2024-10-30 03:09:00.9803061Z','00:00:00.0060469',NULL,2,0);
INSERT INTO "Commands" VALUES(4,'ProcessMonitoredDownloads','{
  "requiresDiskAccess": true,
  "isLongRunning": true,
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "isExclusive": false,
  "isTypeExclusive": false,
  "name": "ProcessMonitoredDownloads",
  "trigger": "unspecified",
  "suppressMessages": false
}',1,2,'2024-10-30 03:09:00.9777427Z','2024-10-30 03:09:00.9803495Z','2024-10-30 03:09:00.9912435Z','00:00:00.0108940',NULL,0,0);
INSERT INTO "Commands" VALUES(5,'RefreshMonitoredDownloads','{
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "requiresDiskAccess": false,
  "isExclusive": false,
  "isTypeExclusive": false,
  "isLongRunning": false,
  "name": "RefreshMonitoredDownloads",
  "lastExecutionTime": "2024-10-30T03:09:00Z",
  "lastStartTime": "2024-10-30T03:09:00Z",
  "trigger": "scheduled",
  "suppressMessages": false
}',1,2,'2024-10-30 03:10:30.9750562Z','2024-10-30 03:10:30.9806531Z','2024-10-30 03:10:30.9868438Z','00:00:00.0061907',NULL,2,0);
INSERT INTO "Commands" VALUES(6,'ProcessMonitoredDownloads','{
  "requiresDiskAccess": true,
  "isLongRunning": true,
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "isExclusive": false,
  "isTypeExclusive": false,
  "name": "ProcessMonitoredDownloads",
  "trigger": "unspecified",
  "suppressMessages": false
}',1,2,'2024-10-30 03:10:30.9841021Z','2024-10-30 03:10:30.9868549Z','2024-10-30 03:10:30.9979756Z','00:00:00.0111207',NULL,0,0);
INSERT INTO "Commands" VALUES(7,'MessagingCleanup','{
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "requiresDiskAccess": false,
  "isExclusive": false,
  "isTypeExclusive": false,
  "isLongRunning": false,
  "name": "MessagingCleanup",
  "lastExecutionTime": "2024-10-30T03:06:00Z",
  "lastStartTime": "0001-01-01T04:57:00Z",
  "trigger": "scheduled",
  "suppressMessages": false
}',-1,2,'2024-10-30 03:11:00.9835406Z','2024-10-30 03:11:00.9901675Z','2024-10-30 03:11:01.0032675Z','00:00:00.0131000',NULL,2,0);
INSERT INTO "Commands" VALUES(8,'ImportListSync','{
  "sendUpdatesToClient": true,
  "isTypeExclusive": true,
  "updateScheduledTask": true,
  "requiresDiskAccess": false,
  "isExclusive": false,
  "isLongRunning": false,
  "name": "ImportListSync",
  "lastExecutionTime": "2024-10-30T03:06:00Z",
  "lastStartTime": "0001-01-01T04:57:00Z",
  "trigger": "scheduled",
  "suppressMessages": false
}',-1,2,'2024-10-30 03:11:00.9925891Z','2024-10-30 03:11:00.9989051Z','2024-10-30 03:11:01.0050183Z','00:00:00.0061132',NULL,2,0);
INSERT INTO "Commands" VALUES(9,'RefreshMonitoredDownloads','{
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "requiresDiskAccess": false,
  "isExclusive": false,
  "isTypeExclusive": false,
  "isLongRunning": false,
  "name": "RefreshMonitoredDownloads",
  "lastExecutionTime": "2024-10-30T03:10:30Z",
  "lastStartTime": "2024-10-30T03:10:30Z",
  "trigger": "scheduled",
  "suppressMessages": false
}',1,2,'2024-10-30 03:11:31.0001353Z','2024-10-30 03:11:31.0036493Z','2024-10-30 03:11:31.0095932Z','00:00:00.0059439',NULL,2,0);
INSERT INTO "Commands" VALUES(10,'ProcessMonitoredDownloads','{
  "requiresDiskAccess": true,
  "isLongRunning": true,
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "isExclusive": false,
  "isTypeExclusive": false,
  "name": "ProcessMonitoredDownloads",
  "trigger": "unspecified",
  "suppressMessages": false
}',1,2,'2024-10-30 03:11:31.0069714Z','2024-10-30 03:11:31.0096215Z','2024-10-30 03:11:31.0206467Z','00:00:00.0110252',NULL,0,0);
INSERT INTO "Commands" VALUES(11,'RefreshMonitoredDownloads','{
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "requiresDiskAccess": false,
  "isExclusive": false,
  "isTypeExclusive": false,
  "isLongRunning": false,
  "name": "RefreshMonitoredDownloads",
  "lastExecutionTime": "2024-10-30T03:11:31Z",
  "lastStartTime": "2024-10-30T03:11:31Z",
  "trigger": "scheduled",
  "suppressMessages": false
}',1,2,'2024-10-30 03:13:01.0049451Z','2024-10-30 03:13:01.0105809Z','2024-10-30 03:13:01.0161053Z','00:00:00.0055244',NULL,2,0);
INSERT INTO "Commands" VALUES(12,'ProcessMonitoredDownloads','{
  "requiresDiskAccess": true,
  "isLongRunning": true,
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "isExclusive": false,
  "isTypeExclusive": false,
  "name": "ProcessMonitoredDownloads",
  "trigger": "unspecified",
  "suppressMessages": false
}',1,2,'2024-10-30 03:13:01.0136423Z','2024-10-30 03:13:01.0161099Z','2024-10-30 03:13:01.0268541Z','00:00:00.0107442',NULL,0,0);
INSERT INTO "Commands" VALUES(13,'RefreshMonitoredDownloads','{
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "requiresDiskAccess": false,
  "isExclusive": false,
  "isTypeExclusive": false,
  "isLongRunning": false,
  "name": "RefreshMonitoredDownloads",
  "lastExecutionTime": "2024-10-30T03:13:01Z",
  "lastStartTime": "2024-10-30T03:13:01Z",
  "trigger": "scheduled",
  "suppressMessages": false
}',1,2,'2024-10-30 03:14:31.0114346Z','2024-10-30 03:14:31.0144548Z','2024-10-30 03:14:31.0202167Z','00:00:00.0057619',NULL,2,0);
INSERT INTO "Commands" VALUES(14,'ProcessMonitoredDownloads','{
  "requiresDiskAccess": true,
  "isLongRunning": true,
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "isExclusive": false,
  "isTypeExclusive": false,
  "name": "ProcessMonitoredDownloads",
  "trigger": "unspecified",
  "suppressMessages": false
}',1,2,'2024-10-30 03:14:31.0175515Z','2024-10-30 03:14:31.0202281Z','2024-10-30 03:14:31.023167Z','00:00:00.0029389',NULL,0,0);
INSERT INTO "Commands" VALUES(15,'MessagingCleanup','{
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "requiresDiskAccess": false,
  "isExclusive": false,
  "isTypeExclusive": false,
  "isLongRunning": false,
  "name": "MessagingCleanup",
  "lastExecutionTime": "2024-10-30T03:11:01Z",
  "lastStartTime": "2024-10-30T03:11:00Z",
  "trigger": "scheduled",
  "suppressMessages": false
}',-1,2,'2024-10-30 03:16:01.0162398Z','2024-10-30 03:16:01.0217284Z','2024-10-30 03:16:01.0249481Z','00:00:00.0032197',NULL,2,0);
INSERT INTO "Commands" VALUES(16,'RefreshMonitoredDownloads','{
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "requiresDiskAccess": false,
  "isExclusive": false,
  "isTypeExclusive": false,
  "isLongRunning": false,
  "name": "RefreshMonitoredDownloads",
  "lastExecutionTime": "2024-10-30T03:14:31Z",
  "lastStartTime": "2024-10-30T03:14:31Z",
  "trigger": "scheduled",
  "suppressMessages": false
}',1,2,'2024-10-30 03:16:01.0218484Z','2024-10-30 03:16:01.0329483Z','2024-10-30 03:16:01.0386795Z','00:00:00.0057312',NULL,2,0);
INSERT INTO "Commands" VALUES(17,'ProcessMonitoredDownloads','{
  "requiresDiskAccess": true,
  "isLongRunning": true,
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "isExclusive": false,
  "isTypeExclusive": false,
  "name": "ProcessMonitoredDownloads",
  "trigger": "unspecified",
  "suppressMessages": false
}',1,2,'2024-10-30 03:16:01.0356251Z','2024-10-30 03:16:01.0386914Z','2024-10-30 03:16:01.0414394Z','00:00:00.0027480',NULL,0,0);
INSERT INTO "Commands" VALUES(18,'ImportListSync','{
  "sendUpdatesToClient": true,
  "isTypeExclusive": true,
  "updateScheduledTask": true,
  "requiresDiskAccess": false,
  "isExclusive": false,
  "isLongRunning": false,
  "name": "ImportListSync",
  "lastExecutionTime": "2024-10-30T03:11:01Z",
  "lastStartTime": "2024-10-30T03:11:00Z",
  "trigger": "scheduled",
  "suppressMessages": false
}',-1,2,'2024-10-30 03:16:31.0332016Z','2024-10-30 03:16:31.0385601Z','2024-10-30 03:16:31.041567Z','00:00:00.0030069',NULL,2,0);
INSERT INTO "Commands" VALUES(19,'RefreshMonitoredDownloads','{
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "requiresDiskAccess": false,
  "isExclusive": false,
  "isTypeExclusive": false,
  "isLongRunning": false,
  "name": "RefreshMonitoredDownloads",
  "lastExecutionTime": "2024-10-30T03:16:01Z",
  "lastStartTime": "2024-10-30T03:16:01Z",
  "trigger": "scheduled",
  "suppressMessages": false
}',1,2,'2024-10-30 03:17:31.0397938Z','2024-10-30 03:17:31.0456547Z','2024-10-30 03:17:31.0514113Z','00:00:00.0057566',NULL,2,0);
INSERT INTO "Commands" VALUES(20,'ProcessMonitoredDownloads','{
  "requiresDiskAccess": true,
  "isLongRunning": true,
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "isExclusive": false,
  "isTypeExclusive": false,
  "name": "ProcessMonitoredDownloads",
  "trigger": "unspecified",
  "suppressMessages": false
}',1,2,'2024-10-30 03:17:31.0488737Z','2024-10-30 03:17:31.0514946Z','2024-10-30 03:17:31.0650404Z','00:00:00.0135458',NULL,0,0);
INSERT INTO "Commands" VALUES(21,'RefreshMonitoredDownloads','{
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "requiresDiskAccess": false,
  "isExclusive": false,
  "isTypeExclusive": false,
  "isLongRunning": false,
  "name": "RefreshMonitoredDownloads",
  "lastExecutionTime": "2024-10-30T03:17:31Z",
  "lastStartTime": "2024-10-30T03:17:31Z",
  "trigger": "scheduled",
  "suppressMessages": false
}',1,2,'2024-10-30 03:19:01.0470021Z','2024-10-30 03:19:01.0523372Z','2024-10-30 03:19:01.0590185Z','00:00:00.0066813',NULL,2,0);
INSERT INTO "Commands" VALUES(22,'ProcessMonitoredDownloads','{
  "requiresDiskAccess": true,
  "isLongRunning": true,
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "isExclusive": false,
  "isTypeExclusive": false,
  "name": "ProcessMonitoredDownloads",
  "trigger": "unspecified",
  "suppressMessages": false
}',1,2,'2024-10-30 03:19:01.0561181Z','2024-10-30 03:19:01.0590248Z','2024-10-30 03:19:01.0703194Z','00:00:00.0112946',NULL,0,0);
INSERT INTO "Commands" VALUES(23,'RefreshMonitoredDownloads','{
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "requiresDiskAccess": false,
  "isExclusive": false,
  "isTypeExclusive": false,
  "isLongRunning": false,
  "name": "RefreshMonitoredDownloads",
  "lastExecutionTime": "2024-10-30T03:19:01Z",
  "lastStartTime": "2024-10-30T03:19:01Z",
  "trigger": "scheduled",
  "suppressMessages": false
}',1,2,'2024-10-30 03:20:31.0542098Z','2024-10-30 03:20:31.0574271Z','2024-10-30 03:20:31.0632343Z','00:00:00.0058072',NULL,2,0);
INSERT INTO "Commands" VALUES(24,'ProcessMonitoredDownloads','{
  "requiresDiskAccess": true,
  "isLongRunning": true,
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "isExclusive": false,
  "isTypeExclusive": false,
  "name": "ProcessMonitoredDownloads",
  "trigger": "unspecified",
  "suppressMessages": false
}',1,2,'2024-10-30 03:20:31.060558Z','2024-10-30 03:20:31.063282Z','2024-10-30 03:20:31.074263Z','00:00:00.0109810',NULL,0,0);
INSERT INTO "Commands" VALUES(25,'MessagingCleanup','{
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "requiresDiskAccess": false,
  "isExclusive": false,
  "isTypeExclusive": false,
  "isLongRunning": false,
  "name": "MessagingCleanup",
  "lastExecutionTime": "2024-10-30T03:16:01Z",
  "lastStartTime": "2024-10-30T03:16:01Z",
  "trigger": "scheduled",
  "suppressMessages": false
}',-1,2,'2024-10-30 03:21:01.0582761Z','2024-10-30 03:21:01.0638116Z','2024-10-30 03:21:01.0671155Z','00:00:00.0033039',NULL,2,0);
INSERT INTO "Commands" VALUES(26,'ImportListSync','{
  "sendUpdatesToClient": true,
  "isTypeExclusive": true,
  "updateScheduledTask": true,
  "requiresDiskAccess": false,
  "isExclusive": false,
  "isLongRunning": false,
  "name": "ImportListSync",
  "lastExecutionTime": "2024-10-30T03:16:31Z",
  "lastStartTime": "2024-10-30T03:16:31Z",
  "trigger": "scheduled",
  "suppressMessages": false
}',-1,2,'2024-10-30 03:21:31.0638259Z','2024-10-30 03:21:31.0673611Z','2024-10-30 03:21:31.0709606Z','00:00:00.0035995',NULL,2,0);
INSERT INTO "Commands" VALUES(27,'RefreshMonitoredDownloads','{
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "requiresDiskAccess": false,
  "isExclusive": false,
  "isTypeExclusive": false,
  "isLongRunning": false,
  "name": "RefreshMonitoredDownloads",
  "lastExecutionTime": "2024-10-30T03:20:31Z",
  "lastStartTime": "2024-10-30T03:20:31Z",
  "trigger": "scheduled",
  "suppressMessages": false
}',1,2,'2024-10-30 03:22:01.0679498Z','2024-10-30 03:22:01.076513Z','2024-10-30 03:22:01.0841551Z','00:00:00.0076421',NULL,2,0);
INSERT INTO "Commands" VALUES(28,'ProcessMonitoredDownloads','{
  "requiresDiskAccess": true,
  "isLongRunning": true,
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "isExclusive": false,
  "isTypeExclusive": false,
  "name": "ProcessMonitoredDownloads",
  "trigger": "unspecified",
  "suppressMessages": false
}',1,2,'2024-10-30 03:22:01.0816342Z','2024-10-30 03:22:01.0842562Z','2024-10-30 03:22:01.0970365Z','00:00:00.0127803',NULL,0,0);
INSERT INTO "Commands" VALUES(29,'RefreshMonitoredDownloads','{
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "requiresDiskAccess": false,
  "isExclusive": false,
  "isTypeExclusive": false,
  "isLongRunning": false,
  "name": "RefreshMonitoredDownloads",
  "lastExecutionTime": "2024-10-30T03:22:01Z",
  "lastStartTime": "2024-10-30T03:22:01Z",
  "trigger": "scheduled",
  "suppressMessages": false
}',1,2,'2024-10-30 03:23:31.0787931Z','2024-10-30 03:23:31.0839629Z','2024-10-30 03:23:31.0897851Z','00:00:00.0058222',NULL,2,0);
INSERT INTO "Commands" VALUES(30,'ProcessMonitoredDownloads','{
  "requiresDiskAccess": true,
  "isLongRunning": true,
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "isExclusive": false,
  "isTypeExclusive": false,
  "name": "ProcessMonitoredDownloads",
  "trigger": "unspecified",
  "suppressMessages": false
}',1,2,'2024-10-30 03:23:31.086985Z','2024-10-30 03:23:31.0898701Z','2024-10-30 03:23:31.1008881Z','00:00:00.0110180',NULL,0,0);
INSERT INTO "Commands" VALUES(31,'RefreshMonitoredDownloads','{
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "requiresDiskAccess": false,
  "isExclusive": false,
  "isTypeExclusive": false,
  "isLongRunning": false,
  "name": "RefreshMonitoredDownloads",
  "lastExecutionTime": "2024-10-30T03:23:31Z",
  "lastStartTime": "2024-10-30T03:23:31Z",
  "trigger": "scheduled",
  "suppressMessages": false
}',1,2,'2024-10-30 03:25:01.0856606Z','2024-10-30 03:25:01.0893726Z','2024-10-30 03:25:01.095395Z','00:00:00.0060224',NULL,2,0);
INSERT INTO "Commands" VALUES(32,'ProcessMonitoredDownloads','{
  "requiresDiskAccess": true,
  "isLongRunning": true,
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "isExclusive": false,
  "isTypeExclusive": false,
  "name": "ProcessMonitoredDownloads",
  "trigger": "unspecified",
  "suppressMessages": false
}',1,2,'2024-10-30 03:25:01.0927473Z','2024-10-30 03:25:01.0954175Z','2024-10-30 03:25:01.1064368Z','00:00:00.0110193',NULL,0,0);
INSERT INTO "Commands" VALUES(33,'MessagingCleanup','{
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "requiresDiskAccess": false,
  "isExclusive": false,
  "isTypeExclusive": false,
  "isLongRunning": false,
  "name": "MessagingCleanup",
  "lastExecutionTime": "2024-10-30T03:21:01Z",
  "lastStartTime": "2024-10-30T03:21:01Z",
  "trigger": "scheduled",
  "suppressMessages": false
}',-1,2,'2024-10-30 03:26:01.0902408Z','2024-10-30 03:26:01.0954125Z','2024-10-30 03:26:01.0981905Z','00:00:00.0027780',NULL,2,0);
INSERT INTO "Commands" VALUES(34,'ImportListSync','{
  "sendUpdatesToClient": true,
  "isTypeExclusive": true,
  "updateScheduledTask": true,
  "requiresDiskAccess": false,
  "isExclusive": false,
  "isLongRunning": false,
  "name": "ImportListSync",
  "lastExecutionTime": "2024-10-30T03:21:31Z",
  "lastStartTime": "2024-10-30T03:21:31Z",
  "trigger": "scheduled",
  "suppressMessages": false
}',-1,2,'2024-10-30 03:26:31.0969327Z','2024-10-30 03:26:31.1023417Z','2024-10-30 03:26:31.1059997Z','00:00:00.0036580',NULL,2,0);
INSERT INTO "Commands" VALUES(35,'RefreshMonitoredDownloads','{
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "requiresDiskAccess": false,
  "isExclusive": false,
  "isTypeExclusive": false,
  "isLongRunning": false,
  "name": "RefreshMonitoredDownloads",
  "lastExecutionTime": "2024-10-30T03:25:01Z",
  "lastStartTime": "2024-10-30T03:25:01Z",
  "trigger": "scheduled",
  "suppressMessages": false
}',1,2,'2024-10-30 03:26:31.1024587Z','2024-10-30 03:26:31.1082061Z','2024-10-30 03:26:31.1137068Z','00:00:00.0055007',NULL,2,0);
INSERT INTO "Commands" VALUES(36,'ProcessMonitoredDownloads','{
  "requiresDiskAccess": true,
  "isLongRunning": true,
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "isExclusive": false,
  "isTypeExclusive": false,
  "name": "ProcessMonitoredDownloads",
  "trigger": "unspecified",
  "suppressMessages": false
}',1,2,'2024-10-30 03:26:31.1111376Z','2024-10-30 03:26:31.1138165Z','2024-10-30 03:26:31.1246342Z','00:00:00.0108177',NULL,0,0);
INSERT INTO "Commands" VALUES(37,'RefreshMonitoredDownloads','{
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "requiresDiskAccess": false,
  "isExclusive": false,
  "isTypeExclusive": false,
  "isLongRunning": false,
  "name": "RefreshMonitoredDownloads",
  "lastExecutionTime": "2024-10-30T03:26:31Z",
  "lastStartTime": "2024-10-30T03:26:31Z",
  "trigger": "scheduled",
  "suppressMessages": false
}',1,2,'2024-10-30 03:28:01.1083124Z','2024-10-30 03:28:01.1117138Z','2024-10-30 03:28:01.1177409Z','00:00:00.0060271',NULL,2,0);
INSERT INTO "Commands" VALUES(38,'ProcessMonitoredDownloads','{
  "requiresDiskAccess": true,
  "isLongRunning": true,
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "isExclusive": false,
  "isTypeExclusive": false,
  "name": "ProcessMonitoredDownloads",
  "trigger": "unspecified",
  "suppressMessages": false
}',1,2,'2024-10-30 03:28:01.1150371Z','2024-10-30 03:28:01.1177762Z','2024-10-30 03:28:01.1285811Z','00:00:00.0108049',NULL,0,0);
INSERT INTO "Commands" VALUES(39,'RefreshMonitoredDownloads','{
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "requiresDiskAccess": false,
  "isExclusive": false,
  "isTypeExclusive": false,
  "isLongRunning": false,
  "name": "RefreshMonitoredDownloads",
  "lastExecutionTime": "2024-10-30T03:28:01Z",
  "lastStartTime": "2024-10-30T03:28:01Z",
  "trigger": "scheduled",
  "suppressMessages": false
}',1,2,'2024-10-30 03:29:31.1128572Z','2024-10-30 03:29:31.118425Z','2024-10-30 03:29:31.1244089Z','00:00:00.0059839',NULL,2,0);
INSERT INTO "Commands" VALUES(40,'ProcessMonitoredDownloads','{
  "requiresDiskAccess": true,
  "isLongRunning": true,
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "isExclusive": false,
  "isTypeExclusive": false,
  "name": "ProcessMonitoredDownloads",
  "trigger": "unspecified",
  "suppressMessages": false
}',1,2,'2024-10-30 03:29:31.1218479Z','2024-10-30 03:29:31.1244189Z','2024-10-30 03:29:31.1353348Z','00:00:00.0109159',NULL,0,0);
INSERT INTO "Commands" VALUES(41,'MessagingCleanup','{
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "requiresDiskAccess": false,
  "isExclusive": false,
  "isTypeExclusive": false,
  "isLongRunning": false,
  "name": "MessagingCleanup",
  "lastExecutionTime": "2024-10-30T03:26:01Z",
  "lastStartTime": "2024-10-30T03:26:01Z",
  "trigger": "scheduled",
  "suppressMessages": false
}',-1,2,'2024-10-30 03:31:01.120747Z','2024-10-30 03:31:01.1238645Z','2024-10-30 03:31:01.1266849Z','00:00:00.0028204',NULL,2,0);
INSERT INTO "Commands" VALUES(42,'RefreshMonitoredDownloads','{
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "requiresDiskAccess": false,
  "isExclusive": false,
  "isTypeExclusive": false,
  "isLongRunning": false,
  "name": "RefreshMonitoredDownloads",
  "lastExecutionTime": "2024-10-30T03:29:31Z",
  "lastStartTime": "2024-10-30T03:29:31Z",
  "trigger": "scheduled",
  "suppressMessages": false
}',1,2,'2024-10-30 03:31:01.1241987Z','2024-10-30 03:31:01.1349475Z','2024-10-30 03:31:01.1400781Z','00:00:00.0051306',NULL,2,0);
INSERT INTO "Commands" VALUES(43,'ProcessMonitoredDownloads','{
  "requiresDiskAccess": true,
  "isLongRunning": true,
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "isExclusive": false,
  "isTypeExclusive": false,
  "name": "ProcessMonitoredDownloads",
  "trigger": "unspecified",
  "suppressMessages": false
}',1,2,'2024-10-30 03:31:01.1375593Z','2024-10-30 03:31:01.1400929Z','2024-10-30 03:31:01.1512483Z','00:00:00.0111554',NULL,0,0);
INSERT INTO "Commands" VALUES(44,'ImportListSync','{
  "sendUpdatesToClient": true,
  "isTypeExclusive": true,
  "updateScheduledTask": true,
  "requiresDiskAccess": false,
  "isExclusive": false,
  "isLongRunning": false,
  "name": "ImportListSync",
  "lastExecutionTime": "2024-10-30T03:26:31Z",
  "lastStartTime": "2024-10-30T03:26:31Z",
  "trigger": "scheduled",
  "suppressMessages": false
}',-1,2,'2024-10-30 03:32:01.1351422Z','2024-10-30 03:32:01.1386947Z','2024-10-30 03:32:01.1425316Z','00:00:00.0038369',NULL,2,0);
INSERT INTO "Commands" VALUES(45,'RefreshMonitoredDownloads','{
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "requiresDiskAccess": false,
  "isExclusive": false,
  "isTypeExclusive": false,
  "isLongRunning": false,
  "name": "RefreshMonitoredDownloads",
  "lastExecutionTime": "2024-10-30T03:31:01Z",
  "lastStartTime": "2024-10-30T03:31:01Z",
  "trigger": "scheduled",
  "suppressMessages": false
}',1,2,'2024-10-30 03:32:31.1387889Z','2024-10-30 03:32:31.1467061Z','2024-10-30 03:32:31.1518883Z','00:00:00.0051822',NULL,2,0);
INSERT INTO "Commands" VALUES(46,'ProcessMonitoredDownloads','{
  "requiresDiskAccess": true,
  "isLongRunning": true,
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "isExclusive": false,
  "isTypeExclusive": false,
  "name": "ProcessMonitoredDownloads",
  "trigger": "unspecified",
  "suppressMessages": false
}',1,2,'2024-10-30 03:32:31.1496273Z','2024-10-30 03:32:31.1518945Z','2024-10-30 03:32:31.16634Z','00:00:00.0144455',NULL,0,0);
INSERT INTO "Commands" VALUES(47,'RefreshMonitoredDownloads','{
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "requiresDiskAccess": false,
  "isExclusive": false,
  "isTypeExclusive": false,
  "isLongRunning": false,
  "name": "RefreshMonitoredDownloads",
  "lastExecutionTime": "2024-10-30T03:32:31Z",
  "lastStartTime": "2024-10-30T03:32:31Z",
  "trigger": "scheduled",
  "suppressMessages": false
}',1,2,'2024-10-30 03:34:01.1468403Z','2024-10-30 03:34:01.1501703Z','2024-10-30 03:34:01.1556359Z','00:00:00.0054656',NULL,2,0);
INSERT INTO "Commands" VALUES(48,'ProcessMonitoredDownloads','{
  "requiresDiskAccess": true,
  "isLongRunning": true,
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "isExclusive": false,
  "isTypeExclusive": false,
  "name": "ProcessMonitoredDownloads",
  "trigger": "unspecified",
  "suppressMessages": false
}',1,2,'2024-10-30 03:34:01.1530842Z','2024-10-30 03:34:01.1556449Z','2024-10-30 03:34:01.1688194Z','00:00:00.0131745',NULL,0,0);
INSERT INTO "Commands" VALUES(49,'RefreshMonitoredDownloads','{
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "requiresDiskAccess": false,
  "isExclusive": false,
  "isTypeExclusive": false,
  "isLongRunning": false,
  "name": "RefreshMonitoredDownloads",
  "lastExecutionTime": "2024-10-30T03:34:01Z",
  "lastStartTime": "2024-10-30T03:34:01Z",
  "trigger": "scheduled",
  "suppressMessages": false
}',1,2,'2024-10-30 03:35:20.7803431Z','2024-10-30 03:35:20.7977366Z','2024-10-30 03:35:20.8202585Z','00:00:00.0225219',NULL,2,0);
INSERT INTO "Commands" VALUES(50,'ProcessMonitoredDownloads','{
  "requiresDiskAccess": true,
  "isLongRunning": true,
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "isExclusive": false,
  "isTypeExclusive": false,
  "name": "ProcessMonitoredDownloads",
  "trigger": "unspecified",
  "suppressMessages": false
}',1,2,'2024-10-30 03:35:20.8146492Z','2024-10-30 03:35:20.8200436Z','2024-10-30 03:35:20.8269644Z','00:00:00.0069208',NULL,0,0);
INSERT INTO "Commands" VALUES(51,'RssSync','{
  "sendUpdatesToClient": true,
  "isLongRunning": true,
  "updateScheduledTask": true,
  "requiresDiskAccess": false,
  "isExclusive": false,
  "isTypeExclusive": false,
  "name": "RssSync",
  "lastExecutionTime": "2024-10-30T03:06:00Z",
  "lastStartTime": "0001-01-01T04:57:00Z",
  "trigger": "scheduled",
  "suppressMessages": false
}',-1,2,'2024-10-30 03:36:20.800965Z','2024-10-30 03:36:20.8051083Z','2024-10-30 03:36:20.8264787Z','00:00:00.0213704',NULL,2,0);
INSERT INTO "Commands" VALUES(52,'MessagingCleanup','{
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "requiresDiskAccess": false,
  "isExclusive": false,
  "isTypeExclusive": false,
  "isLongRunning": false,
  "name": "MessagingCleanup",
  "lastExecutionTime": "2024-10-30T03:31:01Z",
  "lastStartTime": "2024-10-30T03:31:01Z",
  "trigger": "scheduled",
  "suppressMessages": false
}',-1,2,'2024-10-30 03:36:20.8073637Z','2024-10-30 03:36:20.8140347Z','2024-10-30 03:36:20.8179506Z','00:00:00.0039159',NULL,2,0);
INSERT INTO "Commands" VALUES(53,'RefreshMonitoredDownloads','{
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "requiresDiskAccess": false,
  "isExclusive": false,
  "isTypeExclusive": false,
  "isLongRunning": false,
  "name": "RefreshMonitoredDownloads",
  "lastExecutionTime": "2024-10-30T03:35:20Z",
  "lastStartTime": "2024-10-30T03:35:20Z",
  "trigger": "scheduled",
  "suppressMessages": false
}',1,2,'2024-10-30 03:36:50.8149872Z','2024-10-30 03:36:50.8212128Z','2024-10-30 03:36:50.8273996Z','00:00:00.0061868',NULL,2,0);
INSERT INTO "Commands" VALUES(54,'ProcessMonitoredDownloads','{
  "requiresDiskAccess": true,
  "isLongRunning": true,
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "isExclusive": false,
  "isTypeExclusive": false,
  "name": "ProcessMonitoredDownloads",
  "trigger": "unspecified",
  "suppressMessages": false
}',1,2,'2024-10-30 03:36:50.8247016Z','2024-10-30 03:36:50.8274163Z','2024-10-30 03:36:50.8385151Z','00:00:00.0110988',NULL,0,0);
INSERT INTO "Commands" VALUES(55,'ImportListSync','{
  "sendUpdatesToClient": true,
  "isTypeExclusive": true,
  "updateScheduledTask": true,
  "requiresDiskAccess": false,
  "isExclusive": false,
  "isLongRunning": false,
  "name": "ImportListSync",
  "lastExecutionTime": "2024-10-30T03:32:01Z",
  "lastStartTime": "2024-10-30T03:32:01Z",
  "trigger": "scheduled",
  "suppressMessages": false
}',-1,2,'2024-10-30 03:37:20.823221Z','2024-10-30 03:37:20.8318781Z','2024-10-30 03:37:20.8371136Z','00:00:00.0052355',NULL,2,0);
INSERT INTO "Commands" VALUES(56,'RefreshMonitoredDownloads','{
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "requiresDiskAccess": false,
  "isExclusive": false,
  "isTypeExclusive": false,
  "isLongRunning": false,
  "name": "RefreshMonitoredDownloads",
  "lastExecutionTime": "2024-10-30T03:36:50Z",
  "lastStartTime": "2024-10-30T03:36:50Z",
  "trigger": "scheduled",
  "suppressMessages": false
}',1,2,'2024-10-30 03:37:50.8319114Z','2024-10-30 03:37:50.8371952Z','2024-10-30 03:37:50.8450374Z','00:00:00.0078422',NULL,2,0);
INSERT INTO "Commands" VALUES(57,'ProcessMonitoredDownloads','{
  "requiresDiskAccess": true,
  "isLongRunning": true,
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "isExclusive": false,
  "isTypeExclusive": false,
  "name": "ProcessMonitoredDownloads",
  "trigger": "unspecified",
  "suppressMessages": false
}',1,2,'2024-10-30 03:37:50.8423Z','2024-10-30 03:37:50.8450567Z','2024-10-30 03:37:50.8562757Z','00:00:00.0112190',NULL,0,0);
INSERT INTO "Commands" VALUES(58,'RefreshMonitoredDownloads','{
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "requiresDiskAccess": false,
  "isExclusive": false,
  "isTypeExclusive": false,
  "isLongRunning": false,
  "name": "RefreshMonitoredDownloads",
  "lastExecutionTime": "2024-10-30T03:37:50Z",
  "lastStartTime": "2024-10-30T03:37:50Z",
  "trigger": "scheduled",
  "suppressMessages": false
}',1,2,'2024-10-30 03:39:20.8380586Z','2024-10-30 03:39:20.8440176Z','2024-10-30 03:39:20.8527055Z','00:00:00.0086879',NULL,2,0);
INSERT INTO "Commands" VALUES(59,'ProcessMonitoredDownloads','{
  "requiresDiskAccess": true,
  "isLongRunning": true,
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "isExclusive": false,
  "isTypeExclusive": false,
  "name": "ProcessMonitoredDownloads",
  "trigger": "unspecified",
  "suppressMessages": false
}',1,2,'2024-10-30 03:39:20.8480161Z','2024-10-30 03:39:20.8527096Z','2024-10-30 03:39:20.8556396Z','00:00:00.0029300',NULL,0,0);
INSERT INTO "Commands" VALUES(60,'RefreshMonitoredDownloads','{
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "requiresDiskAccess": false,
  "isExclusive": false,
  "isTypeExclusive": false,
  "isLongRunning": false,
  "name": "RefreshMonitoredDownloads",
  "lastExecutionTime": "2024-10-30T03:39:20Z",
  "lastStartTime": "2024-10-30T03:39:20Z",
  "trigger": "scheduled",
  "suppressMessages": false
}',1,2,'2024-10-30 03:40:50.844849Z','2024-10-30 03:40:50.8503178Z','2024-10-30 03:40:50.8562824Z','00:00:00.0059646',NULL,2,0);
INSERT INTO "Commands" VALUES(61,'ProcessMonitoredDownloads','{
  "requiresDiskAccess": true,
  "isLongRunning": true,
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "isExclusive": false,
  "isTypeExclusive": false,
  "name": "ProcessMonitoredDownloads",
  "trigger": "unspecified",
  "suppressMessages": false
}',1,2,'2024-10-30 03:40:50.8535153Z','2024-10-30 03:40:50.8562986Z','2024-10-30 03:40:50.8674244Z','00:00:00.0111258',NULL,0,0);
INSERT INTO "Commands" VALUES(62,'MessagingCleanup','{
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "requiresDiskAccess": false,
  "isExclusive": false,
  "isTypeExclusive": false,
  "isLongRunning": false,
  "name": "MessagingCleanup",
  "lastExecutionTime": "2024-10-30T03:36:20Z",
  "lastStartTime": "2024-10-30T03:36:20Z",
  "trigger": "scheduled",
  "suppressMessages": false
}',-1,2,'2024-10-30 03:41:20.8511229Z','2024-10-30 03:41:20.8563704Z','2024-10-30 03:41:20.859575Z','00:00:00.0032046',NULL,2,0);
INSERT INTO "Commands" VALUES(63,'ImportListSync','{
  "sendUpdatesToClient": true,
  "isTypeExclusive": true,
  "updateScheduledTask": true,
  "requiresDiskAccess": false,
  "isExclusive": false,
  "isLongRunning": false,
  "name": "ImportListSync",
  "lastExecutionTime": "2024-10-30T03:37:20Z",
  "lastStartTime": "2024-10-30T03:37:20Z",
  "trigger": "scheduled",
  "suppressMessages": false
}',-1,2,'2024-10-30 03:42:20.8583307Z','2024-10-30 03:42:20.8634829Z','2024-10-30 03:42:20.8670652Z','00:00:00.0035823',NULL,2,0);
INSERT INTO "Commands" VALUES(64,'RefreshMonitoredDownloads','{
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "requiresDiskAccess": false,
  "isExclusive": false,
  "isTypeExclusive": false,
  "isLongRunning": false,
  "name": "RefreshMonitoredDownloads",
  "lastExecutionTime": "2024-10-30T03:40:50Z",
  "lastStartTime": "2024-10-30T03:40:50Z",
  "trigger": "scheduled",
  "suppressMessages": false
}',1,2,'2024-10-30 03:42:20.863711Z','2024-10-30 03:42:20.8695453Z','2024-10-30 03:42:20.875214Z','00:00:00.0056687',NULL,2,0);
INSERT INTO "Commands" VALUES(65,'ProcessMonitoredDownloads','{
  "requiresDiskAccess": true,
  "isLongRunning": true,
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "isExclusive": false,
  "isTypeExclusive": false,
  "name": "ProcessMonitoredDownloads",
  "trigger": "unspecified",
  "suppressMessages": false
}',1,2,'2024-10-30 03:42:20.8726677Z','2024-10-30 03:42:20.8752352Z','2024-10-30 03:42:20.886363Z','00:00:00.0111278',NULL,0,0);
INSERT INTO "Commands" VALUES(66,'RefreshMonitoredDownloads','{
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "requiresDiskAccess": false,
  "isExclusive": false,
  "isTypeExclusive": false,
  "isLongRunning": false,
  "name": "RefreshMonitoredDownloads",
  "lastExecutionTime": "2024-10-30T03:42:20Z",
  "lastStartTime": "2024-10-30T03:42:20Z",
  "trigger": "scheduled",
  "suppressMessages": false
}',1,2,'2024-10-30 03:43:50.8717024Z','2024-10-30 03:43:50.8772666Z','2024-10-30 03:43:50.8828625Z','00:00:00.0055959',NULL,2,0);
INSERT INTO "Commands" VALUES(67,'ProcessMonitoredDownloads','{
  "requiresDiskAccess": true,
  "isLongRunning": true,
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "isExclusive": false,
  "isTypeExclusive": false,
  "name": "ProcessMonitoredDownloads",
  "trigger": "unspecified",
  "suppressMessages": false
}',1,2,'2024-10-30 03:43:50.8803286Z','2024-10-30 03:43:50.8828805Z','2024-10-30 03:43:50.8939384Z','00:00:00.0110579',NULL,0,0);
INSERT INTO "Commands" VALUES(68,'RefreshMonitoredDownloads','{
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "requiresDiskAccess": false,
  "isExclusive": false,
  "isTypeExclusive": false,
  "isLongRunning": false,
  "name": "RefreshMonitoredDownloads",
  "lastExecutionTime": "2024-10-30T03:43:50Z",
  "lastStartTime": "2024-10-30T03:43:50Z",
  "trigger": "scheduled",
  "suppressMessages": false
}',1,2,'2024-10-30 03:45:20.8789846Z','2024-10-30 03:45:20.886356Z','2024-10-30 03:45:20.892047Z','00:00:00.0056910',NULL,2,0);
INSERT INTO "Commands" VALUES(69,'ProcessMonitoredDownloads','{
  "requiresDiskAccess": true,
  "isLongRunning": true,
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "isExclusive": false,
  "isTypeExclusive": false,
  "name": "ProcessMonitoredDownloads",
  "trigger": "unspecified",
  "suppressMessages": false
}',1,2,'2024-10-30 03:45:20.8894265Z','2024-10-30 03:45:20.8920621Z','2024-10-30 03:45:20.9057046Z','00:00:00.0136425',NULL,0,0);
INSERT INTO "Commands" VALUES(70,'MessagingCleanup','{
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "requiresDiskAccess": false,
  "isExclusive": false,
  "isTypeExclusive": false,
  "isLongRunning": false,
  "name": "MessagingCleanup",
  "lastExecutionTime": "2024-10-30T03:41:20Z",
  "lastStartTime": "2024-10-30T03:41:20Z",
  "trigger": "scheduled",
  "suppressMessages": false
}',-1,2,'2024-10-30 03:46:20.8871948Z','2024-10-30 03:46:20.89298Z','2024-10-30 03:46:20.8964014Z','00:00:00.0034214',NULL,2,0);
INSERT INTO "Commands" VALUES(71,'RefreshMonitoredDownloads','{
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "requiresDiskAccess": false,
  "isExclusive": false,
  "isTypeExclusive": false,
  "isLongRunning": false,
  "name": "RefreshMonitoredDownloads",
  "lastExecutionTime": "2024-10-30T03:45:20Z",
  "lastStartTime": "2024-10-30T03:45:20Z",
  "trigger": "scheduled",
  "suppressMessages": false
}',1,2,'2024-10-30 03:46:50.8934365Z','2024-10-30 03:46:50.8966737Z','2024-10-30 03:46:50.9027283Z','00:00:00.0060546',NULL,2,0);
INSERT INTO "Commands" VALUES(72,'ProcessMonitoredDownloads','{
  "requiresDiskAccess": true,
  "isLongRunning": true,
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "isExclusive": false,
  "isTypeExclusive": false,
  "name": "ProcessMonitoredDownloads",
  "trigger": "unspecified",
  "suppressMessages": false
}',1,2,'2024-10-30 03:46:50.9000822Z','2024-10-30 03:46:50.9027351Z','2024-10-30 03:46:50.9135631Z','00:00:00.0108280',NULL,0,0);
INSERT INTO "Commands" VALUES(73,'ImportListSync','{
  "sendUpdatesToClient": true,
  "isTypeExclusive": true,
  "updateScheduledTask": true,
  "requiresDiskAccess": false,
  "isExclusive": false,
  "isLongRunning": false,
  "name": "ImportListSync",
  "lastExecutionTime": "2024-10-30T03:42:20Z",
  "lastStartTime": "2024-10-30T03:42:20Z",
  "trigger": "scheduled",
  "suppressMessages": false
}',-1,2,'2024-10-30 03:47:50.8970611Z','2024-10-30 03:47:50.8999821Z','2024-10-30 03:47:50.9058989Z','00:00:00.0059168',NULL,2,0);
INSERT INTO "Commands" VALUES(74,'RefreshMonitoredDownloads','{
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "requiresDiskAccess": false,
  "isExclusive": false,
  "isTypeExclusive": false,
  "isLongRunning": false,
  "name": "RefreshMonitoredDownloads",
  "lastExecutionTime": "2024-10-30T03:46:50Z",
  "lastStartTime": "2024-10-30T03:46:50Z",
  "trigger": "scheduled",
  "suppressMessages": false
}',1,2,'2024-10-30 03:48:20.9000941Z','2024-10-30 03:48:20.9053695Z','2024-10-30 03:48:20.9112389Z','00:00:00.0058694',NULL,2,0);
INSERT INTO "Commands" VALUES(75,'ProcessMonitoredDownloads','{
  "requiresDiskAccess": true,
  "isLongRunning": true,
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "isExclusive": false,
  "isTypeExclusive": false,
  "name": "ProcessMonitoredDownloads",
  "trigger": "unspecified",
  "suppressMessages": false
}',1,2,'2024-10-30 03:48:20.9085892Z','2024-10-30 03:48:20.9112852Z','2024-10-30 03:48:20.9255493Z','00:00:00.0142641',NULL,0,0);
INSERT INTO "Commands" VALUES(76,'RefreshMonitoredDownloads','{
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "requiresDiskAccess": false,
  "isExclusive": false,
  "isTypeExclusive": false,
  "isLongRunning": false,
  "name": "RefreshMonitoredDownloads",
  "lastExecutionTime": "2024-10-30T03:48:20Z",
  "lastStartTime": "2024-10-30T03:48:20Z",
  "trigger": "scheduled",
  "suppressMessages": false
}',1,2,'2024-10-30 03:49:50.9067937Z','2024-10-30 03:49:50.9098873Z','2024-10-30 03:49:50.9153133Z','00:00:00.0054260',NULL,2,0);
INSERT INTO "Commands" VALUES(77,'ProcessMonitoredDownloads','{
  "requiresDiskAccess": true,
  "isLongRunning": true,
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "isExclusive": false,
  "isTypeExclusive": false,
  "name": "ProcessMonitoredDownloads",
  "trigger": "unspecified",
  "suppressMessages": false
}',1,2,'2024-10-30 03:49:50.9127723Z','2024-10-30 03:49:50.9153197Z','2024-10-30 03:49:50.926551Z','00:00:00.0112313',NULL,0,0);
INSERT INTO "Commands" VALUES(78,'RefreshMonitoredDownloads','{
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "requiresDiskAccess": false,
  "isExclusive": false,
  "isTypeExclusive": false,
  "isLongRunning": false,
  "name": "RefreshMonitoredDownloads",
  "lastExecutionTime": "2024-10-30T03:49:50Z",
  "lastStartTime": "2024-10-30T03:49:50Z",
  "trigger": "scheduled",
  "suppressMessages": false
}',1,2,'2024-10-30 03:51:20.9112765Z','2024-10-30 03:51:20.9148035Z','2024-10-30 03:51:20.9426957Z','00:00:00.0278922',NULL,2,0);
INSERT INTO "Commands" VALUES(79,'MessagingCleanup','{
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "requiresDiskAccess": false,
  "isExclusive": false,
  "isTypeExclusive": false,
  "isLongRunning": false,
  "name": "MessagingCleanup",
  "lastExecutionTime": "2024-10-30T03:46:20Z",
  "lastStartTime": "2024-10-30T03:46:20Z",
  "trigger": "scheduled",
  "suppressMessages": false
}',-1,2,'2024-10-30 03:51:20.9149353Z','2024-10-30 03:51:20.9215446Z','2024-10-30 03:51:20.9266092Z','00:00:00.0050646',NULL,2,0);
INSERT INTO "Commands" VALUES(80,'ProcessMonitoredDownloads','{
  "requiresDiskAccess": true,
  "isLongRunning": true,
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "isExclusive": false,
  "isTypeExclusive": false,
  "name": "ProcessMonitoredDownloads",
  "trigger": "unspecified",
  "suppressMessages": false
}',1,2,'2024-10-30 03:51:20.9215594Z','2024-10-30 03:51:20.9427079Z','2024-10-30 03:51:20.9638449Z','00:00:00.0211370',NULL,0,0);
INSERT INTO "Commands" VALUES(81,'ImportListSync','{
  "sendUpdatesToClient": true,
  "isTypeExclusive": true,
  "updateScheduledTask": true,
  "requiresDiskAccess": false,
  "isExclusive": false,
  "isLongRunning": false,
  "name": "ImportListSync",
  "lastExecutionTime": "2024-10-30T03:47:50Z",
  "lastStartTime": "2024-10-30T03:47:50Z",
  "trigger": "scheduled",
  "suppressMessages": false
}',-1,2,'2024-10-30 03:52:50.9231318Z','2024-10-30 03:52:50.9258122Z','2024-10-30 03:52:50.9287739Z','00:00:00.0029617',NULL,2,0);
INSERT INTO "Commands" VALUES(82,'RefreshMonitoredDownloads','{
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "requiresDiskAccess": false,
  "isExclusive": false,
  "isTypeExclusive": false,
  "isLongRunning": false,
  "name": "RefreshMonitoredDownloads",
  "lastExecutionTime": "2024-10-30T03:51:20Z",
  "lastStartTime": "2024-10-30T03:51:20Z",
  "trigger": "scheduled",
  "suppressMessages": false
}',1,2,'2024-10-30 03:52:50.9261183Z','2024-10-30 03:52:50.9366505Z','2024-10-30 03:52:50.9504551Z','00:00:00.0138046',NULL,2,0);
INSERT INTO "Commands" VALUES(83,'ProcessMonitoredDownloads','{
  "requiresDiskAccess": true,
  "isLongRunning": true,
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "isExclusive": false,
  "isTypeExclusive": false,
  "name": "ProcessMonitoredDownloads",
  "trigger": "unspecified",
  "suppressMessages": false
}',1,2,'2024-10-30 03:52:50.9446547Z','2024-10-30 03:52:50.9504683Z','2024-10-30 03:52:50.9617224Z','00:00:00.0112541',NULL,0,0);
INSERT INTO "Commands" VALUES(84,'RefreshMonitoredDownloads','{
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "requiresDiskAccess": false,
  "isExclusive": false,
  "isTypeExclusive": false,
  "isLongRunning": false,
  "name": "RefreshMonitoredDownloads",
  "lastExecutionTime": "2024-10-30T03:52:50Z",
  "lastStartTime": "2024-10-30T03:52:50Z",
  "trigger": "scheduled",
  "suppressMessages": false
}',1,2,'2024-10-30 03:54:20.9378717Z','2024-10-30 03:54:20.9430823Z','2024-10-30 03:54:20.9492421Z','00:00:00.0061598',NULL,2,0);
INSERT INTO "Commands" VALUES(85,'ProcessMonitoredDownloads','{
  "requiresDiskAccess": true,
  "isLongRunning": true,
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "isExclusive": false,
  "isTypeExclusive": false,
  "name": "ProcessMonitoredDownloads",
  "trigger": "unspecified",
  "suppressMessages": false
}',1,2,'2024-10-30 03:54:20.946398Z','2024-10-30 03:54:20.9492879Z','2024-10-30 03:54:20.9628808Z','00:00:00.0135929',NULL,0,0);
INSERT INTO "Commands" VALUES(86,'RefreshMonitoredDownloads','{
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "requiresDiskAccess": false,
  "isExclusive": false,
  "isTypeExclusive": false,
  "isLongRunning": false,
  "name": "RefreshMonitoredDownloads",
  "lastExecutionTime": "2024-10-30T03:54:20Z",
  "lastStartTime": "2024-10-30T03:54:20Z",
  "trigger": "scheduled",
  "suppressMessages": false
}',1,2,'2024-10-30 03:55:50.9447269Z','2024-10-30 03:55:50.950193Z','2024-10-30 03:55:50.9560479Z','00:00:00.0058549',NULL,2,0);
INSERT INTO "Commands" VALUES(87,'ProcessMonitoredDownloads','{
  "requiresDiskAccess": true,
  "isLongRunning": true,
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "isExclusive": false,
  "isTypeExclusive": false,
  "name": "ProcessMonitoredDownloads",
  "trigger": "unspecified",
  "suppressMessages": false
}',1,2,'2024-10-30 03:55:50.9537095Z','2024-10-30 03:55:50.9560563Z','2024-10-30 03:55:50.9704534Z','00:00:00.0143971',NULL,0,0);
INSERT INTO "Commands" VALUES(88,'MessagingCleanup','{
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "requiresDiskAccess": false,
  "isExclusive": false,
  "isTypeExclusive": false,
  "isLongRunning": false,
  "name": "MessagingCleanup",
  "lastExecutionTime": "2024-10-30T03:51:20Z",
  "lastStartTime": "2024-10-30T03:51:20Z",
  "trigger": "scheduled",
  "suppressMessages": false
}',-1,2,'2024-10-30 03:56:20.9499937Z','2024-10-30 03:56:20.953033Z','2024-10-30 03:56:20.9559166Z','00:00:00.0028836',NULL,2,0);
INSERT INTO "Commands" VALUES(89,'RefreshMonitoredDownloads','{
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "requiresDiskAccess": false,
  "isExclusive": false,
  "isTypeExclusive": false,
  "isLongRunning": false,
  "name": "RefreshMonitoredDownloads",
  "lastExecutionTime": "2024-10-30T03:55:50Z",
  "lastStartTime": "2024-10-30T03:55:50Z",
  "trigger": "scheduled",
  "suppressMessages": false
}',1,2,'2024-10-30 03:57:20.9543105Z','2024-10-30 03:57:20.9593462Z','2024-10-30 03:57:20.9648315Z','00:00:00.0054853',NULL,2,0);
INSERT INTO "Commands" VALUES(90,'ProcessMonitoredDownloads','{
  "requiresDiskAccess": true,
  "isLongRunning": true,
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "isExclusive": false,
  "isTypeExclusive": false,
  "name": "ProcessMonitoredDownloads",
  "trigger": "unspecified",
  "suppressMessages": false
}',1,2,'2024-10-30 03:57:20.9622964Z','2024-10-30 03:57:20.964841Z','2024-10-30 03:57:20.9788748Z','00:00:00.0140338',NULL,0,0);
INSERT INTO "Commands" VALUES(91,'ImportListSync','{
  "sendUpdatesToClient": true,
  "isTypeExclusive": true,
  "updateScheduledTask": true,
  "requiresDiskAccess": false,
  "isExclusive": false,
  "isLongRunning": false,
  "name": "ImportListSync",
  "lastExecutionTime": "2024-10-30T03:52:50Z",
  "lastStartTime": "2024-10-30T03:52:50Z",
  "trigger": "scheduled",
  "suppressMessages": false
}',-1,2,'2024-10-30 03:57:50.9607473Z','2024-10-30 03:57:50.9663547Z','2024-10-30 03:57:50.9697639Z','00:00:00.0034092',NULL,2,0);
INSERT INTO "Commands" VALUES(92,'RefreshMonitoredDownloads','{
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "requiresDiskAccess": false,
  "isExclusive": false,
  "isTypeExclusive": false,
  "isLongRunning": false,
  "name": "RefreshMonitoredDownloads",
  "lastExecutionTime": "2024-10-30T03:57:20Z",
  "lastStartTime": "2024-10-30T03:57:20Z",
  "trigger": "scheduled",
  "suppressMessages": false
}',1,2,'2024-10-30 03:58:50.9667687Z','2024-10-30 03:58:50.9725088Z','2024-10-30 03:58:50.9798906Z','00:00:00.0073818',NULL,2,0);
INSERT INTO "Commands" VALUES(93,'ProcessMonitoredDownloads','{
  "requiresDiskAccess": true,
  "isLongRunning": true,
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "isExclusive": false,
  "isTypeExclusive": false,
  "name": "ProcessMonitoredDownloads",
  "trigger": "unspecified",
  "suppressMessages": false
}',1,2,'2024-10-30 03:58:50.9770836Z','2024-10-30 03:58:50.9799004Z','2024-10-30 03:58:50.9914573Z','00:00:00.0115569',NULL,0,0);
INSERT INTO "Commands" VALUES(94,'RefreshMonitoredDownloads','{
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "requiresDiskAccess": false,
  "isExclusive": false,
  "isTypeExclusive": false,
  "isLongRunning": false,
  "name": "RefreshMonitoredDownloads",
  "lastExecutionTime": "2024-10-30T03:58:50Z",
  "lastStartTime": "2024-10-30T03:58:50Z",
  "trigger": "scheduled",
  "suppressMessages": false
}',1,2,'2024-10-30 04:00:20.9737039Z','2024-10-30 04:00:20.9795305Z','2024-10-30 04:00:20.985492Z','00:00:00.0059615',NULL,2,0);
INSERT INTO "Commands" VALUES(95,'ProcessMonitoredDownloads','{
  "requiresDiskAccess": true,
  "isLongRunning": true,
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "isExclusive": false,
  "isTypeExclusive": false,
  "name": "ProcessMonitoredDownloads",
  "trigger": "unspecified",
  "suppressMessages": false
}',1,2,'2024-10-30 04:00:20.9828583Z','2024-10-30 04:00:20.9855032Z','2024-10-30 04:00:20.9966949Z','00:00:00.0111917',NULL,0,0);
INSERT INTO "Commands" VALUES(96,'MessagingCleanup','{
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "requiresDiskAccess": false,
  "isExclusive": false,
  "isTypeExclusive": false,
  "isLongRunning": false,
  "name": "MessagingCleanup",
  "lastExecutionTime": "2024-10-30T03:56:20Z",
  "lastStartTime": "2024-10-30T03:56:20Z",
  "trigger": "scheduled",
  "suppressMessages": false
}',-1,2,'2024-10-30 04:01:20.9799944Z','2024-10-30 04:01:20.9855905Z','2024-10-30 04:01:20.988705Z','00:00:00.0031145',NULL,2,0);
INSERT INTO "Commands" VALUES(97,'RefreshMonitoredDownloads','{
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "requiresDiskAccess": false,
  "isExclusive": false,
  "isTypeExclusive": false,
  "isLongRunning": false,
  "name": "RefreshMonitoredDownloads",
  "lastExecutionTime": "2024-10-30T04:00:20Z",
  "lastStartTime": "2024-10-30T04:00:20Z",
  "trigger": "scheduled",
  "suppressMessages": false
}',1,2,'2024-10-30 04:01:50.9865427Z','2024-10-30 04:01:50.9919441Z','2024-10-30 04:01:50.9977592Z','00:00:00.0058151',NULL,2,0);
INSERT INTO "Commands" VALUES(98,'ProcessMonitoredDownloads','{
  "requiresDiskAccess": true,
  "isLongRunning": true,
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "isExclusive": false,
  "isTypeExclusive": false,
  "name": "ProcessMonitoredDownloads",
  "trigger": "unspecified",
  "suppressMessages": false
}',1,2,'2024-10-30 04:01:50.9951571Z','2024-10-30 04:01:50.9977683Z','2024-10-30 04:01:51.0111318Z','00:00:00.0133635',NULL,0,0);
INSERT INTO "Commands" VALUES(99,'ImportListSync','{
  "sendUpdatesToClient": true,
  "isTypeExclusive": true,
  "updateScheduledTask": true,
  "requiresDiskAccess": false,
  "isExclusive": false,
  "isLongRunning": false,
  "name": "ImportListSync",
  "lastExecutionTime": "2024-10-30T03:57:50Z",
  "lastStartTime": "2024-10-30T03:57:50Z",
  "trigger": "scheduled",
  "suppressMessages": false
}',-1,2,'2024-10-30 04:02:50.9925878Z','2024-10-30 04:02:50.9964855Z','2024-10-30 04:02:51.0003336Z','00:00:00.0038481',NULL,2,0);
INSERT INTO "Commands" VALUES(100,'RefreshMonitoredDownloads','{
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "requiresDiskAccess": false,
  "isExclusive": false,
  "isTypeExclusive": false,
  "isLongRunning": false,
  "name": "RefreshMonitoredDownloads",
  "lastExecutionTime": "2024-10-30T04:01:51Z",
  "lastStartTime": "2024-10-30T04:01:50Z",
  "trigger": "scheduled",
  "suppressMessages": false
}',1,2,'2024-10-30 04:03:20.9970786Z','2024-10-30 04:03:21.0026023Z','2024-10-30 04:03:21.0092114Z','00:00:00.0066091',NULL,2,0);
INSERT INTO "Commands" VALUES(101,'ProcessMonitoredDownloads','{
  "requiresDiskAccess": true,
  "isLongRunning": true,
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "isExclusive": false,
  "isTypeExclusive": false,
  "name": "ProcessMonitoredDownloads",
  "trigger": "unspecified",
  "suppressMessages": false
}',1,2,'2024-10-30 04:03:21.0064344Z','2024-10-30 04:03:21.0092254Z','2024-10-30 04:03:21.0199252Z','00:00:00.0106998',NULL,0,0);
INSERT INTO "Commands" VALUES(102,'RefreshMonitoredDownloads','{
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "requiresDiskAccess": false,
  "isExclusive": false,
  "isTypeExclusive": false,
  "isLongRunning": false,
  "name": "RefreshMonitoredDownloads",
  "lastExecutionTime": "2024-10-30T04:03:21Z",
  "lastStartTime": "2024-10-30T04:03:21Z",
  "trigger": "scheduled",
  "suppressMessages": false
}',1,2,'2024-10-30 04:04:51.0032437Z','2024-10-30 04:04:51.0091951Z','2024-10-30 04:04:51.0156587Z','00:00:00.0064636',NULL,2,0);
INSERT INTO "Commands" VALUES(103,'ProcessMonitoredDownloads','{
  "requiresDiskAccess": true,
  "isLongRunning": true,
  "sendUpdatesToClient": false,
  "updateScheduledTask": true,
  "isExclusive": false,
  "isTypeExclusive": false,
  "name": "ProcessMonitoredDownloads",
  "trigger": "unspecified",
  "suppressMessages": false
}',1,2,'2024-10-30 04:04:51.01292Z','2024-10-30 04:04:51.015716Z','2024-10-30 04:04:51.0267441Z','00:00:00.0110281',NULL,0,0);
CREATE TABLE "Config" ("Id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, "Key" TEXT NOT NULL, "Value" TEXT NOT NULL);
INSERT INTO "Config" VALUES(1,'plexclientidentifier','4d2c38f5-0d6d-4010-afee-a5fe35384075');
INSERT INTO "Config" VALUES(2,'rijndaelpassphrase','fbc1f893-5bd1-4477-8958-3f2b0c6bc98b');
INSERT INTO "Config" VALUES(3,'hmacpassphrase','753dd4df-f0c3-477c-9d11-1b97d2a93303');
INSERT INTO "Config" VALUES(4,'rijndaelsalt','6f014383-6db9-400c-bcaa-a8468228c171');
INSERT INTO "Config" VALUES(5,'hmacsalt','7eb40c71-ad7d-4dfd-92d0-ce5e27f7990a');
CREATE TABLE "Credits" ("Id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, "CreditTmdbId" TEXT NOT NULL, "PersonTmdbId" INTEGER NOT NULL, "Name" TEXT NOT NULL, "Images" TEXT NOT NULL, "Character" TEXT, "Order" INTEGER NOT NULL, "Job" TEXT, "Department" TEXT, "Type" INTEGER NOT NULL, "MovieMetadataId" INTEGER NOT NULL);
CREATE TABLE "CustomFilters" ("Id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, "Type" TEXT NOT NULL, "Label" TEXT NOT NULL, "Filters" TEXT NOT NULL);
CREATE TABLE "CustomFormats" ("Id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, "Name" TEXT NOT NULL, "Specifications" TEXT NOT NULL, "IncludeCustomFormatWhenRenaming" INTEGER NOT NULL);
CREATE TABLE "DelayProfiles" ("Id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, "EnableUsenet" INTEGER NOT NULL, "EnableTorrent" INTEGER NOT NULL, "PreferredProtocol" INTEGER NOT NULL, "UsenetDelay" INTEGER NOT NULL, "TorrentDelay" INTEGER NOT NULL, "Order" INTEGER NOT NULL, "Tags" TEXT NOT NULL, "BypassIfHighestQuality" INTEGER NOT NULL DEFAULT 0, "BypassIfAboveCustomFormatScore" INTEGER NOT NULL DEFAULT 0, "MinimumCustomFormatScore" INTEGER);
INSERT INTO "DelayProfiles" VALUES(1,1,1,1,0,0,2147483647,'[]',1,0,NULL);
CREATE TABLE "DownloadClientStatus" ("Id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, "ProviderId" INTEGER NOT NULL, "InitialFailure" DATETIME, "MostRecentFailure" DATETIME, "EscalationLevel" INTEGER NOT NULL, "DisabledTill" DATETIME);
CREATE TABLE "DownloadClients" ("Id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, "Enable" INTEGER NOT NULL, "Name" TEXT NOT NULL, "Implementation" TEXT NOT NULL, "Settings" TEXT NOT NULL, "ConfigContract" TEXT NOT NULL, "Priority" INTEGER NOT NULL DEFAULT 1, "RemoveCompletedDownloads" INTEGER NOT NULL DEFAULT 1, "RemoveFailedDownloads" INTEGER NOT NULL DEFAULT 1, "Tags" TEXT);
CREATE TABLE "DownloadHistory" ("Id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, "EventType" INTEGER NOT NULL, "MovieId" INTEGER NOT NULL, "DownloadId" TEXT NOT NULL, "SourceTitle" TEXT NOT NULL, "Date" DATETIME NOT NULL, "Protocol" INTEGER, "IndexerId" INTEGER, "DownloadClientId" INTEGER, "Release" TEXT, "Data" TEXT);
CREATE TABLE "ExtraFiles" ("Id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, "MovieId" INTEGER NOT NULL, "MovieFileId" INTEGER NOT NULL, "RelativePath" TEXT NOT NULL, "Extension" TEXT NOT NULL, "Added" DATETIME NOT NULL, "LastUpdated" DATETIME NOT NULL);
CREATE TABLE "History" ("Id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, "SourceTitle" TEXT NOT NULL, "Date" DATETIME NOT NULL, "Quality" TEXT NOT NULL, "Data" TEXT NOT NULL, "EventType" INTEGER, "DownloadId" TEXT, "MovieId" INTEGER NOT NULL, "Languages" TEXT NOT NULL);
CREATE TABLE "ImportExclusions" ("Id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, "TmdbId" INTEGER NOT NULL, "MovieTitle" TEXT, "MovieYear" INTEGER DEFAULT 0);
CREATE TABLE "ImportListMovies" ("Id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, "ListId" INTEGER NOT NULL, "MovieMetadataId" INTEGER NOT NULL);
CREATE TABLE "ImportListStatus" ("Id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, "ProviderId" INTEGER NOT NULL, "InitialFailure" DATETIME, "MostRecentFailure" DATETIME, "EscalationLevel" INTEGER NOT NULL, "DisabledTill" DATETIME, "LastInfoSync" DATETIME);
CREATE TABLE "ImportLists" ("Id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, "Enabled" INTEGER NOT NULL, "Name" TEXT NOT NULL, "Implementation" TEXT NOT NULL, "ConfigContract" TEXT, "Settings" TEXT, "EnableAuto" INTEGER NOT NULL, "RootFolderPath" TEXT NOT NULL, "QualityProfileId" INTEGER NOT NULL, "MinimumAvailability" INTEGER NOT NULL, "Tags" TEXT, "SearchOnAdd" INTEGER NOT NULL, "Monitor" INTEGER NOT NULL);
CREATE TABLE "IndexerStatus" ("Id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, "ProviderId" INTEGER NOT NULL, "InitialFailure" DATETIME, "MostRecentFailure" DATETIME, "EscalationLevel" INTEGER NOT NULL, "DisabledTill" DATETIME, "LastRssSyncReleaseInfo" TEXT, "Cookies" TEXT, "CookiesExpirationDate" DATETIME);
CREATE TABLE "Indexers" ("Id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, "Name" TEXT NOT NULL, "Implementation" TEXT NOT NULL, "Settings" TEXT, "ConfigContract" TEXT, "EnableRss" INTEGER, "EnableAutomaticSearch" INTEGER, "EnableInteractiveSearch" INTEGER NOT NULL, "Priority" INTEGER NOT NULL DEFAULT 25, "Tags" TEXT, "DownloadClientId" INTEGER NOT NULL DEFAULT 0);
CREATE TABLE "Metadata" ("Id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, "Enable" INTEGER NOT NULL, "Name" TEXT NOT NULL, "Implementation" TEXT NOT NULL, "Settings" TEXT NOT NULL, "ConfigContract" TEXT NOT NULL);
INSERT INTO "Metadata" VALUES(1,0,'Kodi (XBMC) / Emby','XbmcMetadata','{
  "movieMetadata": true,
  "movieMetadataURL": false,
  "movieMetadataLanguage": 1,
  "movieImages": true,
  "useMovieNfo": false,
  "addCollectionName": true,
  "isValid": true
}','XbmcMetadataSettings');
INSERT INTO "Metadata" VALUES(2,0,'WDTV','WdtvMetadata','{
  "movieMetadata": true,
  "movieImages": true,
  "isValid": true
}','WdtvMetadataSettings');
INSERT INTO "Metadata" VALUES(3,0,'Roksbox','RoksboxMetadata','{
  "movieMetadata": true,
  "movieImages": true,
  "isValid": true
}','RoksboxMetadataSettings');
INSERT INTO "Metadata" VALUES(4,0,'Emby (Legacy)','MediaBrowserMetadata','{
  "movieMetadata": true,
  "isValid": true
}','MediaBrowserMetadataSettings');
CREATE TABLE "MetadataFiles" ("Id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, "MovieId" INTEGER NOT NULL, "Consumer" TEXT NOT NULL, "Type" INTEGER NOT NULL, "RelativePath" TEXT NOT NULL, "LastUpdated" DATETIME NOT NULL, "MovieFileId" INTEGER, "Hash" TEXT, "Added" DATETIME, "Extension" TEXT NOT NULL);
CREATE TABLE "MovieFiles" ("Id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, "MovieId" INTEGER NOT NULL, "Quality" TEXT NOT NULL, "Size" INTEGER NOT NULL, "DateAdded" DATETIME NOT NULL, "SceneName" TEXT, "MediaInfo" TEXT, "ReleaseGroup" TEXT, "RelativePath" TEXT, "Edition" TEXT, "Languages" TEXT NOT NULL, "IndexerFlags" INTEGER NOT NULL, "OriginalFilePath" TEXT);
CREATE TABLE "MovieMetadata" ("Id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, "TmdbId" INTEGER NOT NULL, "ImdbId" TEXT, "Images" TEXT NOT NULL, "Genres" TEXT, "Title" TEXT NOT NULL, "SortTitle" TEXT, "CleanTitle" TEXT, "OriginalTitle" TEXT, "CleanOriginalTitle" TEXT, "OriginalLanguage" INTEGER NOT NULL, "Status" INTEGER NOT NULL, "LastInfoSync" DATETIME, "Runtime" INTEGER NOT NULL, "InCinemas" DATETIME, "PhysicalRelease" DATETIME, "DigitalRelease" DATETIME, "Year" INTEGER, "SecondaryYear" INTEGER, "Ratings" TEXT, "Recommendations" TEXT NOT NULL, "Certification" TEXT, "YouTubeTrailerId" TEXT, "Studio" TEXT, "Overview" TEXT, "Website" TEXT, "Popularity" NUMERIC, "CollectionTmdbId" INTEGER, "CollectionTitle" TEXT);
CREATE TABLE "MovieTranslations" ("Id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, "Title" TEXT, "CleanTitle" TEXT, "Overview" TEXT, "Language" INTEGER NOT NULL, "MovieMetadataId" INTEGER NOT NULL);
CREATE TABLE "Movies" ("Id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, "Path" TEXT NOT NULL, "Monitored" INTEGER NOT NULL, "QualityProfileId" INTEGER NOT NULL, "Added" DATETIME, "Tags" TEXT, "AddOptions" TEXT, "MovieFileId" INTEGER NOT NULL, "MinimumAvailability" INTEGER NOT NULL, "MovieMetadataId" INTEGER NOT NULL, "LastSearchTime" DATETIME);
CREATE TABLE "NamingConfig" ("Id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, "MultiEpisodeStyle" INTEGER NOT NULL, "ReplaceIllegalCharacters" INTEGER NOT NULL, "StandardMovieFormat" TEXT, "MovieFolderFormat" TEXT, "ColonReplacementFormat" INTEGER NOT NULL, "RenameMovies" INTEGER NOT NULL);
INSERT INTO "NamingConfig" VALUES(1,0,1,'{Movie Title} ({Release Year}) {Quality Full}','{Movie Title} ({Release Year})',0,0);
CREATE TABLE "NotificationStatus" ("Id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, "ProviderId" INTEGER NOT NULL, "InitialFailure" DATETIME, "MostRecentFailure" DATETIME, "EscalationLevel" INTEGER NOT NULL, "DisabledTill" DATETIME);
CREATE TABLE "Notifications" ("Id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, "Name" TEXT NOT NULL, "OnGrab" INTEGER NOT NULL, "OnDownload" INTEGER NOT NULL, "Settings" TEXT NOT NULL, "Implementation" TEXT NOT NULL, "ConfigContract" TEXT, "OnUpgrade" INTEGER, "Tags" TEXT, "OnRename" INTEGER NOT NULL, "OnHealthIssue" INTEGER NOT NULL, "IncludeHealthWarnings" INTEGER NOT NULL, "OnMovieDelete" INTEGER NOT NULL, "OnMovieFileDelete" INTEGER NOT NULL DEFAULT 0, "OnMovieFileDeleteForUpgrade" INTEGER NOT NULL DEFAULT 0, "OnApplicationUpdate" INTEGER NOT NULL DEFAULT 0, "OnMovieAdded" INTEGER NOT NULL DEFAULT 0, "OnHealthRestored" INTEGER NOT NULL DEFAULT 0, "OnManualInteractionRequired" INTEGER NOT NULL DEFAULT 0);
CREATE TABLE "PendingReleases" ("Id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, "Title" TEXT NOT NULL, "Added" DATETIME NOT NULL, "Release" TEXT NOT NULL, "MovieId" INTEGER NOT NULL, "ParsedMovieInfo" TEXT, "Reason" INTEGER NOT NULL, "AdditionalInfo" TEXT);
CREATE TABLE "QualityDefinitions" ("Id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, "Quality" INTEGER NOT NULL, "Title" TEXT NOT NULL, "MinSize" NUMERIC, "MaxSize" NUMERIC, "PreferredSize" NUMERIC);
INSERT INTO "QualityDefinitions" VALUES(1,0,'Unknown',0,100,95);
INSERT INTO "QualityDefinitions" VALUES(2,24,'WORKPRINT',0,100,95);
INSERT INTO "QualityDefinitions" VALUES(3,25,'CAM',0,100,95);
INSERT INTO "QualityDefinitions" VALUES(4,26,'TELESYNC',0,100,95);
INSERT INTO "QualityDefinitions" VALUES(5,27,'TELECINE',0,100,95);
INSERT INTO "QualityDefinitions" VALUES(6,29,'REGIONAL',0,100,95);
INSERT INTO "QualityDefinitions" VALUES(7,28,'DVDSCR',0,100,95);
INSERT INTO "QualityDefinitions" VALUES(8,1,'SDTV',0,100,95);
INSERT INTO "QualityDefinitions" VALUES(9,2,'DVD',0,100,95);
INSERT INTO "QualityDefinitions" VALUES(10,23,'DVD-R',0,100,95);
INSERT INTO "QualityDefinitions" VALUES(11,8,'WEBDL-480p',0,100,95);
INSERT INTO "QualityDefinitions" VALUES(12,12,'WEBRip-480p',0,100,95);
INSERT INTO "QualityDefinitions" VALUES(13,20,'Bluray-480p',0,100,95);
INSERT INTO "QualityDefinitions" VALUES(14,21,'Bluray-576p',0,100,95);
INSERT INTO "QualityDefinitions" VALUES(15,4,'HDTV-720p',0,100,95);
INSERT INTO "QualityDefinitions" VALUES(16,5,'WEBDL-720p',0,100,95);
INSERT INTO "QualityDefinitions" VALUES(17,14,'WEBRip-720p',0,100,95);
INSERT INTO "QualityDefinitions" VALUES(18,6,'Bluray-720p',0,100,95);
INSERT INTO "QualityDefinitions" VALUES(19,9,'HDTV-1080p',0,100,95);
INSERT INTO "QualityDefinitions" VALUES(20,3,'WEBDL-1080p',0,100,95);
INSERT INTO "QualityDefinitions" VALUES(21,15,'WEBRip-1080p',0,100,95);
INSERT INTO "QualityDefinitions" VALUES(22,7,'Bluray-1080p',0,NULL,NULL);
INSERT INTO "QualityDefinitions" VALUES(23,30,'Remux-1080p',0,NULL,NULL);
INSERT INTO "QualityDefinitions" VALUES(24,16,'HDTV-2160p',0,NULL,NULL);
INSERT INTO "QualityDefinitions" VALUES(25,18,'WEBDL-2160p',0,NULL,NULL);
INSERT INTO "QualityDefinitions" VALUES(26,17,'WEBRip-2160p',0,NULL,NULL);
INSERT INTO "QualityDefinitions" VALUES(27,19,'Bluray-2160p',0,NULL,NULL);
INSERT INTO "QualityDefinitions" VALUES(28,31,'Remux-2160p',0,NULL,NULL);
INSERT INTO "QualityDefinitions" VALUES(29,22,'BR-DISK',0,NULL,NULL);
INSERT INTO "QualityDefinitions" VALUES(30,10,'Raw-HD',0,NULL,NULL);
CREATE TABLE "QualityProfiles" ("Id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, "Name" TEXT NOT NULL, "Cutoff" INTEGER NOT NULL, "Items" TEXT NOT NULL, "Language" INTEGER, "FormatItems" TEXT NOT NULL, "UpgradeAllowed" INTEGER, "MinFormatScore" INTEGER NOT NULL, "CutoffFormatScore" INTEGER NOT NULL, "MinUpgradeFormatScore" INTEGER NOT NULL DEFAULT 1);
INSERT INTO "QualityProfiles" VALUES(1,'Any',20,'[
  {
    "quality": 0,
    "items": [],
    "allowed": false
  },
  {
    "quality": 24,
    "items": [],
    "allowed": true
  },
  {
    "quality": 25,
    "items": [],
    "allowed": true
  },
  {
    "quality": 26,
    "items": [],
    "allowed": true
  },
  {
    "quality": 27,
    "items": [],
    "allowed": true
  },
  {
    "quality": 29,
    "items": [],
    "allowed": true
  },
  {
    "quality": 28,
    "items": [],
    "allowed": true
  },
  {
    "quality": 1,
    "items": [],
    "allowed": true
  },
  {
    "quality": 2,
    "items": [],
    "allowed": true
  },
  {
    "quality": 23,
    "items": [],
    "allowed": true
  },
  {
    "id": 1000,
    "name": "WEB 480p",
    "items": [
      {
        "quality": 8,
        "items": [],
        "allowed": true
      },
      {
        "quality": 12,
        "items": [],
        "allowed": true
      }
    ],
    "allowed": true
  },
  {
    "quality": 20,
    "items": [],
    "allowed": true
  },
  {
    "quality": 21,
    "items": [],
    "allowed": true
  },
  {
    "quality": 4,
    "items": [],
    "allowed": true
  },
  {
    "id": 1001,
    "name": "WEB 720p",
    "items": [
      {
        "quality": 5,
        "items": [],
        "allowed": true
      },
      {
        "quality": 14,
        "items": [],
        "allowed": true
      }
    ],
    "allowed": true
  },
  {
    "quality": 6,
    "items": [],
    "allowed": true
  },
  {
    "quality": 9,
    "items": [],
    "allowed": true
  },
  {
    "id": 1002,
    "name": "WEB 1080p",
    "items": [
      {
        "quality": 3,
        "items": [],
        "allowed": true
      },
      {
        "quality": 15,
        "items": [],
        "allowed": true
      }
    ],
    "allowed": true
  },
  {
    "quality": 7,
    "items": [],
    "allowed": true
  },
  {
    "quality": 30,
    "items": [],
    "allowed": true
  },
  {
    "quality": 16,
    "items": [],
    "allowed": true
  },
  {
    "id": 1003,
    "name": "WEB 2160p",
    "items": [
      {
        "quality": 18,
        "items": [],
        "allowed": true
      },
      {
        "quality": 17,
        "items": [],
        "allowed": true
      }
    ],
    "allowed": true
  },
  {
    "quality": 19,
    "items": [],
    "allowed": true
  },
  {
    "quality": 31,
    "items": [],
    "allowed": true
  },
  {
    "quality": 22,
    "items": [],
    "allowed": true
  },
  {
    "quality": 10,
    "items": [],
    "allowed": false
  }
]',1,'[]',0,0,0,1);
INSERT INTO "QualityProfiles" VALUES(2,'SD',20,'[
  {
    "quality": 0,
    "items": [],
    "allowed": false
  },
  {
    "quality": 24,
    "items": [],
    "allowed": true
  },
  {
    "quality": 25,
    "items": [],
    "allowed": true
  },
  {
    "quality": 26,
    "items": [],
    "allowed": true
  },
  {
    "quality": 27,
    "items": [],
    "allowed": true
  },
  {
    "quality": 29,
    "items": [],
    "allowed": true
  },
  {
    "quality": 28,
    "items": [],
    "allowed": true
  },
  {
    "quality": 1,
    "items": [],
    "allowed": true
  },
  {
    "quality": 2,
    "items": [],
    "allowed": true
  },
  {
    "quality": 23,
    "items": [],
    "allowed": false
  },
  {
    "id": 1000,
    "name": "WEB 480p",
    "items": [
      {
        "quality": 8,
        "items": [],
        "allowed": true
      },
      {
        "quality": 12,
        "items": [],
        "allowed": true
      }
    ],
    "allowed": true
  },
  {
    "quality": 20,
    "items": [],
    "allowed": true
  },
  {
    "quality": 21,
    "items": [],
    "allowed": true
  },
  {
    "quality": 4,
    "items": [],
    "allowed": false
  },
  {
    "id": 1001,
    "name": "WEB 720p",
    "items": [
      {
        "quality": 5,
        "items": [],
        "allowed": false
      },
      {
        "quality": 14,
        "items": [],
        "allowed": false
      }
    ],
    "allowed": false
  },
  {
    "quality": 6,
    "items": [],
    "allowed": false
  },
  {
    "quality": 9,
    "items": [],
    "allowed": false
  },
  {
    "id": 1002,
    "name": "WEB 1080p",
    "items": [
      {
        "quality": 3,
        "items": [],
        "allowed": false
      },
      {
        "quality": 15,
        "items": [],
        "allowed": false
      }
    ],
    "allowed": false
  },
  {
    "quality": 7,
    "items": [],
    "allowed": false
  },
  {
    "quality": 30,
    "items": [],
    "allowed": false
  },
  {
    "quality": 16,
    "items": [],
    "allowed": false
  },
  {
    "id": 1003,
    "name": "WEB 2160p",
    "items": [
      {
        "quality": 18,
        "items": [],
        "allowed": false
      },
      {
        "quality": 17,
        "items": [],
        "allowed": false
      }
    ],
    "allowed": false
  },
  {
    "quality": 19,
    "items": [],
    "allowed": false
  },
  {
    "quality": 31,
    "items": [],
    "allowed": false
  },
  {
    "quality": 22,
    "items": [],
    "allowed": false
  },
  {
    "quality": 10,
    "items": [],
    "allowed": false
  }
]',1,'[]',0,0,0,1);
INSERT INTO "QualityProfiles" VALUES(3,'HD-720p',6,'[
  {
    "quality": 0,
    "items": [],
    "allowed": false
  },
  {
    "quality": 24,
    "items": [],
    "allowed": false
  },
  {
    "quality": 25,
    "items": [],
    "allowed": false
  },
  {
    "quality": 26,
    "items": [],
    "allowed": false
  },
  {
    "quality": 27,
    "items": [],
    "allowed": false
  },
  {
    "quality": 29,
    "items": [],
    "allowed": false
  },
  {
    "quality": 28,
    "items": [],
    "allowed": false
  },
  {
    "quality": 1,
    "items": [],
    "allowed": false
  },
  {
    "quality": 2,
    "items": [],
    "allowed": false
  },
  {
    "quality": 23,
    "items": [],
    "allowed": false
  },
  {
    "id": 1000,
    "name": "WEB 480p",
    "items": [
      {
        "quality": 8,
        "items": [],
        "allowed": false
      },
      {
        "quality": 12,
        "items": [],
        "allowed": false
      }
    ],
    "allowed": false
  },
  {
    "quality": 20,
    "items": [],
    "allowed": false
  },
  {
    "quality": 21,
    "items": [],
    "allowed": false
  },
  {
    "quality": 4,
    "items": [],
    "allowed": true
  },
  {
    "id": 1001,
    "name": "WEB 720p",
    "items": [
      {
        "quality": 5,
        "items": [],
        "allowed": true
      },
      {
        "quality": 14,
        "items": [],
        "allowed": true
      }
    ],
    "allowed": true
  },
  {
    "quality": 6,
    "items": [],
    "allowed": true
  },
  {
    "quality": 9,
    "items": [],
    "allowed": false
  },
  {
    "id": 1002,
    "name": "WEB 1080p",
    "items": [
      {
        "quality": 3,
        "items": [],
        "allowed": false
      },
      {
        "quality": 15,
        "items": [],
        "allowed": false
      }
    ],
    "allowed": false
  },
  {
    "quality": 7,
    "items": [],
    "allowed": false
  },
  {
    "quality": 30,
    "items": [],
    "allowed": false
  },
  {
    "quality": 16,
    "items": [],
    "allowed": false
  },
  {
    "id": 1003,
    "name": "WEB 2160p",
    "items": [
      {
        "quality": 18,
        "items": [],
        "allowed": false
      },
      {
        "quality": 17,
        "items": [],
        "allowed": false
      }
    ],
    "allowed": false
  },
  {
    "quality": 19,
    "items": [],
    "allowed": false
  },
  {
    "quality": 31,
    "items": [],
    "allowed": false
  },
  {
    "quality": 22,
    "items": [],
    "allowed": false
  },
  {
    "quality": 10,
    "items": [],
    "allowed": false
  }
]',1,'[]',0,0,0,1);
INSERT INTO "QualityProfiles" VALUES(4,'HD-1080p',7,'[
  {
    "quality": 0,
    "items": [],
    "allowed": false
  },
  {
    "quality": 24,
    "items": [],
    "allowed": false
  },
  {
    "quality": 25,
    "items": [],
    "allowed": false
  },
  {
    "quality": 26,
    "items": [],
    "allowed": false
  },
  {
    "quality": 27,
    "items": [],
    "allowed": false
  },
  {
    "quality": 29,
    "items": [],
    "allowed": false
  },
  {
    "quality": 28,
    "items": [],
    "allowed": false
  },
  {
    "quality": 1,
    "items": [],
    "allowed": false
  },
  {
    "quality": 2,
    "items": [],
    "allowed": false
  },
  {
    "quality": 23,
    "items": [],
    "allowed": false
  },
  {
    "id": 1000,
    "name": "WEB 480p",
    "items": [
      {
        "quality": 8,
        "items": [],
        "allowed": false
      },
      {
        "quality": 12,
        "items": [],
        "allowed": false
      }
    ],
    "allowed": false
  },
  {
    "quality": 20,
    "items": [],
    "allowed": false
  },
  {
    "quality": 21,
    "items": [],
    "allowed": false
  },
  {
    "quality": 4,
    "items": [],
    "allowed": false
  },
  {
    "id": 1001,
    "name": "WEB 720p",
    "items": [
      {
        "quality": 5,
        "items": [],
        "allowed": false
      },
      {
        "quality": 14,
        "items": [],
        "allowed": false
      }
    ],
    "allowed": false
  },
  {
    "quality": 6,
    "items": [],
    "allowed": false
  },
  {
    "quality": 9,
    "items": [],
    "allowed": true
  },
  {
    "id": 1002,
    "name": "WEB 1080p",
    "items": [
      {
        "quality": 3,
        "items": [],
        "allowed": true
      },
      {
        "quality": 15,
        "items": [],
        "allowed": true
      }
    ],
    "allowed": true
  },
  {
    "quality": 7,
    "items": [],
    "allowed": true
  },
  {
    "quality": 30,
    "items": [],
    "allowed": true
  },
  {
    "quality": 16,
    "items": [],
    "allowed": false
  },
  {
    "id": 1003,
    "name": "WEB 2160p",
    "items": [
      {
        "quality": 18,
        "items": [],
        "allowed": false
      },
      {
        "quality": 17,
        "items": [],
        "allowed": false
      }
    ],
    "allowed": false
  },
  {
    "quality": 19,
    "items": [],
    "allowed": false
  },
  {
    "quality": 31,
    "items": [],
    "allowed": false
  },
  {
    "quality": 22,
    "items": [],
    "allowed": false
  },
  {
    "quality": 10,
    "items": [],
    "allowed": false
  }
]',1,'[]',0,0,0,1);
INSERT INTO "QualityProfiles" VALUES(5,'Ultra-HD',31,'[
  {
    "quality": 0,
    "items": [],
    "allowed": false
  },
  {
    "quality": 24,
    "items": [],
    "allowed": false
  },
  {
    "quality": 25,
    "items": [],
    "allowed": false
  },
  {
    "quality": 26,
    "items": [],
    "allowed": false
  },
  {
    "quality": 27,
    "items": [],
    "allowed": false
  },
  {
    "quality": 29,
    "items": [],
    "allowed": false
  },
  {
    "quality": 28,
    "items": [],
    "allowed": false
  },
  {
    "quality": 1,
    "items": [],
    "allowed": false
  },
  {
    "quality": 2,
    "items": [],
    "allowed": false
  },
  {
    "quality": 23,
    "items": [],
    "allowed": false
  },
  {
    "id": 1000,
    "name": "WEB 480p",
    "items": [
      {
        "quality": 8,
        "items": [],
        "allowed": false
      },
      {
        "quality": 12,
        "items": [],
        "allowed": false
      }
    ],
    "allowed": false
  },
  {
    "quality": 20,
    "items": [],
    "allowed": false
  },
  {
    "quality": 21,
    "items": [],
    "allowed": false
  },
  {
    "quality": 4,
    "items": [],
    "allowed": false
  },
  {
    "id": 1001,
    "name": "WEB 720p",
    "items": [
      {
        "quality": 5,
        "items": [],
        "allowed": false
      },
      {
        "quality": 14,
        "items": [],
        "allowed": false
      }
    ],
    "allowed": false
  },
  {
    "quality": 6,
    "items": [],
    "allowed": false
  },
  {
    "quality": 9,
    "items": [],
    "allowed": false
  },
  {
    "id": 1002,
    "name": "WEB 1080p",
    "items": [
      {
        "quality": 3,
        "items": [],
        "allowed": false
      },
      {
        "quality": 15,
        "items": [],
        "allowed": false
      }
    ],
    "allowed": false
  },
  {
    "quality": 7,
    "items": [],
    "allowed": false
  },
  {
    "quality": 30,
    "items": [],
    "allowed": false
  },
  {
    "quality": 16,
    "items": [],
    "allowed": true
  },
  {
    "id": 1003,
    "name": "WEB 2160p",
    "items": [
      {
        "quality": 18,
        "items": [],
        "allowed": true
      },
      {
        "quality": 17,
        "items": [],
        "allowed": true
      }
    ],
    "allowed": true
  },
  {
    "quality": 19,
    "items": [],
    "allowed": true
  },
  {
    "quality": 31,
    "items": [],
    "allowed": true
  },
  {
    "quality": 22,
    "items": [],
    "allowed": false
  },
  {
    "quality": 10,
    "items": [],
    "allowed": false
  }
]',1,'[]',0,0,0,1);
INSERT INTO "QualityProfiles" VALUES(6,'HD - 720p/1080p',6,'[
  {
    "quality": 0,
    "items": [],
    "allowed": false
  },
  {
    "quality": 24,
    "items": [],
    "allowed": false
  },
  {
    "quality": 25,
    "items": [],
    "allowed": false
  },
  {
    "quality": 26,
    "items": [],
    "allowed": false
  },
  {
    "quality": 27,
    "items": [],
    "allowed": false
  },
  {
    "quality": 29,
    "items": [],
    "allowed": false
  },
  {
    "quality": 28,
    "items": [],
    "allowed": false
  },
  {
    "quality": 1,
    "items": [],
    "allowed": false
  },
  {
    "quality": 2,
    "items": [],
    "allowed": false
  },
  {
    "quality": 23,
    "items": [],
    "allowed": false
  },
  {
    "id": 1000,
    "name": "WEB 480p",
    "items": [
      {
        "quality": 8,
        "items": [],
        "allowed": false
      },
      {
        "quality": 12,
        "items": [],
        "allowed": false
      }
    ],
    "allowed": false
  },
  {
    "quality": 20,
    "items": [],
    "allowed": false
  },
  {
    "quality": 21,
    "items": [],
    "allowed": false
  },
  {
    "quality": 4,
    "items": [],
    "allowed": true
  },
  {
    "id": 1001,
    "name": "WEB 720p",
    "items": [
      {
        "quality": 5,
        "items": [],
        "allowed": true
      },
      {
        "quality": 14,
        "items": [],
        "allowed": true
      }
    ],
    "allowed": true
  },
  {
    "quality": 6,
    "items": [],
    "allowed": true
  },
  {
    "quality": 9,
    "items": [],
    "allowed": true
  },
  {
    "id": 1002,
    "name": "WEB 1080p",
    "items": [
      {
        "quality": 3,
        "items": [],
        "allowed": true
      },
      {
        "quality": 15,
        "items": [],
        "allowed": true
      }
    ],
    "allowed": true
  },
  {
    "quality": 7,
    "items": [],
    "allowed": true
  },
  {
    "quality": 30,
    "items": [],
    "allowed": true
  },
  {
    "quality": 16,
    "items": [],
    "allowed": false
  },
  {
    "id": 1003,
    "name": "WEB 2160p",
    "items": [
      {
        "quality": 18,
        "items": [],
        "allowed": false
      },
      {
        "quality": 17,
        "items": [],
        "allowed": false
      }
    ],
    "allowed": false
  },
  {
    "quality": 19,
    "items": [],
    "allowed": false
  },
  {
    "quality": 31,
    "items": [],
    "allowed": false
  },
  {
    "quality": 22,
    "items": [],
    "allowed": false
  },
  {
    "quality": 10,
    "items": [],
    "allowed": false
  }
]',1,'[]',0,0,0,1);
CREATE TABLE "ReleaseProfiles" ("Id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, "Required" TEXT, "Ignored" TEXT, "Tags" TEXT NOT NULL, "Name" TEXT, "Enabled" INTEGER NOT NULL, "IndexerId" INTEGER NOT NULL);
CREATE TABLE "RemotePathMappings" ("Id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, "Host" TEXT NOT NULL, "RemotePath" TEXT NOT NULL, "LocalPath" TEXT NOT NULL);
CREATE TABLE "RootFolders" ("Id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, "Path" TEXT NOT NULL);
CREATE TABLE "ScheduledTasks" ("Id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, "TypeName" TEXT NOT NULL, "Interval" NUMERIC NOT NULL, "LastExecution" DATETIME NOT NULL, "LastStartTime" DATETIME);
INSERT INTO "ScheduledTasks" VALUES(1,'NzbDrone.Core.Messaging.Commands.MessagingCleanupCommand',5,'2024-10-30 04:01:20.9914427Z','2024-10-30 04:01:20.9855905Z');
INSERT INTO "ScheduledTasks" VALUES(2,'NzbDrone.Core.Update.Commands.ApplicationCheckUpdateCommand',360,'2024-10-30 03:06:00.9520253Z','0001-01-01 04:57:00Z');
INSERT INTO "ScheduledTasks" VALUES(3,'NzbDrone.Core.HealthCheck.CheckHealthCommand',360,'2024-10-30 03:06:00.9544546Z','0001-01-01 04:57:00Z');
INSERT INTO "ScheduledTasks" VALUES(4,'NzbDrone.Core.Movies.Commands.RefreshMovieCommand',1440,'2024-10-30 03:06:00.9568928Z','0001-01-01 04:57:00Z');
INSERT INTO "ScheduledTasks" VALUES(5,'NzbDrone.Core.Housekeeping.HousekeepingCommand',1440,'2024-10-30 03:06:00.959278Z','0001-01-01 04:57:00Z');
INSERT INTO "ScheduledTasks" VALUES(6,'NzbDrone.Core.MediaFiles.Commands.CleanUpRecycleBinCommand',1440,'2024-10-30 03:06:00.961683Z','0001-01-01 04:57:00Z');
INSERT INTO "ScheduledTasks" VALUES(7,'NzbDrone.Core.Movies.Commands.RefreshCollectionsCommand',1440,'2024-10-30 03:06:00.9642164Z','0001-01-01 04:57:00Z');
INSERT INTO "ScheduledTasks" VALUES(8,'NzbDrone.Core.Backup.BackupCommand',10080,'2024-10-30 03:06:00.9667167Z','0001-01-01 04:57:00Z');
INSERT INTO "ScheduledTasks" VALUES(9,'NzbDrone.Core.Indexers.RssSyncCommand',30,'2024-10-30 03:36:20.8293212Z','2024-10-30 03:36:20.8051083Z');
INSERT INTO "ScheduledTasks" VALUES(10,'NzbDrone.Core.ImportLists.ImportListSyncCommand',5,'2024-10-30 04:02:51.0033453Z','2024-10-30 04:02:50.9964855Z');
INSERT INTO "ScheduledTasks" VALUES(11,'NzbDrone.Core.Download.RefreshMonitoredDownloadsCommand',1,'2024-10-30 04:04:51.0181625Z','2024-10-30 04:04:51.0091951Z');
CREATE TABLE "SubtitleFiles" ("Id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, "MovieId" INTEGER NOT NULL, "MovieFileId" INTEGER NOT NULL, "RelativePath" TEXT NOT NULL, "Extension" TEXT NOT NULL, "Added" DATETIME NOT NULL, "LastUpdated" DATETIME NOT NULL, "Language" INTEGER NOT NULL, "LanguageTags" TEXT, "Title" TEXT, "Copy" INTEGER NOT NULL DEFAULT 0);
CREATE TABLE "Tags" ("Id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, "Label" TEXT NOT NULL);
CREATE TABLE "Users" ("Id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, "Identifier" TEXT NOT NULL, "Username" TEXT NOT NULL, "Password" TEXT NOT NULL, "Salt" TEXT, "Iterations" INTEGER);
INSERT INTO "Users" VALUES(1,'5fe21d5d-48c1-460d-ba25-536bb3fe2657','admin','fmWOYFdp+k74XahsSAwRSQ3bzZWVL0nHhZTvOx9iUP4=','tTalJbk9HmfnG5ZN1CDnZw==',10000);
CREATE TABLE "VersionInfo" ("Version" INTEGER NOT NULL, "AppliedOn" DATETIME, "Description" TEXT);
INSERT INTO "VersionInfo" VALUES(1,'2024-10-30T03:05:43','InitialSetup');
INSERT INTO "VersionInfo" VALUES(104,'2024-10-30T03:05:44','add_moviefiles_table');
INSERT INTO "VersionInfo" VALUES(105,'2024-10-30T03:05:44','fix_history_movieId');
INSERT INTO "VersionInfo" VALUES(106,'2024-10-30T03:05:44','add_tmdb_stuff');
INSERT INTO "VersionInfo" VALUES(107,'2024-10-30T03:05:44','fix_movie_files');
INSERT INTO "VersionInfo" VALUES(108,'2024-10-30T03:05:44','update_schedule_intervale');
INSERT INTO "VersionInfo" VALUES(109,'2024-10-30T03:05:44','add_movie_formats_to_naming_config');
INSERT INTO "VersionInfo" VALUES(110,'2024-10-30T03:05:44','add_phyiscal_release');
INSERT INTO "VersionInfo" VALUES(111,'2024-10-30T03:05:44','remove_bitmetv');
INSERT INTO "VersionInfo" VALUES(112,'2024-10-30T03:05:44','remove_torrentleech');
INSERT INTO "VersionInfo" VALUES(113,'2024-10-30T03:05:44','remove_broadcasthenet');
INSERT INTO "VersionInfo" VALUES(114,'2024-10-30T03:05:44','remove_fanzub');
INSERT INTO "VersionInfo" VALUES(115,'2024-10-30T03:05:44','update_movie_sorttitle');
INSERT INTO "VersionInfo" VALUES(116,'2024-10-30T03:05:44','update_movie_sorttitle_again');
INSERT INTO "VersionInfo" VALUES(117,'2024-10-30T03:05:44','update_movie_file');
INSERT INTO "VersionInfo" VALUES(118,'2024-10-30T03:05:44','update_movie_slug');
INSERT INTO "VersionInfo" VALUES(119,'2024-10-30T03:05:44','add_youtube_trailer_id');
INSERT INTO "VersionInfo" VALUES(120,'2024-10-30T03:05:44','add_studio');
INSERT INTO "VersionInfo" VALUES(121,'2024-10-30T03:05:44','update_filedate_config');
INSERT INTO "VersionInfo" VALUES(122,'2024-10-30T03:05:44','add_movieid_to_blacklist');
INSERT INTO "VersionInfo" VALUES(123,'2024-10-30T03:05:44','create_netimport_table');
INSERT INTO "VersionInfo" VALUES(124,'2024-10-30T03:05:44','add_preferred_tags_to_profile');
INSERT INTO "VersionInfo" VALUES(125,'2024-10-30T03:05:44','fix_imdb_unique');
INSERT INTO "VersionInfo" VALUES(126,'2024-10-30T03:05:44','update_qualities_and_profiles');
INSERT INTO "VersionInfo" VALUES(127,'2024-10-30T03:05:44','remove_wombles');
INSERT INTO "VersionInfo" VALUES(128,'2024-10-30T03:05:44','remove_kickass');
INSERT INTO "VersionInfo" VALUES(129,'2024-10-30T03:05:44','add_parsed_movie_info_to_pending_release');
INSERT INTO "VersionInfo" VALUES(130,'2024-10-30T03:05:44','remove_wombles_kickass');
INSERT INTO "VersionInfo" VALUES(131,'2024-10-30T03:05:44','make_parsed_episode_info_nullable');
INSERT INTO "VersionInfo" VALUES(132,'2024-10-30T03:05:44','rename_torrent_downloadstation');
INSERT INTO "VersionInfo" VALUES(133,'2024-10-30T03:05:44','add_minimumavailability');
INSERT INTO "VersionInfo" VALUES(134,'2024-10-30T03:05:44','add_remux_qualities_for_the_wankers');
INSERT INTO "VersionInfo" VALUES(135,'2024-10-30T03:05:44','add_haspredbentry_to_movies');
INSERT INTO "VersionInfo" VALUES(136,'2024-10-30T03:05:44','add_pathstate_to_movies');
INSERT INTO "VersionInfo" VALUES(137,'2024-10-30T03:05:44','add_import_exclusions_table');
INSERT INTO "VersionInfo" VALUES(138,'2024-10-30T03:05:44','add_physical_release_note');
INSERT INTO "VersionInfo" VALUES(139,'2024-10-30T03:05:44','consolidate_indexer_baseurl');
INSERT INTO "VersionInfo" VALUES(140,'2024-10-30T03:05:44','add_alternative_titles_table');
INSERT INTO "VersionInfo" VALUES(141,'2024-10-30T03:05:44','fix_duplicate_alt_titles');
INSERT INTO "VersionInfo" VALUES(142,'2024-10-30T03:05:44','movie_extras');
INSERT INTO "VersionInfo" VALUES(143,'2024-10-30T03:05:44','clean_core_tv');
INSERT INTO "VersionInfo" VALUES(144,'2024-10-30T03:05:44','add_cookies_to_indexer_status');
INSERT INTO "VersionInfo" VALUES(145,'2024-10-30T03:05:44','banner_to_fanart');
INSERT INTO "VersionInfo" VALUES(146,'2024-10-30T03:05:44','naming_config_colon_action');
INSERT INTO "VersionInfo" VALUES(147,'2024-10-30T03:05:44','add_custom_formats');
INSERT INTO "VersionInfo" VALUES(148,'2024-10-30T03:05:44','remove_extra_naming_config');
INSERT INTO "VersionInfo" VALUES(149,'2024-10-30T03:05:44','convert_regex_required_tags');
INSERT INTO "VersionInfo" VALUES(150,'2024-10-30T03:05:44','fix_format_tags_double_underscore');
INSERT INTO "VersionInfo" VALUES(151,'2024-10-30T03:05:44','add_tags_to_net_import');
INSERT INTO "VersionInfo" VALUES(152,'2024-10-30T03:05:44','add_custom_filters');
INSERT INTO "VersionInfo" VALUES(153,'2024-10-30T03:05:44','indexer_client_status_search_changes');
INSERT INTO "VersionInfo" VALUES(154,'2024-10-30T03:05:44','add_language_to_files_history_blacklist');
INSERT INTO "VersionInfo" VALUES(155,'2024-10-30T03:05:44','add_update_allowed_quality_profile');
INSERT INTO "VersionInfo" VALUES(156,'2024-10-30T03:05:44','add_download_client_priority');
INSERT INTO "VersionInfo" VALUES(157,'2024-10-30T03:05:44','remove_growl_prowl');
INSERT INTO "VersionInfo" VALUES(158,'2024-10-30T03:05:44','remove_plex_hometheatre');
INSERT INTO "VersionInfo" VALUES(159,'2024-10-30T03:05:44','add_webrip_qualites');
INSERT INTO "VersionInfo" VALUES(160,'2024-10-30T03:05:44','health_issue_notification');
INSERT INTO "VersionInfo" VALUES(161,'2024-10-30T03:05:44','speed_improvements');
INSERT INTO "VersionInfo" VALUES(162,'2024-10-30T03:05:44','fix_profile_format_default');
INSERT INTO "VersionInfo" VALUES(163,'2024-10-30T03:05:44','task_duration');
INSERT INTO "VersionInfo" VALUES(164,'2024-10-30T03:05:44','movie_collections_crew');
INSERT INTO "VersionInfo" VALUES(165,'2024-10-30T03:05:44','remove_custom_formats_from_quality_model');
INSERT INTO "VersionInfo" VALUES(166,'2024-10-30T03:05:44','fix_tmdb_list_config');
INSERT INTO "VersionInfo" VALUES(167,'2024-10-30T03:05:44','remove_movie_pathstate');
INSERT INTO "VersionInfo" VALUES(168,'2024-10-30T03:05:44','custom_format_rework');
INSERT INTO "VersionInfo" VALUES(169,'2024-10-30T03:05:44','custom_format_scores');
INSERT INTO "VersionInfo" VALUES(170,'2024-10-30T03:05:44','fix_trakt_list_config');
INSERT INTO "VersionInfo" VALUES(171,'2024-10-30T03:05:44','quality_definition_preferred_size');
INSERT INTO "VersionInfo" VALUES(172,'2024-10-30T03:05:44','add_download_history');
INSERT INTO "VersionInfo" VALUES(173,'2024-10-30T03:05:44','net_import_status');
INSERT INTO "VersionInfo" VALUES(174,'2024-10-30T03:05:44','email_multiple_addresses');
INSERT INTO "VersionInfo" VALUES(175,'2024-10-30T03:05:44','remove_chown_and_folderchmod_config');
INSERT INTO "VersionInfo" VALUES(176,'2024-10-30T03:05:44','movie_recommendations');
INSERT INTO "VersionInfo" VALUES(177,'2024-10-30T03:05:44','language_improvements');
INSERT INTO "VersionInfo" VALUES(178,'2024-10-30T03:05:44','new_list_server');
INSERT INTO "VersionInfo" VALUES(179,'2024-10-30T03:05:44','movie_translation_indexes');
INSERT INTO "VersionInfo" VALUES(180,'2024-10-30T03:05:44','fix_invalid_profile_references');
INSERT INTO "VersionInfo" VALUES(181,'2024-10-30T03:05:44','list_movies_table');
INSERT INTO "VersionInfo" VALUES(182,'2024-10-30T03:05:44','on_delete_notification');
INSERT INTO "VersionInfo" VALUES(183,'2024-10-30T03:05:44','download_propers_config');
INSERT INTO "VersionInfo" VALUES(184,'2024-10-30T03:05:44','add_priority_to_indexers');
INSERT INTO "VersionInfo" VALUES(185,'2024-10-30T03:05:44','add_alternative_title_indices');
INSERT INTO "VersionInfo" VALUES(186,'2024-10-30T03:05:44','fix_tmdb_duplicates');
INSERT INTO "VersionInfo" VALUES(187,'2024-10-30T03:05:44','swap_filechmod_for_folderchmod');
INSERT INTO "VersionInfo" VALUES(188,'2024-10-30T03:05:44','mediainfo_channels');
INSERT INTO "VersionInfo" VALUES(189,'2024-10-30T03:05:44','add_update_history');
INSERT INTO "VersionInfo" VALUES(190,'2024-10-30T03:05:44','update_awesome_hd_link');
INSERT INTO "VersionInfo" VALUES(191,'2024-10-30T03:05:44','remove_awesomehd');
INSERT INTO "VersionInfo" VALUES(192,'2024-10-30T03:05:44','add_on_delete_to_notifications');
INSERT INTO "VersionInfo" VALUES(194,'2024-10-30T03:05:44','add_bypass_to_delay_profile');
INSERT INTO "VersionInfo" VALUES(195,'2024-10-30T03:05:44','update_notifiarr');
INSERT INTO "VersionInfo" VALUES(196,'2024-10-30T03:05:44','legacy_mediainfo_hdr');
INSERT INTO "VersionInfo" VALUES(197,'2024-10-30T03:05:44','rename_blacklist_to_blocklist');
INSERT INTO "VersionInfo" VALUES(198,'2024-10-30T03:05:44','add_indexer_tags');
INSERT INTO "VersionInfo" VALUES(199,'2024-10-30T03:05:44','mediainfo_to_ffmpeg');
INSERT INTO "VersionInfo" VALUES(200,'2024-10-30T03:05:44','cdh_per_downloadclient');
INSERT INTO "VersionInfo" VALUES(201,'2024-10-30T03:05:44','migrate_discord_from_slack');
INSERT INTO "VersionInfo" VALUES(202,'2024-10-30T03:05:44','remove_predb');
INSERT INTO "VersionInfo" VALUES(203,'2024-10-30T03:05:44','add_on_update_to_notifications');
INSERT INTO "VersionInfo" VALUES(204,'2024-10-30T03:05:44','ensure_identity_on_id_columns');
INSERT INTO "VersionInfo" VALUES(205,'2024-10-30T03:05:44','download_client_per_indexer');
INSERT INTO "VersionInfo" VALUES(206,'2024-10-30T03:05:44','multiple_ratings_support');
INSERT INTO "VersionInfo" VALUES(207,'2024-10-30T03:05:44','movie_metadata');
INSERT INTO "VersionInfo" VALUES(208,'2024-10-30T03:05:44','collections');
INSERT INTO "VersionInfo" VALUES(209,'2024-10-30T03:05:44','movie_meta_collection_index');
INSERT INTO "VersionInfo" VALUES(210,'2024-10-30T03:05:44','movie_added_notifications');
INSERT INTO "VersionInfo" VALUES(211,'2024-10-30T03:05:44','more_movie_meta_index');
INSERT INTO "VersionInfo" VALUES(212,'2024-10-30T03:05:44','postgres_update_timestamp_columns_to_with_timezone');
INSERT INTO "VersionInfo" VALUES(214,'2024-10-30T03:05:44','add_language_tags_to_subtitle_files');
INSERT INTO "VersionInfo" VALUES(215,'2024-10-30T03:05:44','add_salt_to_users');
INSERT INTO "VersionInfo" VALUES(216,'2024-10-30T03:05:44','clean_alt_titles');
INSERT INTO "VersionInfo" VALUES(217,'2024-10-30T03:05:44','remove_omg');
INSERT INTO "VersionInfo" VALUES(218,'2024-10-30T03:05:44','add_additional_info_to_pending_releases');
INSERT INTO "VersionInfo" VALUES(219,'2024-10-30T03:05:44','add_result_to_commands');
INSERT INTO "VersionInfo" VALUES(220,'2024-10-30T03:05:44','health_restored_notification');
INSERT INTO "VersionInfo" VALUES(221,'2024-10-30T03:05:44','add_on_manual_interaction_required_to_notifications');
INSERT INTO "VersionInfo" VALUES(222,'2024-10-30T03:05:44','remove_rarbg');
INSERT INTO "VersionInfo" VALUES(223,'2024-10-30T03:05:44','remove_invalid_roksbox_metadata_images');
INSERT INTO "VersionInfo" VALUES(224,'2024-10-30T03:05:44','list_sync_time');
INSERT INTO "VersionInfo" VALUES(225,'2024-10-30T03:05:44','add_tags_to_collections');
INSERT INTO "VersionInfo" VALUES(226,'2024-10-30T03:05:44','add_download_client_tags');
INSERT INTO "VersionInfo" VALUES(227,'2024-10-30T03:05:44','add_auto_tagging');
INSERT INTO "VersionInfo" VALUES(228,'2024-10-30T03:05:44','add_custom_format_score_bypass_to_delay_profile');
INSERT INTO "VersionInfo" VALUES(229,'2024-10-30T03:05:44','update_restrictions_to_release_profiles');
INSERT INTO "VersionInfo" VALUES(230,'2024-10-30T03:05:44','rename_quality_profiles');
INSERT INTO "VersionInfo" VALUES(231,'2024-10-30T03:05:44','update_images_remote_url');
INSERT INTO "VersionInfo" VALUES(232,'2024-10-30T03:05:44','add_notification_status');
INSERT INTO "VersionInfo" VALUES(233,'2024-10-30T03:05:44','rename_deprecated_indexer_flags');
INSERT INTO "VersionInfo" VALUES(234,'2024-10-30T03:05:44','movie_last_searched_time');
INSERT INTO "VersionInfo" VALUES(235,'2024-10-30T03:05:44','email_encryption');
INSERT INTO "VersionInfo" VALUES(236,'2024-10-30T03:05:44','clear_last_rss_releases_info');
INSERT INTO "VersionInfo" VALUES(237,'2024-10-30T03:05:44','add_indexes');
INSERT INTO "VersionInfo" VALUES(238,'2024-10-30T03:05:44','parse_title_from_existing_subtitle_files');
INSERT INTO "VersionInfo" VALUES(239,'2024-10-30T03:05:44','add_minimum_upgrade_format_score_to_quality_profiles');
ANALYZE "sqlite_master";
INSERT INTO "sqlite_stat1" VALUES('NamingConfig',NULL,'1');
INSERT INTO "sqlite_stat1" VALUES('Config','IX_Config_Key','5 1');
INSERT INTO "sqlite_stat1" VALUES('QualityDefinitions','IX_QualityDefinitions_Title','30 1');
INSERT INTO "sqlite_stat1" VALUES('QualityDefinitions','IX_QualityDefinitions_Quality','30 1');
INSERT INTO "sqlite_stat1" VALUES('DelayProfiles',NULL,'1');
INSERT INTO "sqlite_stat1" VALUES('Commands',NULL,'103');
INSERT INTO "sqlite_stat1" VALUES('Users','IX_Users_Username','1 1');
INSERT INTO "sqlite_stat1" VALUES('Users','IX_Users_Identifier','1 1');
INSERT INTO "sqlite_stat1" VALUES('Metadata',NULL,'4');
INSERT INTO "sqlite_stat1" VALUES('VersionInfo','UC_Version','135 1');
INSERT INTO "sqlite_stat1" VALUES('QualityProfiles','IX_Profiles_Name','6 1');
INSERT INTO "sqlite_stat1" VALUES('ScheduledTasks','IX_ScheduledTasks_TypeName','11 1');
CREATE UNIQUE INDEX "IX_Config_Key" ON "Config" ("Key" ASC);
CREATE UNIQUE INDEX "IX_RootFolders_Path" ON "RootFolders" ("Path" ASC);
CREATE UNIQUE INDEX "IX_QualityDefinitions_Quality" ON "QualityDefinitions" ("Quality" ASC);
CREATE UNIQUE INDEX "IX_QualityDefinitions_Title" ON "QualityDefinitions" ("Title" ASC);
CREATE UNIQUE INDEX "IX_Tags_Label" ON "Tags" ("Label" ASC);
CREATE UNIQUE INDEX "IX_Users_Identifier" ON "Users" ("Identifier" ASC);
CREATE UNIQUE INDEX "IX_Users_Username" ON "Users" ("Username" ASC);
CREATE UNIQUE INDEX "IX_ImportExclusions_TmdbId" ON "ImportExclusions" ("TmdbId" ASC);
CREATE UNIQUE INDEX "IX_Indexers_Name" ON "Indexers" ("Name" ASC);
CREATE UNIQUE INDEX "IX_Profiles_Name" ON "QualityProfiles" ("Name" ASC);
CREATE UNIQUE INDEX "IX_CustomFormats_Name" ON "CustomFormats" ("Name" ASC);
CREATE UNIQUE INDEX "IX_Credits_CreditTmdbId" ON "Credits" ("CreditTmdbId" ASC);
CREATE INDEX "IX_MovieTranslations_Language" ON "MovieTranslations" ("Language" ASC);
CREATE INDEX "IX_MovieTranslations_CleanTitle" ON "MovieTranslations" ("CleanTitle" ASC);
CREATE INDEX "IX_ImportListMovies_MovieMetadataId" ON "ImportListMovies" ("MovieMetadataId" ASC);
CREATE INDEX "IX_MovieTranslations_MovieMetadataId" ON "MovieTranslations" ("MovieMetadataId" ASC);
CREATE INDEX "IX_Credits_MovieMetadataId" ON "Credits" ("MovieMetadataId" ASC);
CREATE UNIQUE INDEX "IX_Collections_TmdbId" ON "Collections" ("TmdbId" ASC);
CREATE UNIQUE INDEX "IX_DownloadClientStatus_ProviderId" ON "DownloadClientStatus" ("ProviderId" ASC);
CREATE INDEX "IX_DownloadHistory_EventType" ON "DownloadHistory" ("EventType" ASC);
CREATE INDEX "IX_DownloadHistory_MovieId" ON "DownloadHistory" ("MovieId" ASC);
CREATE INDEX "IX_DownloadHistory_DownloadId" ON "DownloadHistory" ("DownloadId" ASC);
CREATE INDEX "IX_History_Date" ON "History" ("Date" ASC);
CREATE UNIQUE INDEX "IX_IndexerStatus_ProviderId" ON "IndexerStatus" ("ProviderId" ASC);
CREATE INDEX "IX_MovieFiles_MovieId" ON "MovieFiles" ("MovieId" ASC);
CREATE UNIQUE INDEX "IX_MovieMetadata_TmdbId" ON "MovieMetadata" ("TmdbId" ASC);
CREATE INDEX "IX_MovieMetadata_CleanTitle" ON "MovieMetadata" ("CleanTitle" ASC);
CREATE INDEX "IX_MovieMetadata_CleanOriginalTitle" ON "MovieMetadata" ("CleanOriginalTitle" ASC);
CREATE INDEX "IX_MovieMetadata_CollectionTmdbId" ON "MovieMetadata" ("CollectionTmdbId" ASC);
CREATE UNIQUE INDEX "IX_ScheduledTasks_TypeName" ON "ScheduledTasks" ("TypeName" ASC);
CREATE UNIQUE INDEX "UC_Version" ON "VersionInfo" ("Version" ASC);
CREATE INDEX "IX_AlternativeTitles_CleanTitle" ON "AlternativeTitles" ("CleanTitle" ASC);
CREATE INDEX "IX_AlternativeTitles_MovieMetadataId" ON "AlternativeTitles" ("MovieMetadataId" ASC);
CREATE UNIQUE INDEX "IX_NetImportStatus_ProviderId" ON "ImportListStatus" ("ProviderId" ASC);
CREATE UNIQUE INDEX "IX_AutoTagging_Name" ON "AutoTagging" ("Name" ASC);
CREATE UNIQUE INDEX "IX_Movies_MovieMetadataId" ON "Movies" ("MovieMetadataId" ASC);
CREATE UNIQUE INDEX "IX_NetImport_Name" ON "ImportLists" ("Name" ASC);
CREATE UNIQUE INDEX "IX_NotificationStatus_ProviderId" ON "NotificationStatus" ("ProviderId" ASC);
CREATE INDEX "IX_Blocklist_MovieId" ON "Blocklist" ("MovieId" ASC);
CREATE INDEX "IX_Blocklist_Date" ON "Blocklist" ("Date" ASC);
CREATE INDEX "IX_History_MovieId_Date" ON "History" ("MovieId" ASC, "Date" DESC);
CREATE INDEX "IX_History_DownloadId_Date" ON "History" ("DownloadId" ASC, "Date" DESC);
CREATE INDEX "IX_Movies_MovieFileId" ON "Movies" ("MovieFileId" ASC);
CREATE INDEX "IX_Movies_Path" ON "Movies" ("Path" ASC);
DELETE FROM "sqlite_sequence";
INSERT INTO "sqlite_sequence" VALUES('DelayProfiles',1);
INSERT INTO "sqlite_sequence" VALUES('Indexers',0);
INSERT INTO "sqlite_sequence" VALUES('Notifications',0);
INSERT INTO "sqlite_sequence" VALUES('QualityProfiles',6);
INSERT INTO "sqlite_sequence" VALUES('NamingConfig',1);
INSERT INTO "sqlite_sequence" VALUES('CustomFormats',0);
INSERT INTO "sqlite_sequence" VALUES('Credits',0);
INSERT INTO "sqlite_sequence" VALUES('MovieTranslations',0);
INSERT INTO "sqlite_sequence" VALUES('ImportListMovies',0);
INSERT INTO "sqlite_sequence" VALUES('Blocklist',0);
INSERT INTO "sqlite_sequence" VALUES('Collections',0);
INSERT INTO "sqlite_sequence" VALUES('Commands',103);
INSERT INTO "sqlite_sequence" VALUES('DownloadClientStatus',0);
INSERT INTO "sqlite_sequence" VALUES('DownloadHistory',0);
INSERT INTO "sqlite_sequence" VALUES('ExtraFiles',0);
INSERT INTO "sqlite_sequence" VALUES('History',0);
INSERT INTO "sqlite_sequence" VALUES('IndexerStatus',0);
INSERT INTO "sqlite_sequence" VALUES('MetadataFiles',0);
INSERT INTO "sqlite_sequence" VALUES('MovieFiles',0);
INSERT INTO "sqlite_sequence" VALUES('MovieMetadata',0);
INSERT INTO "sqlite_sequence" VALUES('PendingReleases',0);
INSERT INTO "sqlite_sequence" VALUES('ScheduledTasks',11);
INSERT INTO "sqlite_sequence" VALUES('SubtitleFiles',0);
INSERT INTO "sqlite_sequence" VALUES('AlternativeTitles',0);
INSERT INTO "sqlite_sequence" VALUES('ImportListStatus',0);
INSERT INTO "sqlite_sequence" VALUES('ReleaseProfiles',0);
INSERT INTO "sqlite_sequence" VALUES('Movies',0);
INSERT INTO "sqlite_sequence" VALUES('ImportLists',0);
INSERT INTO "sqlite_sequence" VALUES('QualityDefinitions',30);
INSERT INTO "sqlite_sequence" VALUES('Metadata',4);
INSERT INTO "sqlite_sequence" VALUES('Config',5);
INSERT INTO "sqlite_sequence" VALUES('Users',1);
COMMIT;
