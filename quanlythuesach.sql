create database cuahangchothuesach
go
create table linhvuc
(
	malinhvuc nvarchar(5) primary key,
	tenlinhvuc nvarchar(30)
)
create table nhaxuatban
(
	manhaxuatban nvarchar(5) primary key,
	tennxb nvarchar(30),
	diachi nvarchar(40),
	sodt nvarchar(12)
)
create table tacgia
(
	matacgia nvarchar(5) primary key,
	tentacgia nvarchar(30),
	ngaysinh date,
	gioitinh nvarchar(10),
	diachi nvarchar(40)
)
create table ngonngu
(
	mangonngu nvarchar(5) primary key,
	tenngonngu nvarchar(30)
)
create table loaisach
(
	maloaisach nvarchar(5) primary key,
	tenloaisach nvarchar(40)
)
create table tinhtrang
(
	matinhtrang nvarchar(5) primary key,
	tentinhtrang nvarchar(40),
)
create table vipham
(
	mavipham nvarchar(5) primary key,
	tenvipham nvarchar(30),
	tienphat int
)
create table calam
(
	maca nvarchar(5) primary key,
	tenca nvarchar(20)
)
create table sachtruyen
(
	masach nvarchar(5) primary key,
	tensach nvarchar(50),
	maloaisach nvarchar(5),
	foreign key (maloaisach) references loaisach(maloaisach),
	malinhvuc nvarchar(5),
	foreign key (malinhvuc) references linhvuc(malinhvuc),
	matacgia nvarchar(5),
	foreign key (matacgia) references tacgia(matacgia),
	manhaxuatban nvarchar(5),
	foreign key (manhaxuatban) references nhaxuatban(manhaxuatban),
	mangonngu nvarchar(5),
	foreign key (mangonngu) references ngonngu(mangonngu),
	sotrang int,
	giasach int,
	dongiathue int,
	soluong int,
	anh image,
	ghichu nvarchar(50)
)
create table khachhang
(
	makhach nvarchar(5) primary key,
	tenkhach nvarchar(30),
	ngaysinh date,
	gioitinh nvarchar(10),
	diachi nvarchar(30)
)
create table nhanvien
(
	manhanvien nvarchar(5) primary key,
	Tennhanvien nvarchar(30),
	maca nvarchar(5),
	foreign key (maca) references calam(maca),
	namsinh date,
	gioitinh nvarchar(10),
	diachi nvarchar(30),
	sodienthoai nvarchar(12),
	luongthang int,
)
create table thuesach
(
	mathue nvarchar(5) primary key,
	makhach nvarchar(5),
	foreign key (makhach) references khachhang(makhach),
	manhanvien nvarchar(5),
	foreign key (manhanvien) references nhanvien(manhanvien),
	ngaythue date,
	tiendatcoc int,
)
create table chitietthuesach
(
	mathue nvarchar(5),
	masach nvarchar(5),
	foreign key (mathue) references thuesach(mathue),
	foreign key (masach) references sachtruyen(masach),
	primary key(mathue,masach),
	matinhtrang nvarchar(5),
	foreign key (matinhtrang) references tinhtrang(matinhtrang),
	datra nvarchar(10),
)
create table trasach
(
	matra nvarchar(5) primary key,
	mathue nvarchar(5),
	foreign key (mathue) references thuesach(mathue),
	manhanvien nvarchar(5),
	foreign key (manhanvien) references nhanvien(manhanvien),
	ngaytra date,
	tongtien int
)
create table chitiettrasach
(
	matra nvarchar(5),
	masach nvarchar(5),
	foreign key (matra) references trasach(matra),
	foreign key (masach) references sachtruyen(masach),
	primary key(matra,masach),
	mavipham nvarchar(5),
	foreign key (mavipham) references vipham(mavipham),
	thanhtien int,
)
alter table chitiettrasach drop column thanhtien

alter table tacgia
add constraint cc_gioitinh check (gioitinh = 'nam' or gioitinh = 'nu')
alter table nhanvien
add constraint cc_gioitinh1 check (gioitinh = 'nam' or gioitinh = 'nu')
alter table khachhang
add constraint cc_gioitinh2 check (gioitinh = 'nam' or gioitinh = 'nu')
alter table khachhang
add constraint df_namsinh default getdate() for ngaysinh
alter table nhanvien
add constraint df_ngaysinh default getdate() for namsinh
alter table tacgia
add constraint df_ngaysinh1 default getdate() for ngaysinh

insert into linhvuc values ('ls01','sach lich su'),
 ('sci02','sach toan hoc'),
  ('sci03','sach vat ly')
  insert into nhaxuatban values ('nxb01','hong ha','ha noi','0123456789'),
   ('nxb02','tuoi tre','ha noi','0123116789'),
    ('nxb03','kim dong','ha noi','01233356789')
	insert into tacgia values('tg01','nguyen ha','19800910','nam','ha noi'),
	('tg02','nguyen an','19800919','nu','ha noi'),
	('tg03','nguyen anh','19800928','nam','ha noi')
insert into ngonngu values ('eng','tieng anh'),
('chn','tieng trung'),
('fre','tieng phap')
insert into loaisach values('new02','moi'),
('new02','moi'),
('old01','cu')
insert into tinhtrang values('c01','dang co san'),
('ch01','dang co san'),
('tr01','da het')
insert into vipham values ('vp01','lam mat',50000),
('vp02','lam hong',50000)
insert into calam values('mor','ca sang'),
('aft','ca chieu'),
('nig','ca toi')
insert into sachtruyen values ('bko8','lich su viet nam','new01','vh01','tg01','nxb03','eng',400,200000,60000,100,'',''),
('bko2','mo hinh toan','new01','sci02','tg02','nxb03','eng',400,200000,30000,100,'',''),
('bko3','toan cao cap','new01','sci02','tg03','nxb02','eng',400,200000,30000,100,'','')
insert into khachhang values('k01','le a','19991009','nam','ha noi'),
('k02','van a','19991209','nam','ha noi'),
('k03','minh a','19991109','nu','ha noi')
insert into khachhang values('k05','nguyen hien','19900807','nu','binh duong')
insert into khachhang values('k04','bao an','19980908','nu','sai gon')
insert into nhanvien values('nv01','duong anh','mor','19890910','nam','binh duong','012335444',6000000),
('nv02','manh an','aft','19891210','nam','binh duong','0126635444',6000000),
('nv03','duong manh','nig','19900910','nam','binh duong','012335444',6000000)
insert into nhanvien values('nv04','duc manh','mor','19900807','nam','thai binh','06776665',7000000)
insert into thuesach values('thue8','k01','nv01','20200202',70000),
('thue2','k02','nv02','20200302',40000),
('thue3','k03','nv03','20200202',50000)
insert into thuesach values('thue9','k05','nv03','20200908',40000)
insert into thuesach values('thue4','k04','nv04','20200908',200000)
insert into chitietthuesach values('thue8','bko8','c01',''),
('thue2','bko2','c01','40000'),
('thue3','bko3','c01','')
update chitietthuesach set masach = 'bko3' where mathue like 'thue3'
update chitietthuesach set datra = 'da tra' where mathue = 'thue1'
update chitietthuesach set datra = 'da tra' where mathue = 'thue2'
update chitietthuesach set datra = 'chua tra' where mathue = 'thue3'
insert into trasach values('tra10','thue8','nv01','20201104',null),
('tra02','thue2','nv02','20200405',120000),
('tra03','thue3','nv03','20200704',130000)
insert into chitiettrasach values ('tra10','bko8','vp01',null),
('tra02','bko2','vp01',170000),
('tra03','bko3','vp02',180000)
update trasach set ngaytra = '20201104' where matra = 'tra09'
create trigger capnhat on chitietthuesach after insert
as
begin
	update sachtruyen
	set soluong =soluong-(
		select count(masach)
		from inserted
		where masach=sachtruyen.masach
	)
	from sachtruyen join inserted on sachtruyen.masach=inserted.masach
end;

create trigger capnhattra on chitiettrasach after insert
as
begin
	update sachtruyen
	set soluong =soluong+(
		select count(masach)
		from inserted
		where masach=sachtruyen.masach
	)
	from sachtruyen join inserted on sachtruyen.masach=inserted.masach
end;







select * from chitiettrasach
alter table chitiettrasach add constraint df_thanhtien default 0 for thanhtien
select ct.matra, ct.masach, t.ngaytra from chitiettrasach ct join trasach t on ct.matra = t.matra where ct.matra like '%tra01%'
select c.masach, s.tensach, s.soluong from chitietthuesach c join sachtruyen s on c.masach = s.masach where s.soluong > 0
select * from sachtruyen
select * from nhaxuatban
select s.masach ,s.tensach, l.tenlinhvuc, t.tentacgia,n.tennxb from sachtruyen s join  tacgia t on s.matacgia = t.matacgia join linhvuc l on s.malinhvuc=l.malinhvuc join nhaxuatban n on s.manhaxuatban=n.manhaxuatban where s.tensach like '%xac suat%' or  n.tennxb like '%kim dong%'
select s.tensach from sachtruyen s  join tacgia t on s.matacgia = t.matacgia  join linhvuc l on s.malinhvuc = l.malinhvuc  join nhaxuatban n on s.manhaxuatban=n.manhaxuatban where n.tennxb like'%hong ha%'
select*from khachhang
select n.Tennhanvien, n.namsinh,n.gioitinh ,n.luongthang from nhanvien n join calam c on n.maca = c.maca where n.Tennhanvien like 'duong anh'
select * from nhanvien
select s.tensach from sachtruyen s join chitietthuesach c on s.masach = c.masach where c.datra like 'chua tra'
select * from thuesach
select * from sachtruyen   where exists (select masach from chitietthuesach where chitietthuesach.masach = sachtruyen.masach)
insert into chitietthuesach values('thue1','bko3','ch01','20000');
insert into chitietthuesach values('thue1','bko2','ch01','1000');
select chitietthuesach.masach,chitietthuesach.mathue from chitietthuesach join trasach on trasach.mathue =chitietthuesach.mathue join chitiettrasach on trasach.matra=chitiettrasach.matra where chitietthuesach.mathue='thue3' and chitietthuesach.masach not in (select masach from chitiettrasach join trasach on chitiettrasach.matra=trasach.matra where trasach.mathue='thue3')
select sum(tongtien) as tongtientheonam from trasach where year(ngaytra)=2020		
select * from trasach
select top 5 a.masach,sum(day(f.ngaytra)-day(c.ngaythue))*(a.dongiathue)+i.tienphat)) as g 
from sachtruyen a join chitietthuesach b on a.masach=b.masach
				join thuesach c on c.mathue=b.mathue
				join chitiettrasach d on d.masach=a.masach
				join trasach f on f.matra=d.matra
				join vipham i on i.mavipham=d.mavipham
group by a.masach
order by g
select getdate() from trasach
select top 5 a.masach,sum((day(f.ngaytra)-day(c.ngaythue) as g 
from sachtruyen a join chitietthuesach b on a.masach=b.masach
				join thuesach c on c.mathue=b.mathue
				join chitiettrasach d on d.masach=a.masach
				join trasach f on f.matra=d.matra
				join vipham i on i.mavipham=d.mavipham
group by a.masach
order by g


select top 5 a.masach,sum(DATEDIFF(day,c.ngaythue,f.ngaytra)*(a.dongiathue)+i.tienphat) as doanhthu
from sachtruyen a join chitietthuesach b on a.masach=b.masach
				join thuesach c on c.mathue=b.mathue
				join chitiettrasach d on d.masach=a.masach
				join trasach f on f.matra=d.matra
				join vipham i on i.mavipham=d.mavipham
group by a.masach
order by doanhthu  

select sum(DATEDIFF(day,c.ngaythue,f.ngaytra)*(a.dongiathue)+i.tienphat) as [tong tien hoa don thue] from sachtruyen a join chitietthuesach b on a.masach=b.masach join thuesach c on c.mathue=b.mathue join chitiettrasach d on d.masach=a.masach join trasach f on f.matra=d.matra join vipham i on i.mavipham=d.mavipham where c.mathue='thue1'


select top 5 a.masach,a.tensach,a.maloaisach,sum(DATEDIFF(day,c.ngaythue,f.ngaytra)*(a.dongiathue)+i.tienphat) as [doanh thu] from sachtruyen a join chitietthuesach b on a.masach=b.masach join thuesach c on c.mathue=b.mathue join chitiettrasach d on d.masach=a.masach join trasach f on f.matra=d.matra join vipham i on i.mavipham=d.mavipham group by a.masach,a.tensach,a.maloaisach  order by [doanh thu] desc
select*from sachtruyen
 select masach, sum(datediff(day,ngaythue,ngaytra)*(dongiathue)+tienphat) as tongtienthu from sachtruyen s join chitietthuesach c on s.masach = c.masach

 select s.masach as [mã sách] ,s.tensach as [ten sach], l.tenlinhvuc as [ten linh vuc], t.tentacgia,n.tennxb from sachtruyen s join  tacgia t on s.matacgia = t.matacgia join linhvuc l on s.malinhvuc=l.malinhvuc join nhaxuatban n on s.manhaxuatban=n.manhaxuatban where s.tensach like '%xac suat%' or  n.tennxb like '%kim dong%'


 select top 5 a.masach,sum(DATEDIFF(day,c.ngaythue,f.ngaytra)*(a.dongiathue)+i.tienphat) as doanhthu
from sachtruyen a join chitietthuesach b on a.masach=b.masach
				join thuesach c on c.mathue=b.mathue
				join chitiettrasach d on d.masach=a.masach
				join trasach f on f.matra=d.matra
				join vipham i on i.mavipham=d.mavipham
group by a.masach
order by doanhthu  where month(ngaytra)=

select month(ngaytra)from trasach

alter table trasach add tongtien int
select*from chitietthuesach
select * from loaisach
select f.matra,a.masach,i.mavipham,f.ngaytra, sum(DATEDIFF(day,c.ngaythue,f.ngaytra)*(a.dongiathue)+i.tienphat) as [tong tien hoa don thue] from sachtruyen a join chitietthuesach b on a.masach = b.masach join thuesach c on c.mathue = b.mathue join chitiettrasach d on d.masach = a.masach join trasach f on f.matra = d.matra join vipham i on i.mavipham = d.mavipham group by f.matra,a.masach,i.mavipham,f.ngaytra
select*from chitiettrasach
select sum(DATEDIFF(day,c.ngaythue,f.ngaytra)*(a.dongiathue)+i.tienphat) as [tong tien hoa don thue] from sachtruyen a join chitietthuesach b on a.masach = b.masach join thuesach c on c.mathue = b.mathue join chitiettrasach d on d.masach = a.masach join trasach f on f.matra = d.matra join vipham i on i.mavipham = d.mavipham  where datepart(qq,f.ngaytra)=03
select f.matra,a.masach,i.mavipham,f.ngaytra, sum(DATEDIFF(day,c.ngaythue,f.ngaytra)*(a.dongiathue)+i.tienphat) as [tong tien hoa don thue] from sachtruyen a join chitietthuesach b on a.masach = b.masach join thuesach c on c.mathue = b.mathue join chitiettrasach d on d.masach = a.masach join trasach f on f.matra = d.matra join vipham i on i.mavipham = d.mavipham group by f.matra,a.masach,i.mavipham,f.ngaytra

select*from trasach

alter table chitiettrasach add thanhtien int, tongtien int
alter table chitiettrasach drop column tongtien


select MONTH(f.ngaytra) as thang, sum(DATEDIFF(day,c.ngaythue,f.ngaytra)*(a.dongiathue)+i.tienphat) as [Doanh thu] from sachtruyen a join chitietthuesach b on a.masach = b.masach join thuesach c on c.mathue = b.mathue join chitiettrasach d on d.masach = a.masach join trasach f on f.matra = d.matra join vipham i on i.mavipham = d.mavipham where year(f.ngaytra) =2020  group by month(f.ngaytra)

select datepart(qq,f.ngaytra) as quy, sum(DATEDIFF(day,c.ngaythue,f.ngaytra)*(a.dongiathue)+i.tienphat) as [Doanh thu] from sachtruyen a join chitietthuesach b on a.masach = b.masach join thuesach c on c.mathue = b.mathue join chitiettrasach d on d.masach = a.masach join trasach f on f.matra = d.matra join vipham i on i.mavipham = d.mavipham where year(f.ngaytra) =2020  group by datepart(qq,f.ngaytra)


select year(f.ngaytra) as nam, sum(DATEDIFF(day,c.ngaythue,f.ngaytra)*(a.dongiathue)+i.tienphat) as [Doanh thu] from sachtruyen a join chitietthuesach b on a.masach = b.masach join thuesach c on c.mathue = b.mathue join chitiettrasach d on d.masach = a.masach join trasach f on f.matra = d.matra join vipham i on i.mavipham = d.mavipham where year(f.ngaytra) =2020  group by year(f.ngaytra)



select chitietthuesach.masach,chitietthuesach.mathue 
from chitietthuesach join trasach on trasach.mathue =chitietthuesach.mathue 
join chitiettrasach on trasach.matra=chitiettrasach.matra 
where chitietthuesach.mathue='thue2' and chitietthuesach.masach 
 not in (select masach from chitiettrasach join trasach on chitiettrasach.matra=trasach.matra where trasach.mathue='thue2')







 insert into chitiettrasach values ('tra01','bko1','vp01','')

 select* from vipham
select*from chitiettrasach
select*from chitietthuesach
select*from trasach
select*from thuesach


select masach,tensach,maloaisach from sachtruyen   where exists (select masach from chitietthuesach where chitietthuesach.masach = sachtruyen.masach) and not exists(select masach from chitiettrasach where chitiettrasach.masach = sachtruyen.masach)


SELECT sachtruyen.soluong FROM sachtruyen join 
                chitietthuesach on sachtruyen.masach=chitietthuesach.masach WHERE
                 sachtruyen.masach = 'bko3'

	 select s.soluong from sachtruyen s  join chitietthuesach c on s.masach = c.masach where s.masach like 'bko3'
	 select sachtruyen.soluong from sachtruyen where sachtruyen.masach = 'bko3'


	 select f.matra,a.masach,i.mavipham, sum(DATEDIFF(day,c.ngaythue,f.ngaytra)*(a.dongiathue)+i.tienphat) as [Thành Tiền] from sachtruyen a join chitietthuesach b on a.masach = b.masach join thuesach c on c.mathue = b.mathue join chitiettrasach d on d.masach = a.masach join trasach f on f.matra = d.matra join vipham i on i.mavipham = d.mavipham group by f.matra,a.masach,i.mavipham

	 select * from sachtruyen
	 select*from chitietthuesach
	 select * from thuesach
	 select * from chitiettrasach

	 select * from chitiettrasach

	 delete from chitiettrasach where matra ='tra03'

	 select * from thuesach
	 update thuesach set ngaythue ='20200208' where mathue = 'thue9'
	 