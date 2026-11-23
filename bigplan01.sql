
SQL_ID 74cpnuu24wmx7
--------------------
SELECT TABLESPACE_ID, HEADER_FILE, HEADER_BLOCK, SEGMENT_OBJD, 
SYS_DBA_SEGS.TABLESPACE_NAME FROM SYS_DBA_SEGS, DBA_LOBS WHERE 
DBA_LOBS.OWNER = :B2 AND DBA_LOBS.TABLE_NAME = :B1 AND 
DBA_LOBS.SEGMENT_NAME = SYS_DBA_SEGS.SEGMENT_NAME AND DBA_LOBS.OWNER = 
SYS_DBA_SEGS.OWNER UNION SELECT TABLESPACE_ID, HEADER_FILE, 
HEADER_BLOCK, SEGMENT_OBJD, SYS_DBA_SEGS.TABLESPACE_NAME FROM 
SYS_DBA_SEGS, DBA_INDEXES WHERE DBA_INDEXES.OWNER = :B2 AND 
DBA_INDEXES.TABLE_NAME = :B1 AND DBA_INDEXES.INDEX_NAME = 
SYS_DBA_SEGS.SEGMENT_NAME AND DBA_INDEXES.OWNER = SYS_DBA_SEGS.OWNER 
UNION SELECT TABLESPACE_ID, HEADER_FILE, HEADER_BLOCK, SEGMENT_OBJD, 
SYS_DBA_SEGS.TABLESPACE_NAME FROM SYS_DBA_SEGS WHERE 
SYS_DBA_SEGS.SEGMENT_NAME = :B1 AND SYS_DBA_SEGS.OWNER = :B2
 
Plan hash value: 395883080
 ------------------------------------------------------------------------------------------------------------------------------
| Id  | Operation                                              | Name                | Rows  | Bytes | Cost (%CPU)| Time     |
------------------------------------------------------------------------------------------------------------------------------
|   0 | SELECT STATEMENT                                       |                     |       |       |  4232 (100)|          |
|   1 |  SORT UNIQUE                                           |                     |    34 |  9822 |  4232   (1)| 00:00:01 |
|   2 |   UNION-ALL                                            |                     |       |       |            |          |
|   3 |    HASH JOIN                                           |                     |    22 |  8778 |  2042   (1)| 00:00:01 |
|   4 |     VIEW                                               | DBA_LOBS            |     2 |   396 |    36   (0)| 00:00:01 |
|   5 |      UNION-ALL                                         |                     |       |       |            |          |
|   6 |       NESTED LOOPS                                     |                     |     1 |   176 |    13   (0)| 00:00:01 |
|   7 |        NESTED LOOPS                                    |                     |     1 |   171 |    12   (0)| 00:00:01 |
|   8 |         NESTED LOOPS OUTER                             |                     |     1 |   141 |    10   (0)| 00:00:01 |
|   9 |          NESTED LOOPS OUTER                            |                     |     1 |   130 |     9   (0)| 00:00:01 |
|  10 |           NESTED LOOPS OUTER                           |                     |     1 |   121 |     9   (0)| 00:00:01 |
|  11 |            NESTED LOOPS                                |                     |     1 |   118 |     8   (0)| 00:00:01 |
|  12 |             NESTED LOOPS                               |                     |    11 |   968 |     7   (0)| 00:00:01 |
|  13 |              NESTED LOOPS                              |                     |     1 |    76 |     6   (0)| 00:00:01 |
|  14 |               NESTED LOOPS                             |                     |     1 |    63 |     5   (0)| 00:00:01 |
|  15 |                NESTED LOOPS                            |                     |     1 |    24 |     2   (0)| 00:00:01 |
|  16 |                 TABLE ACCESS BY INDEX ROWID            | USER$               |     1 |    21 |     1   (0)| 00:00:01 |
|  17 |                  INDEX UNIQUE SCAN                     | I_USER1             |     1 |       |     0   (0)|          |
|  18 |                 TABLE ACCESS CLUSTER                   | TS$                 |     1 |     3 |     1   (0)| 00:00:01 |
|  19 |                  INDEX UNIQUE SCAN                     | I_TS#               |     1 |       |     0   (0)|          |
|  20 |                TABLE ACCESS BY INDEX ROWID BATCHED     | OBJ$                |     1 |    39 |     3   (0)| 00:00:01 |
|  21 |                 INDEX RANGE SCAN                       | I_OBJ2              |     1 |       |     2   (0)| 00:00:01 |
|  22 |               TABLE ACCESS CLUSTER                     | TAB$                |     1 |    13 |     1   (0)| 00:00:01 |
|  23 |                INDEX UNIQUE SCAN                       | I_OBJ#              |     1 |       |     0   (0)|          |
|  24 |              TABLE ACCESS CLUSTER                      | COL$                |    13 |   156 |     1   (0)| 00:00:01 |
|  25 |               INDEX UNIQUE SCAN                        | I_OBJ#              |     1 |       |     0   (0)|          |
|  26 |             TABLE ACCESS CLUSTER                       | LOB$                |     1 |    30 |     1   (0)| 00:00:01 |
|  27 |              INDEX UNIQUE SCAN                         | I_OBJ#              |     1 |       |     0   (0)|          |
|  28 |            TABLE ACCESS CLUSTER                        | TS$                 |     1 |     3 |     1   (0)| 00:00:01 |
|  29 |             INDEX UNIQUE SCAN                          | I_TS#               |     1 |       |     0   (0)|          |
|  30 |           INDEX UNIQUE SCAN                            | I_ATTRCOL1          |     1 |     9 |     0   (0)|          |
|  31 |          TABLE ACCESS CLUSTER                          | SEG$                |     1 |    11 |     1   (0)| 00:00:01 |
|  32 |           INDEX UNIQUE SCAN                            | I_FILE#_BLOCK#      |     1 |       |     0   (0)|          |
|  33 |         TABLE ACCESS BY INDEX ROWID BATCHED            | OBJ$                |     1 |    30 |     2   (0)| 00:00:01 |
|  34 |          INDEX RANGE SCAN                              | I_OBJ1              |     1 |       |     1   (0)| 00:00:01 |
|  35 |        INDEX RANGE SCAN                                | I_OBJ1              |     1 |     5 |     1   (0)| 00:00:01 |
|  36 |       NESTED LOOPS OUTER                               |                     |     1 |   171 |    13   (0)| 00:00:01 |
|  37 |        NESTED LOOPS                                    |                     |     1 |   160 |    12   (0)| 00:00:01 |
|  38 |         NESTED LOOPS                                   |                     |     1 |   147 |    11   (0)| 00:00:01 |
|  39 |          NESTED LOOPS                                  |                     |     1 |   142 |    10   (0)| 00:00:01 |
|  40 |           NESTED LOOPS OUTER                           |                     |     1 |   112 |     8   (0)| 00:00:01 |
|  41 |            NESTED LOOPS OUTER                          |                     |     1 |   103 |     8   (0)| 00:00:01 |
|  42 |             HASH JOIN                                  |                     |     1 |   100 |     7   (0)| 00:00:01 |
|  43 |              NESTED LOOPS                              |                     |     1 |    93 |     5   (0)| 00:00:01 |
|  44 |               NESTED LOOPS                             |                     |    11 |   693 |     4   (0)| 00:00:01 |
|  45 |                NESTED LOOPS                            |                     |     1 |    51 |     3   (0)| 00:00:01 |
|  46 |                 TABLE ACCESS BY INDEX ROWID            | USER$               |     1 |    18 |     1   (0)| 00:00:01 |
|  47 |                  INDEX UNIQUE SCAN                     | I_USER1             |     1 |       |     0   (0)|          |
|  48 |                 INDEX RANGE SCAN                       | I_OBJ2              |     1 |    33 |     2   (0)| 00:00:01 |
|  49 |                TABLE ACCESS CLUSTER                    | COL$                |    13 |   156 |     1   (0)| 00:00:01 |
|  50 |                 INDEX UNIQUE SCAN                      | I_OBJ#              |     1 |       |     0   (0)|          |
|  51 |               TABLE ACCESS CLUSTER                     | LOB$                |     1 |    30 |     1   (0)| 00:00:01 |
|  52 |                INDEX UNIQUE SCAN                       | I_OBJ#              |     1 |       |     0   (0)|          |
|  53 |              TABLE ACCESS FULL                         | PARTLOB$            |     4 |    28 |     2   (0)| 00:00:01 |
|  54 |             TABLE ACCESS CLUSTER                       | TS$                 |     1 |     3 |     1   (0)| 00:00:01 |
|  55 |              INDEX UNIQUE SCAN                         | I_TS#               |     1 |       |     0   (0)|          |
|  56 |            INDEX UNIQUE SCAN                           | I_ATTRCOL1          |     1 |     9 |     0   (0)|          |
|  57 |           TABLE ACCESS BY INDEX ROWID BATCHED          | OBJ$                |     1 |    30 |     2   (0)| 00:00:01 |
|  58 |            INDEX RANGE SCAN                            | I_OBJ1              |     1 |       |     1   (0)| 00:00:01 |
|  59 |          INDEX RANGE SCAN                              | I_OBJ1              |     1 |     5 |     1   (0)| 00:00:01 |
|  60 |         TABLE ACCESS CLUSTER                           | TAB$                |     1 |    13 |     1   (0)| 00:00:01 |
|  61 |          INDEX UNIQUE SCAN                             | I_OBJ#              |     1 |       |     0   (0)|          |
|  62 |        TABLE ACCESS CLUSTER                            | SEG$                |     1 |    11 |     1   (0)| 00:00:01 |
|  63 |         INDEX UNIQUE SCAN                              | I_FILE#_BLOCK#      |     1 |       |     0   (0)|          |
|  64 |     VIEW                                               | SYS_DBA_SEGS        |    22 |  4422 |  2006   (1)| 00:00:01 |
|  65 |      UNION-ALL                                         |                     |       |       |            |          |
|  66 |       HASH JOIN                                        |                     |     9 |  1440 |  1872   (1)| 00:00:01 |
|  67 |        HASH JOIN                                       |                     |     9 |  1341 |  1868   (1)| 00:00:01 |
|  68 |         NESTED LOOPS                                   |                     |    11 |  1540 |  1866   (1)| 00:00:01 |
|  69 |          HASH JOIN                                     |                     |    66 |  7590 |  1854   (1)| 00:00:01 |
|  70 |           FILTER                                       |                     |       |       |            |          |
|  71 |            HASH JOIN RIGHT OUTER                       |                     |   710 | 40470 |   391   (1)| 00:00:01 |
|  72 |             TABLE ACCESS FULL                          | USER$               |   129 |  2322 |     4   (0)| 00:00:01 |
|  73 |             TABLE ACCESS FULL                          | OBJ$                | 91621 |  3489K|   387   (1)| 00:00:01 |
|  74 |           VIEW                                         | SYS_OBJECTS         |  8489 |   480K|  1463   (1)| 00:00:01 |
|  75 |            UNION-ALL                                   |                     |       |       |            |          |
|  76 |             TABLE ACCESS FULL                          | TAB$                |  2428 | 55844 |   428   (0)| 00:00:01 |
|  77 |             TABLE ACCESS FULL                          | TABPART$            |   291 |  4656 |     4   (0)| 00:00:01 |
|  78 |             TABLE ACCESS FULL                          | CLU$                |    10 |   140 |   316   (0)| 00:00:01 |
|  79 |             TABLE ACCESS FULL                          | IND$                |  4440 | 79920 |   428   (0)| 00:00:01 |
|  80 |             TABLE ACCESS FULL                          | INDPART$            |   365 |  5840 |     5   (0)| 00:00:01 |
|  81 |             TABLE ACCESS BY INDEX ROWID BATCHED        | LOB$                |   912 | 18240 |   275   (0)| 00:00:01 |
|  82 |              INDEX FULL SCAN                           | I_LOB2              |   912 |       |     3   (0)| 00:00:01 |
|  83 |             TABLE ACCESS FULL                          | TABSUBPART$         |    32 |   512 |     2   (0)| 00:00:01 |
|  84 |             TABLE ACCESS FULL                          | INDSUBPART$         |     1 |    52 |     2   (0)| 00:00:01 |
|  85 |             TABLE ACCESS FULL                          | LOBFRAG$            |    10 |   180 |     2   (0)| 00:00:01 |
|  86 |          TABLE ACCESS CLUSTER                          | SEG$                |     1 |    25 |     1   (0)| 00:00:01 |
|  87 |           INDEX UNIQUE SCAN                            | I_FILE#_BLOCK#      |     1 |       |     0   (0)|          |
|  88 |         TABLE ACCESS FULL                              | FILE$               |     4 |    36 |     2   (0)| 00:00:01 |
|  89 |        TABLE ACCESS FULL                               | TS$                 |     7 |    77 |     4   (0)| 00:00:01 |
|  90 |       NESTED LOOPS                                     |                     |     1 |    92 |    18   (0)| 00:00:01 |
|  91 |        FILTER                                          |                     |       |       |            |          |
|  92 |         HASH JOIN OUTER                                |                     |     1 |    81 |    17   (0)| 00:00:01 |
|  93 |          NESTED LOOPS                                  |                     |     6 |   378 |    13   (0)| 00:00:01 |
|  94 |           HASH JOIN                                    |                     |     9 |   414 |     4   (0)| 00:00:01 |
|  95 |            TABLE ACCESS FULL                           | FILE$               |     4 |    36 |     2   (0)| 00:00:01 |
|  96 |            TABLE ACCESS FULL                           | UNDO$               |    11 |   407 |     2   (0)| 00:00:01 |
|  97 |           TABLE ACCESS CLUSTER                         | SEG$                |     1 |    17 |     1   (0)| 00:00:01 |
|  98 |            INDEX UNIQUE SCAN                           | I_FILE#_BLOCK#      |     1 |       |     0   (0)|          |
|  99 |          TABLE ACCESS FULL                             | USER$               |   129 |  2322 |     4   (0)| 00:00:01 |
| 100 |        TABLE ACCESS CLUSTER                            | TS$                 |     1 |    11 |     1   (0)| 00:00:01 |
| 101 |         INDEX UNIQUE SCAN                              | I_TS#               |     1 |       |     0   (0)|          |
| 102 |       HASH JOIN                                        |                     |    11 |   660 |    61   (0)| 00:00:01 |
| 103 |        HASH JOIN                                       |                     |    11 |   539 |    57   (0)| 00:00:01 |
| 104 |         FILTER                                         |                     |       |       |            |          |
| 105 |          HASH JOIN RIGHT OUTER                         |                     |    13 |   520 |    55   (0)| 00:00:01 |
| 106 |           TABLE ACCESS FULL                            | USER$               |   129 |  2322 |     4   (0)| 00:00:01 |
| 107 |           TABLE ACCESS FULL                            | SEG$                |  1652 | 36344 |    51   (0)| 00:00:01 |
| 108 |         TABLE ACCESS FULL                              | FILE$               |     4 |    36 |     2   (0)| 00:00:01 |
| 109 |        TABLE ACCESS FULL                               | TS$                 |     7 |    77 |     4   (0)| 00:00:01 |
| 110 |       NESTED LOOPS                                     |                     |     1 |    60 |    54   (0)| 00:00:01 |
| 111 |        NESTED LOOPS                                    |                     |     1 |    60 |    54   (0)| 00:00:01 |
| 112 |         FILTER                                         |                     |       |       |            |          |
| 113 |          NESTED LOOPS OUTER                            |                     |     1 |    51 |    53   (0)| 00:00:01 |
| 114 |           NESTED LOOPS                                 |                     |     1 |    33 |    52   (0)| 00:00:01 |
| 115 |            TABLE ACCESS FULL                           | SEG$                |     1 |    22 |    51   (0)| 00:00:01 |
| 116 |            TABLE ACCESS CLUSTER                        | TS$                 |     1 |    11 |     1   (0)| 00:00:01 |
| 117 |             INDEX UNIQUE SCAN                          | I_TS#               |     1 |       |     0   (0)|          |
| 118 |           TABLE ACCESS CLUSTER                         | USER$               |     1 |    18 |     1   (0)| 00:00:01 |
| 119 |            INDEX UNIQUE SCAN                           | I_USER#             |     1 |       |     0   (0)|          |
| 120 |         INDEX UNIQUE SCAN                              | I_FILE2             |     1 |       |     0   (0)|          |
| 121 |        TABLE ACCESS BY INDEX ROWID                     | FILE$               |     1 |     9 |     1   (0)| 00:00:01 |
| 122 |    NESTED LOOPS OUTER                                  |                     |     1 |   285 |  2018   (1)| 00:00:01 |
| 123 |     HASH JOIN                                          |                     |     1 |   274 |  2017   (1)| 00:00:01 |
| 124 |      NESTED LOOPS OUTER                                |                     |     1 |   270 |  2016   (1)| 00:00:01 |
| 125 |       NESTED LOOPS                                     |                     |     1 |   266 |  2015   (1)| 00:00:01 |
| 126 |        NESTED LOOPS OUTER                              |                     |     1 |   233 |  2013   (1)| 00:00:01 |
| 127 |         NESTED LOOPS OUTER                             |                     |     1 |   230 |  2012   (1)| 00:00:01 |
| 128 |          NESTED LOOPS                                  |                     |     1 |   222 |  2011   (1)| 00:00:01 |
| 129 |           NESTED LOOPS                                 |                     |     1 |   194 |  2010   (1)| 00:00:01 |
| 130 |            NESTED LOOPS                                |                     |     1 |   155 |  2007   (1)| 00:00:01 |
| 131 |             TABLE ACCESS BY INDEX ROWID                | USER$               |     1 |    18 |     1   (0)| 00:00:01 |
| 132 |              INDEX UNIQUE SCAN                         | I_USER1             |     1 |       |     0   (0)|          |
| 133 |             VIEW                                       | SYS_DBA_SEGS        |     1 |   137 |  2006   (1)| 00:00:01 |
| 134 |              UNION ALL PUSHED PREDICATE                |                     |       |       |            |          |
| 135 |               HASH JOIN                                |                     |     9 |  1440 |  1872   (1)| 00:00:01 |
| 136 |                HASH JOIN                               |                     |     9 |  1341 |  1868   (1)| 00:00:01 |
| 137 |                 NESTED LOOPS                           |                     |    11 |  1540 |  1866   (1)| 00:00:01 |
| 138 |                  HASH JOIN                             |                     |    66 |  7590 |  1854   (1)| 00:00:01 |
| 139 |                   FILTER                               |                     |       |       |            |          |
| 140 |                    HASH JOIN RIGHT OUTER               |                     |   710 | 40470 |   391   (1)| 00:00:01 |
| 141 |                     TABLE ACCESS FULL                  | USER$               |   129 |  2322 |     4   (0)| 00:00:01 |
| 142 |                     TABLE ACCESS FULL                  | OBJ$                | 91621 |  3489K|   387   (1)| 00:00:01 |
| 143 |                   VIEW                                 | SYS_OBJECTS         |  8489 |   480K|  1463   (1)| 00:00:01 |
| 144 |                    UNION-ALL                           |                     |       |       |            |          |
| 145 |                     TABLE ACCESS FULL                  | TAB$                |  2428 | 55844 |   428   (0)| 00:00:01 |
| 146 |                     TABLE ACCESS FULL                  | TABPART$            |   291 |  4656 |     4   (0)| 00:00:01 |
| 147 |                     TABLE ACCESS FULL                  | CLU$                |    10 |   140 |   316   (0)| 00:00:01 |
| 148 |                     TABLE ACCESS FULL                  | IND$                |  4440 | 79920 |   428   (0)| 00:00:01 |
| 149 |                     TABLE ACCESS FULL                  | INDPART$            |   365 |  5840 |     5   (0)| 00:00:01 |
| 150 |                     TABLE ACCESS BY INDEX ROWID BATCHED| LOB$                |   912 | 18240 |   275   (0)| 00:00:01 |
| 151 |                      INDEX FULL SCAN                   | I_LOB2              |   912 |       |     3   (0)| 00:00:01 |
| 152 |                     TABLE ACCESS FULL                  | TABSUBPART$         |    32 |   512 |     2   (0)| 00:00:01 |
| 153 |                     TABLE ACCESS FULL                  | INDSUBPART$         |     1 |    52 |     2   (0)| 00:00:01 |
| 154 |                     TABLE ACCESS FULL                  | LOBFRAG$            |    10 |   180 |     2   (0)| 00:00:01 |
| 155 |                  TABLE ACCESS CLUSTER                  | SEG$                |     1 |    25 |     1   (0)| 00:00:01 |
| 156 |                   INDEX UNIQUE SCAN                    | I_FILE#_BLOCK#      |     1 |       |     0   (0)|          |
| 157 |                 TABLE ACCESS FULL                      | FILE$               |     4 |    36 |     2   (0)| 00:00:01 |
| 158 |                TABLE ACCESS FULL                       | TS$                 |     7 |    77 |     4   (0)| 00:00:01 |
| 159 |               NESTED LOOPS                             |                     |     1 |    92 |    18   (0)| 00:00:01 |
| 160 |                FILTER                                  |                     |       |       |            |          |
| 161 |                 HASH JOIN OUTER                        |                     |     1 |    81 |    17   (0)| 00:00:01 |
| 162 |                  NESTED LOOPS                          |                     |     6 |   378 |    13   (0)| 00:00:01 |
| 163 |                   HASH JOIN                            |                     |     9 |   414 |     4   (0)| 00:00:01 |
| 164 |                    TABLE ACCESS FULL                   | FILE$               |     4 |    36 |     2   (0)| 00:00:01 |
| 165 |                    TABLE ACCESS FULL                   | UNDO$               |    11 |   407 |     2   (0)| 00:00:01 |
| 166 |                   TABLE ACCESS CLUSTER                 | SEG$                |     1 |    17 |     1   (0)| 00:00:01 |
| 167 |                    INDEX UNIQUE SCAN                   | I_FILE#_BLOCK#      |     1 |       |     0   (0)|          |
| 168 |                  TABLE ACCESS FULL                     | USER$               |   129 |  2322 |     4   (0)| 00:00:01 |
| 169 |                TABLE ACCESS CLUSTER                    | TS$                 |     1 |    11 |     1   (0)| 00:00:01 |
| 170 |                 INDEX UNIQUE SCAN                      | I_TS#               |     1 |       |     0   (0)|          |
| 171 |               HASH JOIN                                |                     |    11 |   660 |    61   (0)| 00:00:01 |
| 172 |                HASH JOIN                               |                     |    11 |   539 |    57   (0)| 00:00:01 |
| 173 |                 FILTER                                 |                     |       |       |            |          |
| 174 |                  HASH JOIN RIGHT OUTER                 |                     |    13 |   520 |    55   (0)| 00:00:01 |
| 175 |                   TABLE ACCESS FULL                    | USER$               |   129 |  2322 |     4   (0)| 00:00:01 |
| 176 |                   TABLE ACCESS FULL                    | SEG$                |  1652 | 36344 |    51   (0)| 00:00:01 |
| 177 |                 TABLE ACCESS FULL                      | FILE$               |     4 |    36 |     2   (0)| 00:00:01 |
| 178 |                TABLE ACCESS FULL                       | TS$                 |     7 |    77 |     4   (0)| 00:00:01 |
| 179 |               NESTED LOOPS                             |                     |     1 |    60 |    54   (0)| 00:00:01 |
| 180 |                NESTED LOOPS                            |                     |     1 |    60 |    54   (0)| 00:00:01 |
| 181 |                 FILTER                                 |                     |       |       |            |          |
| 182 |                  NESTED LOOPS OUTER                    |                     |     1 |    51 |    53   (0)| 00:00:01 |
| 183 |                   NESTED LOOPS                         |                     |     1 |    33 |    52   (0)| 00:00:01 |
| 184 |                    TABLE ACCESS FULL                   | SEG$                |     1 |    22 |    51   (0)| 00:00:01 |
| 185 |                    TABLE ACCESS CLUSTER                | TS$                 |     1 |    11 |     1   (0)| 00:00:01 |
| 186 |                     INDEX UNIQUE SCAN                  | I_TS#               |     1 |       |     0   (0)|          |
| 187 |                   TABLE ACCESS CLUSTER                 | USER$               |     1 |    18 |     1   (0)| 00:00:01 |
| 188 |                    INDEX UNIQUE SCAN                   | I_USER#             |     1 |       |     0   (0)|          |
| 189 |                 INDEX UNIQUE SCAN                      | I_FILE2             |     1 |       |     0   (0)|          |
| 190 |                TABLE ACCESS BY INDEX ROWID             | FILE$               |     1 |     9 |     1   (0)| 00:00:01 |
| 191 |            TABLE ACCESS BY INDEX ROWID BATCHED         | OBJ$                |     1 |    39 |     3   (0)| 00:00:01 |
| 192 |             INDEX RANGE SCAN                           | I_OBJ2              |     1 |       |     2   (0)| 00:00:01 |
| 193 |           TABLE ACCESS BY INDEX ROWID                  | IND$                |     1 |    28 |     1   (0)| 00:00:01 |
| 194 |            INDEX UNIQUE SCAN                           | I_IND1              |     1 |       |     0   (0)|          |
| 195 |          INDEX RANGE SCAN                              | I_OBJ1              |     1 |     8 |     1   (0)| 00:00:01 |
| 196 |         TABLE ACCESS CLUSTER                           | TS$                 |     1 |     3 |     1   (0)| 00:00:01 |
| 197 |          INDEX UNIQUE SCAN                             | I_TS#               |     1 |       |     0   (0)|          |
| 198 |        TABLE ACCESS BY INDEX ROWID BATCHED             | OBJ$                |     1 |    33 |     2   (0)| 00:00:01 |
| 199 |         INDEX RANGE SCAN                               | I_OBJ1              |     1 |       |     1   (0)| 00:00:01 |
| 200 |       INDEX RANGE SCAN                                 | I_USER2             |     1 |     4 |     1   (0)| 00:00:01 |
| 201 |      INDEX FULL SCAN                                   | I_USER2             |     1 |     4 |     1   (0)| 00:00:01 |
| 202 |     TABLE ACCESS CLUSTER                               | SEG$                |     1 |    11 |     1   (0)| 00:00:01 |
| 203 |      INDEX UNIQUE SCAN                                 | I_FILE#_BLOCK#      |     1 |       |     0   (0)|          |
| 204 |    VIEW                                                | SYS_DBA_SEGS        |    11 |   759 |   170   (0)| 00:00:01 |
| 205 |     UNION-ALL                                          |                     |       |       |            |          |
| 206 |      NESTED LOOPS                                      |                     |     8 |  1216 |    91   (0)| 00:00:01 |
| 207 |       HASH JOIN                                        |                     |     8 |  1128 |    87   (0)| 00:00:01 |
| 208 |        NESTED LOOPS                                    |                     |     9 |  1188 |    85   (0)| 00:00:01 |
| 209 |         NESTED LOOPS                                   |                     |    56 |  5992 |    50   (0)| 00:00:01 |
| 210 |          FILTER                                        |                     |       |       |            |          |
| 211 |           NESTED LOOPS OUTER                           |                     |     1 |    57 |    38   (0)| 00:00:01 |
| 212 |            TABLE ACCESS BY INDEX ROWID BATCHED         | OBJ$                |     2 |    78 |    36   (0)| 00:00:01 |
| 213 |             INDEX SKIP SCAN                            | I_OBJ2              |     2 |       |    34   (0)| 00:00:01 |
| 214 |            TABLE ACCESS CLUSTER                        | USER$               |     1 |    18 |     1   (0)| 00:00:01 |
| 215 |             INDEX UNIQUE SCAN                          | I_USER#             |     1 |       |     0   (0)|          |
| 216 |          VIEW                                          | SYS_OBJECTS         |     5 |   250 |    12   (0)| 00:00:01 |
| 217 |           UNION ALL PUSHED PREDICATE                   |                     |       |       |            |          |
| 218 |            TABLE ACCESS CLUSTER                        | TAB$                |     1 |    23 |     2   (0)| 00:00:01 |
| 219 |             INDEX UNIQUE SCAN                          | I_OBJ#              |     1 |       |     1   (0)| 00:00:01 |
| 220 |            TABLE ACCESS BY INDEX ROWID                 | TABPART$            |     1 |    16 |     1   (0)| 00:00:01 |
| 221 |             INDEX UNIQUE SCAN                          | I_TABPART_OBJ$      |     1 |       |     0   (0)|          |
| 222 |            TABLE ACCESS CLUSTER                        | CLU$                |     1 |    14 |     2   (0)| 00:00:01 |
| 223 |             INDEX UNIQUE SCAN                          | I_OBJ#              |     1 |       |     1   (0)| 00:00:01 |
| 224 |            TABLE ACCESS BY INDEX ROWID                 | IND$                |     1 |    18 |     2   (0)| 00:00:01 |
| 225 |             INDEX UNIQUE SCAN                          | I_IND1              |     1 |       |     1   (0)| 00:00:01 |
| 226 |            TABLE ACCESS BY INDEX ROWID                 | INDPART$            |     1 |    16 |     1   (0)| 00:00:01 |
| 227 |             INDEX UNIQUE SCAN                          | I_INDPART_OBJ$      |     1 |       |     0   (0)|          |
| 228 |            TABLE ACCESS BY INDEX ROWID                 | LOB$                |     1 |    20 |     2   (0)| 00:00:01 |
| 229 |             INDEX UNIQUE SCAN                          | I_LOB2              |     1 |       |     1   (0)| 00:00:01 |
| 230 |            TABLE ACCESS BY INDEX ROWID                 | TABSUBPART$         |     1 |    16 |     1   (0)| 00:00:01 |
| 231 |             INDEX UNIQUE SCAN                          | I_TABSUBPART$_OBJ$  |     1 |       |     0   (0)|          |
| 232 |            TABLE ACCESS BY INDEX ROWID                 | INDSUBPART$         |     1 |    52 |     0   (0)|          |
| 233 |             INDEX UNIQUE SCAN                          | I_INDSUBPART_OBJ$   |     1 |       |     0   (0)|          |
| 234 |            TABLE ACCESS BY INDEX ROWID                 | LOBFRAG$            |     1 |    18 |     1   (0)| 00:00:01 |
| 235 |             INDEX UNIQUE SCAN                          | I_LOBFRAG$_FRAGOBJ$ |     1 |       |     0   (0)|          |
| 236 |         TABLE ACCESS CLUSTER                           | SEG$                |     1 |    25 |     1   (0)| 00:00:01 |
| 237 |          INDEX UNIQUE SCAN                             | I_FILE#_BLOCK#      |     1 |       |     0   (0)|          |
| 238 |        TABLE ACCESS FULL                               | FILE$               |     4 |    36 |     2   (0)| 00:00:01 |
| 239 |       TABLE ACCESS CLUSTER                             | TS$                 |     1 |    11 |     4   (0)| 00:00:01 |
| 240 |        INDEX UNIQUE SCAN                               | I_TS#               |       |       |            |          |
| 241 |      NESTED LOOPS                                      |                     |     1 |    92 |     6   (0)| 00:00:01 |
| 242 |       NESTED LOOPS                                     |                     |     1 |    92 |     6   (0)| 00:00:01 |
| 243 |        FILTER                                          |                     |       |       |            |          |
| 244 |         NESTED LOOPS OUTER                             |                     |     1 |    83 |     5   (0)| 00:00:01 |
| 245 |          NESTED LOOPS                                  |                     |     1 |    65 |     4   (0)| 00:00:01 |
| 246 |           NESTED LOOPS                                 |                     |     1 |    54 |     3   (0)| 00:00:01 |
| 247 |            TABLE ACCESS BY INDEX ROWID BATCHED         | UNDO$               |     1 |    37 |     2   (0)| 00:00:01 |
| 248 |             INDEX RANGE SCAN                           | I_UNDO2             |     1 |       |     1   (0)| 00:00:01 |
| 249 |            TABLE ACCESS CLUSTER                        | SEG$                |     1 |    17 |     1   (0)| 00:00:01 |
| 250 |             INDEX UNIQUE SCAN                          | I_FILE#_BLOCK#      |     1 |       |     0   (0)|          |
| 251 |           TABLE ACCESS CLUSTER                         | TS$                 |     1 |    11 |     1   (0)| 00:00:01 |
| 252 |            INDEX UNIQUE SCAN                           | I_TS#               |     1 |       |     0   (0)|          |
| 253 |          TABLE ACCESS CLUSTER                          | USER$               |     1 |    18 |     1   (0)| 00:00:01 |
| 254 |           INDEX UNIQUE SCAN                            | I_USER#             |     1 |       |     0   (0)|          |
| 255 |        INDEX UNIQUE SCAN                               | I_FILE2             |     1 |       |     0   (0)|          |
| 256 |       TABLE ACCESS BY INDEX ROWID                      | FILE$               |     1 |     9 |     1   (0)| 00:00:01 |
| 257 |      NESTED LOOPS                                      |                     |     1 |    60 |    19   (0)| 00:00:01 |
| 258 |       FILTER                                           |                     |       |       |            |          |
| 259 |        HASH JOIN OUTER                                 |                     |     1 |    49 |    18   (0)| 00:00:01 |
| 260 |         NESTED LOOPS                                   |                     |    14 |   434 |    14   (0)| 00:00:01 |
| 261 |          TABLE ACCESS FULL                             | FILE$               |     4 |    36 |     2   (0)| 00:00:01 |
| 262 |          TABLE ACCESS CLUSTER                          | SEG$                |     3 |    66 |     3   (0)| 00:00:01 |
| 263 |           INDEX RANGE SCAN                             | I_FILE#_BLOCK#      |     1 |       |     2   (0)| 00:00:01 |
| 264 |         TABLE ACCESS FULL                              | USER$               |   129 |  2322 |     4   (0)| 00:00:01 |
| 265 |       TABLE ACCESS CLUSTER                             | TS$                 |     1 |    11 |     1   (0)| 00:00:01 |
| 266 |        INDEX UNIQUE SCAN                               | I_TS#               |     1 |       |     0   (0)|          |
| 267 |      FILTER                                            |                     |       |       |            |          |
| 268 |       NESTED LOOPS                                     |                     |     1 |    60 |    54   (0)| 00:00:01 |
| 269 |        NESTED LOOPS                                    |                     |     1 |    60 |    54   (0)| 00:00:01 |
| 270 |         FILTER                                         |                     |       |       |            |          |
| 271 |          NESTED LOOPS OUTER                            |                     |     1 |    51 |    53   (0)| 00:00:01 |
| 272 |           NESTED LOOPS                                 |                     |     1 |    33 |    52   (0)| 00:00:01 |
| 273 |            TABLE ACCESS FULL                           | SEG$                |     1 |    22 |    51   (0)| 00:00:01 |
| 274 |            TABLE ACCESS CLUSTER                        | TS$                 |     1 |    11 |     1   (0)| 00:00:01 |
| 275 |             INDEX UNIQUE SCAN                          | I_TS#               |     1 |       |     0   (0)|          |
| 276 |           TABLE ACCESS CLUSTER                         | USER$               |     1 |    18 |     1   (0)| 00:00:01 |
| 277 |            INDEX UNIQUE SCAN                           | I_USER#             |     1 |       |     0   (0)|          |
| 278 |         INDEX UNIQUE SCAN                              | I_FILE2             |     1 |       |     0   (0)|          |
| 279 |        TABLE ACCESS BY INDEX ROWID                     | FILE$               |     1 |     9 |     1   (0)| 00:00:01 |
------------------------------------------------------------------------------------------------------------------------------
 
Note
-----
   - this is an adaptive plan
 
