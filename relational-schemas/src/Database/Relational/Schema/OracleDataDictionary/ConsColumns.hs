{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE FlexibleInstances #-}

module Database.Relational.Schema.OracleDataDictionary.ConsColumns where

import Data.Int (Int32)

import Database.Relational.Query.TH (defineTableTypesAndRecordDefault)

import Database.Relational.Schema.OracleDataDictionary.Config (config)


$(defineTableTypesAndRecordDefault config
    "SYS" "dba_cons_columns"
    -- Column                                    NULL?    Datatype
    -- ----------------------------------------- -------- ----------------------------
    -- OWNER                                     NOT NULL VARCHAR2(30)
    [ ("owner", [t|String|])
    -- CONSTRAINT_NAME                           NOT NULL VARCHAR2(30)
    , ("constraint_name", [t|String|])
    -- TABLE_NAME                                NOT NULL VARCHAR2(30)
    , ("table_name", [t|String|])
    -- COLUMN_NAME                                        VARCHAR2(4000)
    , ("column_name", [t|Maybe String|])
    -- POSITION                                           NUMBER
    , ("position", [t|Maybe Int32|])
    ] [''Show])
