
create keyspace if not exists customer with replication={'class':'SimpleStrategy', 'replication_factor':1};

create table if not exists customer.catalog(
  ID TEXT primary key,
  CONTENT BLOB,
) with comment='team=onlineaccess domain=servicing capability=storage owner=@user1 description="Keyspace to house tables storing customer engagement data"';

create keyspace if not exists payment with replication={'class':'SimpleStrategy', 'replication_factor':1};

create table if not exists payment.catalog(
  ID TEXT primary key,
  CONTENT BLOB,
) with comment='team=payment domain=payment capability=storage owner=@user2 description="Keyspace to house tables storing payment"';



