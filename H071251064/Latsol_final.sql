-- Nomor 1
create table kategori (
	id_kategori INT PRIMARY KEY,
	nama_kategori varchar(30) not null
);

create table buku (
	id_buku int primary key,
	judul varchar(40) not null,
	id_kategori int,
	constraint fk_buku_kategori
		foreign key (id_kategori)
		references kategori (id_kategori)
);

create table peminjaman (
	id_pinjam int primary key,
	id_buku int,
	constraint fk_peminjaman_buku
		foreign key (id_buku)
		references buku(id_buku)
);

-- Nomor 2
insert into kategori(id_kategori, nama_kategori)
values (10, 'Sains & Teknologi'),
		(20, 'Sastra & Fiksi');

insert into buku(id_buku, judul, id_kategori)
values (101, 'Pemrograman SQL', 10),
		(102, 'Struktur Data', 10),
		(103, 'Algoritma Pemrograman', 10),
		(201, 'Novel Laskar Pelangi', 20),
		(202, 'Bumi Manusia', 20);

insert into peminjaman(id_pinjam, id_buku)
values (5001, 101);

-- Nomor 3
select * from buku
where id_kategori = 10
order by judul;

drop table peminjaman;
drop table buku;
drop table kategori;

-- Nomor 4
select upper(c.city) as "Nama Kota", count(cs.customer_id) as "Jumlah Pelanggan" 
from city c
join address a 
on a.city_id = c.city_id
join customer cs
on a.address_id = cs.address_id
group by c.city
having count(cs.customer_id) >= 2
order by "Jumlah Pelanggan", "Nama Kota";

-- Nomor 5
select rating as "Rating Usia", count(title) as "Total Judul Film", round(avg(rental_rate), 2) as "Rata-Rata Biaya Sewa"
from film
where length > 100
group by rating
order by "Rata-Rata Biaya Sewa" desc;

-- Nomor 6
select upper(concat(cs.first_name, ' ', cs.last_name)) as "Nama Lengkap Pelanggan", c.city as "Nama Kota", count(p.payment_id) as "Jumlah Transaksi", round(sum(p.amount), 2) as "Total Pembayaran"
from customer cs
join address a
on a.address_id = cs.address_id
join city c
on c.city_id = a.city_id
join payment p
on p.customer_id = cs.customer_id
where c.city ilike 'a%'
group by cs.customer_id, c.city
having round(sum(p.amount), 2) >= 100.00
order by "Total Pembayaran" desc;

-- Nomor 7
select cs.customer_id as "ID Pelanggan", upper(concat(cs.first_name, ' ', cs.last_name)) as "Nama Lengkap Pelanggan", c.city as "Nama Kota", round(sum(p.amount), 2) as "Total Pembayaran"
from customer cs
join address a
on a.address_id = cs.address_id
join city c
on c.city_id = a.city_id
join payment p
on p.customer_id = cs.customer_id
where c.city in ('Aden', 'Batman', 'Ciomas')
group by cs.customer_id, c.city
having round(sum(p.amount), 2) > (
	select round(avg(amount), 2)
	from payment
)
order by "Total Pembayaran" desc;

-- Nomor 8
select upper(concat(a.first_name, ' ', a.last_name)) as "Nama Lengkap Aktor", string_agg(f.title, ', ') as "Daftar Film Action"
from film f
join film_actor fa
on fa.film_id = f.film_id
join actor a
on a.actor_id = fa.actor_id
join film_category fc
on fc.film_id = f.film_id
join category c
on c.category_id = fc.category_id
where c.name = 'Action' and f.rental_rate > 3.00 and upper(concat(a.first_name, ' ', a.last_name)) not in (
	select upper(concat(a2.first_name, ' ', a2.last_name))
	from actor a2
	join film_actor fa2
	on fa2.actor_id = a2.actor_id
	join film f2
	on f2.film_id = fa2.film_id
	join film_category fc2
	on fc2.film_id = f2.film_id
	join category c2
	on c2.category_id = fc2.category_id
	where c2.name = 'Horror'
)
group by "Nama Lengkap Aktor"
order by "Nama Lengkap Aktor";