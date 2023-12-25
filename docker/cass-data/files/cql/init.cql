
drop keyspace if exists customer;
create keyspace customer with replication={'class':'SimpleStrategy', 'replication_factor':1};

create table customer.catalog(
  ID TEXT primary key,
  CONTENT BLOB,
) with comment='team=onlineaccess domain=servicing capability=storage owner=@user1 description="Keyspace to house tables storing customer engagement data"';


drop keyspace if exists payment;
create keyspace payment with replication={'class':'SimpleStrategy', 'replication_factor':1};

create table payment.catalog(
  ID TEXT primary key,
  CONTENT BLOB,
) with comment='team=payment domain=payment capability=storage owner=@user2 description="Keyspace to house tables storing payment"';



