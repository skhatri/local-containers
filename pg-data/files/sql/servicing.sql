create database servicing;

\c servicing

CREATE SCHEMA IF NOT EXISTS customer;

COMMENT ON
    SCHEMA customer IS '{
    "discovery.ops.catalog/skip": "false",
    "discovery.ops.catalog/team": "crm", 
    "discovery.ops.catalog/domain": "servicing",
    "discovery.ops.catalog/capability": "client experience",
    "discovery.ops.catalog/includes": "internal"
  }';



