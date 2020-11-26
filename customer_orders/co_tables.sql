/*
  Julian Camilo Cruz Sanchez
  jcruzsa19879@universidadean.edu.co
  Ingeniería de Sistemas
*/
PROMPT Creating tables 

create table customers (
  customer_id     integer generated by default on null as identity,
  email_address   varchar2(255 char) not null,
  full_name       varchar2(255 char) not null)
;

create table stores (
  store_id          integer generated by default on null as identity ,
  store_name        varchar2(255 char) not null,
  web_address       varchar2(100 char),
  physical_address  varchar2(512 char),
  latitude          number,
  longitude         number,
  logo              blob,
  logo_mime_type    varchar2(512 char),
  logo_filename     varchar2(512 char),
  logo_charset      varchar2(512 char),
  logo_last_updated date)
;

create table products (
  product_id         integer generated by default on null as identity ,
  product_name       varchar2(255 char) not null,
  unit_price         number(10,2),
  product_details    blob,
  product_image      blob,
  image_mime_type    varchar2(512 char),
  image_filename     varchar2(512 char),
  image_charset      varchar2(512 char),
  image_last_updated date)
;

create table orders (
  order_id        integer 
                  generated by default on null as identity,
  order_datetime  timestamp not null,
  customer_id     integer not null,
  order_status    varchar2(10 char) not null,
  store_id        integer not null)
;

create table shipments (
  shipment_id          integer 
                       generated by default on null as identity,
  store_id             integer not null,
  customer_id          integer not null,
  delivery_address     varchar2(512 char) not null,
  shipment_status      varchar2(100 char) not null)
;

create table order_items (
  order_id        integer not null,
  line_item_id    integer not null,
  product_id      integer not null,
  unit_price      number(10,2) not null,
  quantity        integer not null,
  shipment_id     integer)
;

create table inventory (
  inventory_id          integer
                        generated by default on null as identity,
  store_id              integer not null,
  product_id            integer not null,
  product_inventory     integer not null)
;

PROMPT Creating indexes

create index customers_name_i on customers ( full_name );
create index orders_customer_id_i on orders ( customer_id );
create index orders_store_id_i on orders ( store_id );
create index shipments_store_id_i on shipments ( store_id );
create index shipments_customer_id_i on shipments ( customer_id );
create index inventory_product_id_i on inventory ( product_id );