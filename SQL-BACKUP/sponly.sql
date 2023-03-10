USE [TN_CSDLPT]
GO
/****** Object:  StoredProcedure [dbo].[MY_SP_LAY_CAUHOI]    Script Date: 08/04/2022 10:43:20 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MY_SP_LAY_CAUHOI]
@maMonHoc NCHAR(5), @trinhDo NChar(1), @soCauCanLay int
AS
BEGIN
	DECLARE @trinhDo2 Nchar(1) = 'N'
	DECLARE @soCauCungTrinhDo int = -1
	DECLARE @soCauDuoiTrinhDo int = -1
	DECLARE @soCauCanLayTrinhDoDuoi int = -1
	if (@trinhDo = 'A') 
		set @trinhDo2 = 'B'
	else if (@trinhDo = 'B')
		set @trinhDo2 = 'C' 

	set @soCauCungTrinhDo = (select count(*) from BODE where (MAMH = @maMonHoc and TRINHDO = @trinhDo))
		--SELECT @soCauCungTrinhDo AS SOCAUCUNGTRINHDO
	
	if(@soCauCungTrinhDo >= @soCauCanLay) -- nếu có đủ câu cùng trình độ lấy luôn đéo nói nhiều
		BEGIN
			SET ROWCOUNT @soCauCanLay
			SELECT * FROM BODE where (MAMH = @maMonHoc and TRINHDO = @trinhDo)
			ORDER BY NEWID()
			RETURN 1
		END
	else if(@soCauCungTrinhDo < @soCauCanLay*70/100)
		BEGIN
			RAISERROR(N'không đủ 70 phần trăm câu cùng trình độ', 16,1)
			RETURN -1
		END
	else if((@soCauCungTrinhDo > @soCauCanLay*70/100) and (@soCauCungTrinhDo < @soCauCanLay))
		BEGIN
		print(N'hơn 70 phần trăm nhưng dưới 100 phần trăm số câu')
			SET @soCauCanLayTrinhDoDuoi = @soCauCanLay - @soCauCungTrinhDo

			set @soCauDuoiTrinhDo = (select count(*) from BODE where (MAMH = @maMonHoc and TRINHDO = @trinhDo2))
			
			if(@soCauDuoiTrinhDo >= @soCauCanLayTrinhDoDuoi)
				BEGIN
					--SET ROWCOUNT @soCauCanLayTrinhDoDuoi
					--	SELECT * FROM BODE where (MAMH = @maMonHoc and TRINHDO = @trinhDo2)
					--	ORDER BY NEWID()
	/*create table #TMPCAUHOITRINHDO1( -- neeus dungf insert into # select thi ph tao bang
			CAUHOI int primary key,
			MAMH char(5),
			TRINHDO char(1),
			NOIDUNG ntext,
			A ntext,
			B ntext,
			C ntext,
			D ntext,
			DAP_AN nchar(1)
	)
	create table #TMPCAUHOITRINHDO2(
			CAUHOI int primary key,
			MAMH char(5),
			TRINHDO char(1),
			NOIDUNG ntext,
			A ntext,
			B ntext,
			C ntext,
			D ntext,
			DAP_AN nchar(1)
	)*/
	-- khi hooij mawcs looix The data type ntext cannot be used as an operand to the UNION, INTERSECT or EXCEPT operators because it is not comparable.
	-- => phai cast noi dung, abcd

			-- trường hợp đã lấy hết trình độ 1 vẫn ph lấy trình độ 2, thì trình độ 1 k random đâu
			--INSERT INTO #TMPCAUHOITRINHDO1 dungf kieeur nay thi bo into trong select
					SELECT CAUHOI, MAMH, TRINHDO, CAST(NOIDUNG as nvarchar(max)) NOIDUNG,CAST(A as nvarchar(max)) A,CAST(B as nvarchar(max)) B,CAST(C as nvarchar(max)) C,
			CAST(D as nvarchar(max)) D, DAP_AN  INTO #TMPCAUHOITRINHDO1 FROM BODE where (MAMH = @maMonHoc and TRINHDO = @trinhDo)
					ORDER BY NEWID()

					--SET ROWCOUNT @soCauCanLayTrinhDoDuoi
				--INSERT INTO #TMPCAUHOITRINHDO2
					SELECT TOP (@soCauCanLayTrinhDoDuoi) CAUHOI, MAMH, TRINHDO, CAST(NOIDUNG as nvarchar(max)) NOIDUNG,CAST(A as nvarchar(max)) A,CAST(B as nvarchar(max)) B,CAST(C as nvarchar(max)) C,
			CAST(D as nvarchar(max)) D, DAP_AN INTO #TMPCAUHOITRINHDO2 FROM BODE where (MAMH = @maMonHoc and TRINHDO = @trinhDo2)
							ORDER BY NEWID()
					-- dung doan lenh offset 0 rows vi ly do sau:
					-- The ORDER BY clause is invalid in views, inline functions, derived tables, subqueries, and common table expressions, unless TOP, OFFSET or FOR XML is also specified.
					SELECT * FROM (SELECT * FROM #TMPCAUHOITRINHDO1 
						ORDER BY NEWID() OFFSET 0 ROWS ) A 
					UNION ALL 
					SELECT * FROM (SELECT * FROM #TMPCAUHOITRINHDO2 ORDER BY NEWID() OFFSET 0 ROWS) B
					
					RETURN 1
				END
			else
				BEGIN
					RAISERROR(N'Không đủ số lượng câu hỏi trình độ dưới', 16, 2)
					RETURN -1
				END
		END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GHI_VAO_BANGDIEM]    Script Date: 08/04/2022 10:43:20 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_GHI_VAO_BANGDIEM]
	@MASV nchar(8), --
	@MAMH nchar(5), --
	@LAN smallint,	--
	@NGAYTHI datetime,
	@DIEM float
AS
	IF EXISTS(SELECT MASV FROM BANGDIEM WHERE MASV=@MASV AND MAMH=@MAMH AND LAN=@LAN)
		RAISERROR('Sinh viên đã có điểm môn này', 16, 1)
	ELSE
		INSERT INTO BANGDIEM(MASV, MAMH, LAN, NGAYTHI, DIEM) VALUES (@MASV, @MAMH, @LAN, @NGAYTHI, @DIEM)
 
  

GO
/****** Object:  StoredProcedure [dbo].[SP_KT_GIAOVIEN_DANGKY_DATONTAI]    Script Date: 08/04/2022 10:43:20 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_KT_GIAOVIEN_DANGKY_DATONTAI] 
	@MALOP nchar(15),
	@MAMH char(5),
	@LAN smallint,
	@NGAYTHI datetime
AS
	--check xem đợt này thi chưa
	IF (exists(SELECT LAN FROM  dbo.GIAOVIEN_DANGKY WHERE MALOP = @MALOP AND MAMH=@MAMH AND LAN = @LAN) 
	OR exists(SELECT LAN FROM  LINK1.TN_CSDLPT.dbo.GIAOVIEN_DANGKY WHERE MALOP = @MALOP AND MAMH = @MAMH AND LAN = @LAN)) 
			BEGIN
				RAISERROR ('Đợt thi này đã tồn tại', 16, 1)
				RETURN
			END
	-- chưa tìm ra cách để thay điều kiện bên dưới vì dính lỗi cannot continue, 
	-- nếu sửa đc sẽ sửa đk thành IF @LAN = 2 AND NOT..
	-- 
	-- không hiểu sao nếu trong điều kiện if k có @lần= thì sẽ gặp lỗi Cannot continue the execution because the session is in the kill state.
	-- và để chỉ kiểm tra điều kiện đằng sau (có lần thi 1) có đúng hay k, ta cho trước or là chắc chắn false
	-- nếu chưa thi, thì xem đã thi lần 1 hay là chưa
	ELSE /*IF((@LAN=10) OR NOT(exists(SELECT LAN FROM  dbo.GIAOVIEN_DANGKY WHERE MALOP = @MALOP AND MAMH=@MAMH AND LAN = 1) 
		OR exists(SELECT LAN FROM  LINK1.TN_CSDLPT.dbo.GIAOVIEN_DANGKY WHERE MALOP = @MALOP AND MAMH=@MAMH AND LAN = 1))) 
		BEGIN
			RAISERROR ('Đợt thi này chưa thi lần 1, không thể đăng kí thi lần 2', 16, 2)
			RETURN
		END*/
		IF(@LAN=2)
			BEGIN
				--PRINT ('lan2')
					IF((exists(SELECT LAN FROM  dbo.GIAOVIEN_DANGKY WHERE MALOP = @MALOP AND MAMH=@MAMH AND LAN = 1) 
				OR exists(SELECT LAN FROM  LINK1.TN_CSDLPT.dbo.GIAOVIEN_DANGKY WHERE MALOP = @MALOP AND MAMH=@MAMH AND LAN = 1))) 
						BEGIN
							--Print (N'Đợt thi này đã thi lần 1, tiến hành kiểm tra ngày thi đợt 2 > ngày đợt 1 + 7 ngày?')
							--lấy ngày thi đợt 1
							DECLARE @NGAYTHIDOT1 datetime
							SET @NGAYTHIDOT1=
							(SELECT NGAYTHI FROM dbo.GIAOVIEN_DANGKY WHERE MALOP = @MALOP AND MAMH=@MAMH AND LAN = 1
									UNION SELECT NGAYTHI FROM LINK1.TN_CSDLPT.dbo.GIAOVIEN_DANGKY WHERE MALOP = @MALOP AND MAMH=@MAMH AND LAN = 1)
		
							--PRINT ('Ngày thi đợt 1 :' + FORMAT (@NGAYTHIDOT1, 'dd/MM/yyyy'))

							DECLARE @MESSAGE nvarchar(100)
							SET @MESSAGE = CONCAT(N'Đợt 2 phải thi sau đợt 1: ', FORMAT (@NGAYTHIDOT1, 'dd/MM/yyyy') , N' ít nhất 1 tuần')
							-- kiểm tra ngày thi đợt 2 có > đợt 1 + 7 ngày
							IF(@NGAYTHI < DATEADD(DAY, 7, @NGAYTHIDOT1))-- nếu ngày thi đợt 2 không sau đợt 1 ít nhất 1 tuần
								BEGIN
									RAISERROR ( @MESSAGE , 16, 3)
								RETURN
								END
							--ELSE 
								--PRINT(N'Ngày thi đợt 2 hợp lệ')
							RETURN
						END
					ELSE
						RAISERROR ('Đợt thi này chưa thi lần 1, không thể đăng kí thi lần 2', 16, 2)
			END
	/*ELSE -- đã tồn tại đợt thi 1, lấy đc ngày thi đợt 1
	BEGIN
		DECLARE @NGAYTHIDOT1 datetime
		SET @NGAYTHIDOT1=
		(SELECT NGAYTHI FROM dbo.GIAOVIEN_DANGKY WHERE MALOP = @MALOP AND MAMH=@MAMH AND LAN = 1
				UNION SELECT NGAYTHI FROM LINK1.TN_CSDLPT.dbo.GIAOVIEN_DANGKY WHERE MALOP = @MALOP AND MAMH=@MAMH AND LAN = 1)
		
		SELECT @NGAYTHIDOT1 as NGAYTHIDOT1
		DECLARE @MESSAGE nvarchar(100)
		SET @MESSAGE = CONCAT(N'Đợt 2 phải thi sau đợt 1: ', FORMAT (@NGAYTHIDOT1, 'dd/MM/yyyy') , N' ít nhất 1 tuần')
		IF(@NGAYTHI < DATEADD(DAY, 7, @NGAYTHIDOT1))-- nếu ngày thi đợt 2 không sau đợt 1 ít nhất 1 tuần
			BEGIN
				RAISERROR ( @MESSAGE , 16, 3)
				RETURN
			END
	--RAISERROR ('Đợt thi này đã thi lần 1', 16, 3)
		
	END*/




	--IF (exists(SELECT LAN FROM  dbo.GIAOVIEN_DANGKY WHERE MALOP = @MALOP AND MAMH=@MAMH AND LAN = @LAN) 
	--OR exists(SELECT LAN FROM  LINK1.TN_CSDLPT.dbo.GIAOVIEN_DANGKY WHERE MALOP = @MALOP AND MAMH = @MAMH AND LAN = @LAN)) 
	--		RAISERROR ('Đợt thi này đã tồn tại', 16, 1)
	--ELSE
	--IF NOT(exists(SELECT LAN FROM  dbo.GIAOVIEN_DANGKY WHERE MALOP = @MALOP AND MAMH=@MAMH AND LAN = 1) 
	--OR exists(SELECT LAN FROM  LINK1.TN_CSDLPT.dbo.GIAOVIEN_DANGKY WHERE MALOP = @MALOP AND MAMH = @MAMH AND LAN = 1)) 
   --		RAISERROR ('Đợt thi này chưa thi lần 1', 16, 1)
	/*ELSE -- đã thi lần 1, lấy date lần 1 để ktra (nhưng chưa thì gặp lỗi Cannot continue the execution because the session is in the kill state.
	IF (@LAN=2)
		BEGIN
		DECLARE @NGAYTHIDOT1 datetime
		SELECT @NGAYTHIDOT1
			SELECT @NGAYTHIDOT1 = NGAYTHI FROM  dbo.GIAOVIEN_DANGKY WHERE MALOP = @MALOP AND MAMH=@MAMH AND LAN = 1
			SELECT @NGAYTHIDOT1
			IF(@@ROWCOUNT=0) -- nếu đợt thi 1 k có ở site hiện tại thì sang site kia
				SELECT @NGAYTHIDOT1 = NGAYTHI FROM  LINK1.TN_CSDLPT.dbo.GIAOVIEN_DANGKY WHERE MALOP = @MALOP AND MAMH=@MAMH AND LAN = 1
			SELECT @NGAYTHIDOT1
			IF(@@ROWCOUNT=0) -- nếu đợt thi 1 vẫn k có ở site kia thì chứng tỏ mã môn mã lớp này chưa thi đợt 1
				RAISERROR ('Đợt thi này chưa đăng ký thi lần 1, không thể tạo lần thi thứ 2', 16, 2)
			SELECT @NGAYTHIDOT1
			IF NOT (@NGAYTHIDOT1=NULL) -- có ngày thi đợt 1, v đã đăng kí đợt 1 chưa đăng ký đợt 2
				SELECT @NGAYTHIDOT1
		END*/


GO
/****** Object:  StoredProcedure [dbo].[SP_KT_GIAOVIEN_DATONTAI]    Script Date: 08/04/2022 10:43:20 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_KT_GIAOVIEN_DATONTAI] 
	@MAGV char(8)
AS
	IF  exists(SELECT MAGV FROM  dbo.GIAOVIEN WHERE MAGV = @MAGV)
   		RAISERROR ('Mã giáo viên đã tồn tại, vui lòng nhập mã khác', 16, 1)

	--IF  exists(SELECT TENMH FROM  dbo.MONHOC WHERE TENMH = @TENMH)
	--	RAISERROR ('Tên môn học đã tồn tại, vui lòng nhập tên khác', 16, 2)


GO
/****** Object:  StoredProcedure [dbo].[SP_KT_KHOA_DATONTAI]    Script Date: 08/04/2022 10:43:20 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_KT_KHOA_DATONTAI] 
	@MAKH char(8),
	@TENKH nvarchar(50),
	@CHEDOCHECK nchar(10)
AS
	--EXEC SP_KT_KHOA_DATONTAI 'VT2', N'Công nghệ thông tin', 'KTRATHEM'
	IF(@CHEDOCHECK='KTRATHEM')
	-- nếu thêm thì mã khoa ph chưa tồn tại ở 2 site, cộng thêm tên khoa cũng k đc trùng
		BEGIN 
			IF (EXISTS(SELECT MAKH FROM KHOA WHERE MAKH=@MAKH) 
				OR EXISTS (SELECT MAKH FROM LINK1.TN_CSDLPT.dbo.KHOA WHERE MAKH=@MAKH))
				RAISERROR('Mã khoa đã tồn tại', 16, 1) 
			IF(EXISTS (SELECT MAKH FROM KHOA WHERE TENKH=@TENKH) 
				OR EXISTS (SELECT MAKH FROM LINK1.TN_CSDLPT.dbo.KHOA WHERE TENKH=@TENKH))
				RAISERROR('Tên khoa đã tồn tại', 16, 2)
		END
	ELSE --@CHEDOCHECK='KTRASUA'
	-- nếu sửa thì nếu mã giống tên giống thì hợp lệ (không sửa chính nó nhưng vẫn lưu)
	-- nếu có mã khoa khác trùng tên khoa thì không hợp lí, ta bắt lỗi này
		BEGIN
			IF(EXISTS (SELECT TENKH FROM KHOA WHERE MAKH<>@MAKH AND TENKH=@TENKH ) 
				OR EXISTS (SELECT TENKH FROM LINK1.TN_CSDLPT.dbo.KHOA WHERE MAKH<>@MAKH AND TENKH=@TENKH))
				RAISERROR('Tên khoa muốn sửa trùng với khoa khác', 16, 2)
		END

GO
/****** Object:  StoredProcedure [dbo].[SP_KT_LOP_DATONTAI]    Script Date: 08/04/2022 10:43:20 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_KT_LOP_DATONTAI] 
	@MALOP nchar(15),
	@TENLOP nvarchar(50),
	@MAKH nchar(8),
	@CHEDOCHECK nchar(10)
AS
	--EXEC SP_KT_LOP_DATONTAI 'TH06', N'TIN HOC 2006','CNTT', 'KTRATHEM'
	IF(@CHEDOCHECK='KTRATHEM')
	-- nếu thêm thì mã lớp ph chưa tồn tại ở 2 site, cộng thêm tên lớp cũng k đc trùng
		BEGIN 
			IF (EXISTS(SELECT MALOP FROM LINK2.TN_CSDLPT.dbo.LOP WHERE MALOP=@MALOP))
				RAISERROR('Mã lớp đã tồn tại', 16, 1) 
			IF(EXISTS (SELECT MALOP FROM LINK2.TN_CSDLPT.dbo.LOP WHERE TENLOP=@TENLOP))
				RAISERROR('Tên lớp đã tồn tại', 16, 2)
		END
	ELSE --@CHEDOCHECK='KTRASUA'
	-- nếu sửa thì nếu mã giống tên giống thì hợp lệ (không sửa chính nó nhưng vẫn lưu)
	-- nếu có mã khác trùng tên thì không hợp lí, ta bắt lỗi này
		BEGIN
			IF(EXISTS (SELECT MALOP FROM LINK2.TN_CSDLPT.dbo.LOP WHERE MALOP<>@MALOP AND TENLOP=@TENLOP))
				RAISERROR('Tên lớp muốn sửa đã tồn tại', 16, 2)
		END

GO
/****** Object:  StoredProcedure [dbo].[SP_KT_MONHOC_DATONTAI]    Script Date: 08/04/2022 10:43:20 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_KT_MONHOC_DATONTAI] 
	@MAMH nchar(5),
	@TENMH nvarchar(50),
	@CHEDOCHECK nchar(10)
AS

	IF(@CHEDOCHECK='KTRATHEM')
	-- nếu thêm thì mã môn ph chưa tồn tại cộng thêm tên khoa cũng k đc trùng
		BEGIN 
			IF  exists(SELECT MAMH FROM  dbo.MONHOC WHERE MAMH = @MAMH)
   				RAISERROR ('Mã môn học đã tồn tại, vui lòng nhập mã khác', 16, 1)
			IF  exists(SELECT TENMH FROM  dbo.MONHOC WHERE TENMH = @TENMH)
				RAISERROR ('Tên môn học đã tồn tại, vui lòng nhập tên khác', 16, 2)
		END
	ELSE --@CHEDOCHECK='KTRASUA'
	-- nếu thêm thì nếu mã giống tên giống thì hợp lệ (không sửa chính nó nhưng vẫn lưu)
	-- nếu có mã môn khác trùng tên môn thì không hợp lí, ta bắt lỗi này
		BEGIN
			IF  exists(SELECT MAMH FROM  dbo.MONHOC WHERE MAMH <> @MAMH AND TENMH=@TENMH)
   				RAISERROR ('Tên môn muốn sửa đã tồn tại, vui lòng nhập tên khác', 16, 2)
		END

GO
/****** Object:  StoredProcedure [dbo].[SP_KT_SINHVIEN_DATHI]    Script Date: 08/04/2022 10:43:20 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_KT_SINHVIEN_DATHI] 
	@MASV char(8),
	@MAMH char(5),
	@LAN smallint
AS
	--check xem sinh viên đã thi môn này chưa
	IF (exists(SELECT MASV FROM  dbo.BANGDIEM WHERE MASV = @MASV AND MAMH=@MAMH AND LAN = @LAN) 
	OR exists(SELECT MASV FROM  LINK1.TN_CSDLPT.dbo.BANGDIEM WHERE MASV = @MASV AND MAMH = @MAMH AND LAN = @LAN))
		RAISERROR('Bạn đã thi môn này rồi', 16, 1)
	


GO
/****** Object:  StoredProcedure [dbo].[SP_KT_SINHVIEN_DATONTAI]    Script Date: 08/04/2022 10:43:20 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_KT_SINHVIEN_DATONTAI] 
	@MASV char(8)
	
AS
	--EXEC [SP_KT_SINHVIEN_DATONTAI] '002'
	
	-- nếu thêm thì mã sinh viên ph chưa tồn tại ở site tra cứu
			IF (EXISTS(SELECT MASV FROM LINK2.TN_CSDLPT.dbo.SINHVIEN WHERE MASV=@MASV))
				RAISERROR('Mã sinh viên đã tồn tại', 16, 1) 



GO
/****** Object:  StoredProcedure [dbo].[SP_KT_SUA_GIAOVIEN_DANGKY]    Script Date: 08/04/2022 10:43:20 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_KT_SUA_GIAOVIEN_DANGKY] 
	@MALOP nchar(15),
	@MAMH char(5),
	@LAN smallint,
	@NGAYTHI datetime
AS
	--check xem đợt này thi chưa
		IF(@LAN=2)
			BEGIN
				--PRINT ('lan2')
					IF((exists(SELECT LAN FROM  dbo.GIAOVIEN_DANGKY WHERE MALOP = @MALOP AND MAMH=@MAMH AND LAN = 1) 
				OR exists(SELECT LAN FROM  LINK1.TN_CSDLPT.dbo.GIAOVIEN_DANGKY WHERE MALOP = @MALOP AND MAMH=@MAMH AND LAN = 1))) 
						BEGIN
							--Print (N'Đợt thi này đã thi lần 1, tiến hành kiểm tra ngày thi đợt 2 > ngày đợt 1 + 7 ngày?')
							--lấy ngày thi đợt 1
							DECLARE @NGAYTHIDOT1 datetime
							SET @NGAYTHIDOT1=
							(SELECT NGAYTHI FROM dbo.GIAOVIEN_DANGKY WHERE MALOP = @MALOP AND MAMH=@MAMH AND LAN = 1
									UNION SELECT NGAYTHI FROM LINK1.TN_CSDLPT.dbo.GIAOVIEN_DANGKY WHERE MALOP = @MALOP AND MAMH=@MAMH AND LAN = 1)
		
							--PRINT ('Ngày thi đợt 1 :' + FORMAT (@NGAYTHIDOT1, 'dd/MM/yyyy'))

							DECLARE @MESSAGE nvarchar(100)
							SET @MESSAGE = CONCAT(N'Đợt 2 phải thi sau đợt 1: ', FORMAT (@NGAYTHIDOT1, 'dd/MM/yyyy') , N' ít nhất 1 tuần')
							-- kiểm tra ngày thi đợt 2 có > đợt 1 + 7 ngày
							IF(@NGAYTHI < DATEADD(DAY, 7, @NGAYTHIDOT1))-- nếu ngày thi đợt 2 không sau đợt 1 ít nhất 1 tuần
								BEGIN
									RAISERROR ( @MESSAGE , 16, 3)
								RETURN
								END
							--ELSE 
								--PRINT(N'Ngày thi đợt 2 hợp lệ')
							RETURN
						END
					ELSE
						RAISERROR ('Đợt thi này chưa thi lần 1, không thể đăng kí thi lần 2', 16, 2)
			END
	
GO
/****** Object:  StoredProcedure [dbo].[SP_KT_XOA_GIAOVIEN_DANGKY]    Script Date: 08/04/2022 10:43:20 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_KT_XOA_GIAOVIEN_DANGKY] 
	@MALOP nchar(15),
	@MAMH char(5),
	@LAN smallint,
	@NGAYTHI datetime
AS
	--check xem đợt này thi chưa
		IF(@LAN=1)
			BEGIN
				--PRINT ('lan2')
					IF ((exists(SELECT LAN FROM  dbo.GIAOVIEN_DANGKY WHERE MALOP = @MALOP AND MAMH=@MAMH AND LAN = 2) 
				OR exists(SELECT LAN FROM  LINK1.TN_CSDLPT.dbo.GIAOVIEN_DANGKY WHERE MALOP = @MALOP AND MAMH=@MAMH AND LAN = 2))) 
						RAISERROR ('Đợt thi này đã đăng ký lần 2, không thể xóa lần 1 này	', 16, 2)
			END
	
GO
/****** Object:  StoredProcedure [dbo].[SP_LAY_DS_GIAOVIEN]    Script Date: 08/04/2022 10:43:20 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_LAY_DS_GIAOVIEN]
AS
--DECLARE @TENMH
	SELECT MAGV, HOTEN = CONCAT(TRIM(MAGV), ' - ',  CONCAT(TRIM(HO),' ',TRIM(TEN))) FROM GIAOVIEN


GO
/****** Object:  StoredProcedure [dbo].[SP_LAY_DS_KHOA]    Script Date: 08/04/2022 10:43:20 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_LAY_DS_KHOA] 
AS
--DECLARE @TENMH
	SELECT MAKH, TENKH = CONCAT(TRIM(MAKH), ' - ', TRIM(TENKH)) FROM KHOA


GO
/****** Object:  StoredProcedure [dbo].[SP_LAY_DS_LOP]    Script Date: 08/04/2022 10:43:20 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_LAY_DS_LOP] 
AS
--DECLARE @TENMH
	SELECT MALOP, TENLOP = CONCAT(TRIM(MALOP), ' - ', TRIM(TENLOP)) FROM LOP


GO
/****** Object:  StoredProcedure [dbo].[SP_LAY_DS_MONHOC]    Script Date: 08/04/2022 10:43:20 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_LAY_DS_MONHOC] 
AS
--DECLARE @TENMH
	SELECT MAMH, TENMH = CONCAT(TRIM(MAMH), ' - ', TRIM(TENMH)) FROM MONHOC


GO
/****** Object:  StoredProcedure [dbo].[SP_LAY_STT_CAUHOI_TIEPTHEO]    Script Date: 08/04/2022 10:43:20 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROC [dbo].[SP_LAY_STT_CAUHOI_TIEPTHEO]
AS
 SELECT MAX(CAUHOI)+1 AS NEXTID FROM BODE
 
  

GO
/****** Object:  StoredProcedure [dbo].[SP_LAY_TT_GIANGVIEN_LOGIN]    Script Date: 08/04/2022 10:43:20 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROC [dbo].[SP_LAY_TT_GIANGVIEN_LOGIN]
@TENLOGIN NVARCHAR (50)
AS
DECLARE @TENUSER NVARCHAR(50)
SELECT @TENUSER=NAME FROM sys.sysusers WHERE sid = SUSER_SID(@TENLOGIN)
 
 SELECT USERNAME = @TENUSER, 
  HOTEN = (SELECT HO+ ' '+ TEN FROM dbo.GIAOVIEN  WHERE MAGV = @TENUSER ),
   TENNHOM= NAME
   FROM sys.sysusers 
   WHERE 
   UID = (SELECT GROUPUID FROM SYS.SYSMEMBERS 
							WHERE MEMBERUID = (SELECT UID FROM sys.sysusers WHERE NAME=@TENUSER))

GO
/****** Object:  StoredProcedure [dbo].[SP_LAY_TT_SV]    Script Date: 08/04/2022 10:43:20 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_LAY_TT_SV]
@MASV NCHAR (8),
@MATKHAU NCHAR(25)
AS
 SELECT @MASV AS MASV, 
  HOTEN = HO+ ' '+ TEN, LOP.MALOP, TENLOP  FROM dbo.SINHVIEN, LOP  WHERE MASV = @MASV AND MATKHAU=@MATKHAU AND LOP.MALOP = SINHVIEN.MALOP
GO
/****** Object:  StoredProcedure [dbo].[SP_LAYCAUHOI]    Script Date: 08/04/2022 10:43:20 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROC [dbo].[SP_LAYCAUHOI]
@maMonHoc NCHAR(5), @trinhDo NChar(1), @soCau int
AS
BEGIN
	DECLARE @trinhDo2 Nchar(1) = 'N'
	DECLARE @countQuestion int = 0
	DECLARE @countQuestionCungTrinhDo int = 0
	DECLARE @countQuestionTrinhDoDuoi int = 0

	set @countQuestionCungTrinhDo = (select count(*) from BODE where (MAMH = @maMonHoc and TRINHDO = @trinhDo))

	if (@trinhDo = 'A') 
		set @trinhDo2 = 'B'
	else if (@trinhDo = 'B')
		set @trinhDo2 = 'C' 
	
		set @countQuestionTrinhDoDuoi = (select count(*) from BODE where (MAMH = @maMonHoc and TRINHDO = @trinhDo2))
		set @countQuestion = @countQuestionCungTrinhDo+@countQuestionTrinhDoDuoi
		
		--set @countQuestion = @countQuestionCungTrinhDo

	if(@countQuestion <@soCau or @countQuestionCungTrinhDo<(@soCau*70/100))
		begin
			Select('Khong du cau hoi de thi') as 'ERROR'
			return -1
		end
	
	-- tạo bảng tạm chưa các câu hỏi tại tất cả các site theo input ban đầu
	create table AtSiteTable(
	CAUHOI int primary key,
	TRINHDO char(1),
	NOIDUNG ntext,
	A ntext,
	B ntext,
	C ntext,
	D ntext,
	DAP_AN nchar(1),
	)

	select * into CungTrinhDoAtSiteTable from BODE  where MAMH = @maMonHoc and TRINHDO = @trinhDo and MAGV in (Select MAGV from GIAOVIEN where MAKH in(select MAKH from KHOA))
	select * into TrinhDoDuoiAtSiteTable from BODE  where MAMH = @maMonHoc and TRINHDO = @trinhDo2 and MAGV in (Select MAGV from GIAOVIEN where MAKH in(select MAKH from KHOA))
	
	Insert into AtSiteTable
			select CAUHOI,TRINHDO,CAST(NOIDUNG as nvarchar(max)),CAST(A as nvarchar(max)),CAST(B as nvarchar(max)),CAST(C as nvarchar(max)),
			CAST(D as nvarchar(max)),DAP_AN from CungTrinhDoAtSiteTable
			UNION
			select CAUHOI,TRINHDO,CAST(NOIDUNG as nvarchar(max)),CAST(A as nvarchar(max)),CAST(B as nvarchar(max)),CAST(C as nvarchar(max)),
			CAST(D as nvarchar(max)),DAP_AN  from TrinhDoDuoiAtSiteTable 
	
	Declare @countCungTrinhDoAtSite int = (select count(*) from CungTrinhDoAtSiteTable)
	Declare @countTrinhDoDuoiAtSite int = (select count(*) from TrinhDoDuoiAtSiteTable)
	if((@countCungTrinhDoAtSite+@countTrinhDoDuoiAtSite) < @soCau OR @countCungTrinhDoAtSite < (@soCau*70/100))
		begin
			print 'here'
			select * into CungTrinhDoOtherSiteTable from BODE  where MAMH = @maMonHoc and TRINHDO = @trinhDo and MAGV in (Select MAGV from GIAOVIEN where MAKH not in(select MAKH from KHOA))
			select * into TrinhDoDuoiOtherSiteTable from BODE  where MAMH = @maMonHoc and TRINHDO = @trinhDo2 and MAGV in (Select MAGV from GIAOVIEN where MAKH not in(select MAKH from KHOA))

			Insert into AtSiteTable
			select CAUHOI,TRINHDO,CAST(NOIDUNG as nvarchar(max)),CAST(A as nvarchar(max)),CAST(B as nvarchar(max)),CAST(C as nvarchar(max)),
			CAST(D as nvarchar(max)),DAP_AN from CungTrinhDoOtherSiteTable
			UNION
			select CAUHOI,TRINHDO,CAST(NOIDUNG as nvarchar(max)),CAST(A as nvarchar(max)),CAST(B as nvarchar(max)),CAST(C as nvarchar(max)),
			CAST(D as nvarchar(max)),DAP_AN  from TrinhDoDuoiOtherSiteTable 
			drop table CungTrinhDoOtherSiteTable
			drop table TrinhDoDuoiOtherSiteTable
		end
	Declare @slCanLayCungTrinhDo int,@slCanLayTrinhDoDuoi int
		set @slCanLayCungTrinhDo = @soCau*70/100
		if ((@slCanLayCungTrinhDo + @countQuestionTrinhDoDuoi)<@soCau)
			set @slCanLayCungTrinhDo = @slCanLayCungTrinhDo + (@soCau - (@slCanLayCungTrinhDo+@countQuestionTrinhDoDuoi))
			set @slCanLayTrinhDoDuoi = @soCau - @slCanLayCungTrinhDo
		
	select top (@slCanLayCungTrinhDo) * into temp1 from AtSiteTable where TRINHDO = @trinhDo
	ORDER BY NEWID()
	
	select top (@slCanLayTrinhDoDuoi) * into temp2 from AtSiteTable where TRINHDO = @trinhDo2
	ORDER BY NEWID()

	select CAUHOI,CAST(NOIDUNG as nvarchar(max)) as [NOIDUNG],CAST(A as nvarchar(max)) as [A],CAST(B as nvarchar(max)) as [B],CAST(C as nvarchar(max)) as [C],
	CAST(D as nvarchar(max)) as [D],DAP_AN  from temp1
	UNION
	select CAUHOI,CAST(NOIDUNG as nvarchar(max)) as [NOIDUNG],CAST(A as nvarchar(max)) as [A],CAST(B as nvarchar(max)) as [B],CAST(C as nvarchar(max)) as [C],
	CAST(D as nvarchar(max)) as [D],DAP_AN  from temp2

	drop table AtSiteTable
	drop table CungTrinhDoAtSiteTable
	drop table TrinhDoDuoiAtSiteTable
	drop table temp1
	drop table temp2
	--
	
END
GO
/****** Object:  StoredProcedure [dbo].[SP_REPORT_KETQUATHI]    Script Date: 08/04/2022 10:43:20 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_REPORT_KETQUATHI]
	@MASV char(8),
	@MAMH char(5),
	@LAN smallint
AS
BEGIN

	SELECT * FROM CT_BAITHI WHERE MASV=@MASV AND MAMH=@MAMH AND LAN=@LAN
END

GO
/****** Object:  StoredProcedure [dbo].[SP_SUA_CAUHOI]    Script Date: 08/04/2022 10:43:20 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_SUA_CAUHOI]
	@idCauHoi int,
	@MAMH char(5),
	@TRINHDO char(1),
	@NOIDUNG ntext,
	@A ntext,
	@B ntext,
	@C ntext,
	@D ntext,
	@DAP_AN char(1),
	@MAGV char(8)
AS
	--IF  exists(SELECT CAUHOI FROM  dbo.BODE WHERE CAUHOI = @idCauHoi)
   	--	RAISERROR ('Mã câu hỏi đã tồn tại', 16, 1)
		-- có nên check thêm điều kiện cùng nội dung cùng mã môn mới là trùng câu?
	--ELSE 
	-- khi sửa thì xem có câu hỏi nào khác id trùng nội dung k
	IF  exists(SELECT NOIDUNG FROM  dbo.BODE WHERE 
	cast(NOIDUNG as nvarchar(max)) = cast(@NOIDUNG as nvarchar(max)) AND CAUHOI<>@idCauHoi) 
   		RAISERROR ('Câu hỏi đã tồn tại', 16, 1)
	 
		UPDATE dbo.BODE SET MAMH=@MAMH, TRINHDO=@TRINHDO, NOIDUNG=@NOIDUNG
		, A=@A, B=@B, C=@C, D=@D, DAP_AN=@DAP_AN, MAGV=@MAGV WHERE CAUHOI=@idCauHoi
	SELECT @idCauHoi AFFECTED_ID	-- lấy id vừa suwar 
 
 
  

GO
/****** Object:  StoredProcedure [dbo].[SP_SUA_GIAOVIEN]    Script Date: 08/04/2022 10:43:20 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_SUA_GIAOVIEN]
  @MAGV nchar(5),
  @HO nvarchar(50),
  @TEN nvarchar(10),
  @DIACHI nvarchar(50),
  @MAKH nchar(8)
AS
	--IF  exists(SELECT MAGV FROM  dbo.GIAOVIEN WHERE MAGV = @MAGV)
   	--	RAISERROR ('Mã giáo viên đã tồn tại, vui lòng nhập mã khác', 16, 1)
	--ELSE 
	--vì giáo viên nhân bản, khoa lại không, nên khi sửa giáo viên ở site khác, ở phía code ta k cho chỉnh
	-- sửa mã khoa, bên sp ta không chekc khóa ngoại lúc sửa, lúc sửa xong lại check
	ALTER TABLE dbo.GIAOVIEN  
	NOCHECK CONSTRAINT FK_GIAOVIEN_KHOA; 

		UPDATE dbo.GIAOVIEN SET MAGV=@MAGV, HO=@HO, TEN=@TEN, DIACHI=@DIACHI , MAKH=@MAKH WHERE MAGV=@MAGV
	SELECT @MAGV AFFECTED_ID	-- lấy id vừa sửa 

	ALTER TABLE dbo.GIAOVIEN 
	CHECK CONSTRAINT FK_GIAOVIEN_KHOA; 
	


GO
/****** Object:  StoredProcedure [dbo].[SP_SUA_GIAOVIEN_DANGKY]    Script Date: 08/04/2022 10:43:20 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_SUA_GIAOVIEN_DANGKY]
	@MAGV char(8),
	@MAMH char(5),
	@MALOP nchar(15),
	@TRINHDO char(1),
	@NGAYTHI datetime,
	@LAN smallint,
	@SOCAUTHI smallint,
	@THOIGIAN smallint
AS
--undo xóa
		
	--IF  (exists(SELECT LAN FROM  dbo.GIAOVIEN_DANGKY WHERE MALOP = @MALOP AND MAMH=@MAMH AND LAN = @LAN) 
	--OR exists(SELECT LAN FROM  LINK1.TN_CSDLPT.dbo.GIAOVIEN_DANGKY WHERE MALOP = @MALOP AND MAMH=@MAMH AND LAN = @LAN)) 
   	--	RAISERROR ('Đợt thi này đã tồn tại, không thể phục hồi', 16, 1)
	--ELSE
	--BEGIN
		UPDATE dbo.GIAOVIEN_DANGKY SET MAGV=@MAGV, TRINHDO=@TRINHDO, NGAYTHI=@NGAYTHI, SOCAUTHI=@SOCAUTHI, THOIGIAN=@THOIGIAN 
			WHERE MALOP = @MALOP AND MAMH=@MAMH AND LAN = @LAN
		SELECT @MALOP AFFECTED_ID	-- lấy id vừa sửa
			,@MAMH AFFECTED_MAMH, @MALOP AFFECTED_MALOP, @LAN AFFECTED_LAN
	--END
	
	


GO
/****** Object:  StoredProcedure [dbo].[SP_SUA_GIAOVIEN_IGNORE_FK]    Script Date: 08/04/2022 10:43:20 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_SUA_GIAOVIEN_IGNORE_FK]
  @MAGV nchar(5),
  @HO nvarchar(50),
  @TEN nvarchar(10),
  @DIACHI nvarchar(50),
  @MAKH nchar(8)
AS
	-- phải ignore khóa ngoại vì khoa không nhân bản
	--IF  exists(SELECT MAGV FROM  dbo.GIAOVIEN WHERE MAGV = @MAGV)
   	--	RAISERROR ('Mã giáo viên đã tồn tại, vui lòng nhập mã khác', 16, 1)
	--ELSE 
	ALTER TABLE dbo.GIAOVIEN  
	NOCHECK CONSTRAINT FK_GIAOVIEN_KHOA; 

		UPDATE dbo.GIAOVIEN SET HO=@HO, TEN=@TEN, DIACHI=@DIACHI , MAKH=@MAKH WHERE MAGV=@MAGV
	SELECT @MAGV AFFECTED_ID	-- lấy id vừa sửa 

	ALTER TABLE dbo.GIAOVIEN 
	CHECK CONSTRAINT FK_GIAOVIEN_KHOA; 
	


GO
/****** Object:  StoredProcedure [dbo].[SP_SUA_KHOA]    Script Date: 08/04/2022 10:43:20 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_SUA_KHOA]
  @MAKH char(8),
  @TENKH nvarchar(50)
  --,
  --@MACS nchar(3) không cần mã cơ sở vì bên code cũng k cho sửa mã cơ sở mà
AS
	--IF  exists(SELECT @MAKH FROM  dbo.KHOA WHERE MAKH = @MAKH)
   	--	RAISERROR ('Mã khoa đã tồn tại, không thể phục hồi', 16, 1)
	--ELSE 
		UPDATE dbo.KHOA SET TENKH=@TENKH WHERE MAKH=@MAKH
	SELECT @MAKH AFFECTED_ID	-- lấy id vừa sửa 
	


GO
/****** Object:  StoredProcedure [dbo].[SP_SUA_LOP]    Script Date: 08/04/2022 10:43:20 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_SUA_LOP]
	@MALOP nchar(15),
	@TENLOP nvarchar(50),
	@MAKH nchar(8)
  --,
  --@MACS nchar(3) không cần mã cơ sở vì bên code cũng k cho sửa mã cơ sở mà
AS
	--IF  exists(SELECT @MAKH FROM  dbo.KHOA WHERE MAKH = @MAKH)
   	--	RAISERROR ('Mã khoa đã tồn tại, không thể phục hồi', 16, 1)
	--ELSE 
		UPDATE dbo.LOP SET TENLOP=@TENLOP, MAKH=@MAKH WHERE MALOP=@MALOP
	SELECT @MALOP AFFECTED_ID	-- lấy id vừa sửa
	


GO
/****** Object:  StoredProcedure [dbo].[SP_SUA_MONHOC]    Script Date: 08/04/2022 10:43:20 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_SUA_MONHOC]
  @MAMH nchar(5),
  @TENMH nvarchar(50)
AS
	--IF  exists(SELECT MAMH FROM  dbo.MONHOC WHERE MAMH = @MAMH)
   	--	RAISERROR ('Mã môn học đã tồn tại, vui lòng nhập mã khác', 16, 1)
	--ELSE 
		UPDATE dbo.MONHOC  SET TENMH = @TENMH WHERE MAMH=@MAMH
		SELECT @MAMH AFFECTED_ID


GO
/****** Object:  StoredProcedure [dbo].[SP_SUA_SINHVIEN]    Script Date: 08/04/2022 10:43:20 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_SUA_SINHVIEN]
	@MASV char(8),
	@HO nvarchar(50),
	@TEN nvarchar(10),
	@NGAYSINH date,
	@DIACHI nvarchar(100),
	@MATKHAU char(25),
	@MALOP nchar(15)
AS

		UPDATE dbo.SINHVIEN SET HO=@HO, TEN=@TEN, NGAYSINH=@NGAYSINH, DIACHI=@DIACHI, MATKHAU=@MATKHAU, MALOP = @MALOP WHERE MASV = @MASV
		SELECT @MASV AFFECTED_ID	-- lấy id vừa sửa 
	


GO
/****** Object:  StoredProcedure [dbo].[SP_THEM_CAUHOI]    Script Date: 08/04/2022 10:43:20 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_THEM_CAUHOI]
	@idCauHoi int,
	@MAMH char(5),
	@TRINHDO char(1),
	@NOIDUNG ntext,
	@A ntext,
	@B ntext,
	@C ntext,
	@D ntext,
	@DAP_AN char(1),
	@MAGV char(8)
AS
	IF  exists(SELECT CAUHOI FROM  dbo.BODE WHERE CAUHOI = @idCauHoi)
   		RAISERROR ('Mã câu hỏi đã tồn tại', 16, 1)
		-- có nên check thêm điều kiện cùng nội dung cùng mã môn mới là trùng câu?
	ELSE IF  exists(SELECT NOIDUNG FROM  dbo.BODE WHERE cast(NOIDUNG as nvarchar(max)) = cast(@NOIDUNG as nvarchar(max))) 
   		RAISERROR ('Câu hỏi đã tồn tại', 16, 2)
	ELSE 
		INSERT INTO dbo.BODE (CAUHOI, MAMH, TRINHDO, NOIDUNG, A, B, C, D, DAP_AN, MAGV) 
						VALUES(@idCauHoi, @MAMH, @TRINHDO, @NOIDUNG, @A, @B, @C, @D, @DAP_AN, @MAGV)
	SELECT @idCauHoi AFFECTED_ID	-- lấy id vừa thêm 
 
 
  

GO
/****** Object:  StoredProcedure [dbo].[SP_THEM_GIAOVIEN]    Script Date: 08/04/2022 10:43:20 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_THEM_GIAOVIEN]
  @MAGV nchar(5),
  @HO nvarchar(50),
  @TEN nvarchar(10),
  @DIACHI nvarchar(50),
  @MAKH nchar(8)
AS
	IF  exists(SELECT MAGV FROM  dbo.GIAOVIEN WHERE MAGV = @MAGV)
   		RAISERROR ('Mã giáo viên đã tồn tại, vui lòng nhập mã khác', 16, 1)
	ELSE 
		INSERT INTO dbo.GIAOVIEN (MAGV, HO, TEN, DIACHI, MAKH) VALUES(@MAGV, @HO, @TEN, @DIACHI, @MAKH)
	SELECT @MAGV AFFECTED_ID	-- lấy id vừa thêm 
	


GO
/****** Object:  StoredProcedure [dbo].[SP_THEM_GIAOVIEN_DANGKY]    Script Date: 08/04/2022 10:43:20 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_THEM_GIAOVIEN_DANGKY]
	@MAGV char(8),
	@MAMH char(5),
	@MALOP nchar(15),
	@TRINHDO char(1),
	@NGAYTHI datetime,
	@LAN smallint,
	@SOCAUTHI smallint,
	@THOIGIAN smallint
AS
--undo xóa
		
	IF  (exists(SELECT LAN FROM  dbo.GIAOVIEN_DANGKY WHERE MALOP = @MALOP AND MAMH=@MAMH AND LAN = @LAN) 
	OR exists(SELECT LAN FROM  LINK1.TN_CSDLPT.dbo.GIAOVIEN_DANGKY WHERE MALOP = @MALOP AND MAMH=@MAMH AND LAN = @LAN)) 
   		RAISERROR ('Đợt thi này đã tồn tại, không thể phục hồi', 16, 1)
	ELSE
	BEGIN
		INSERT INTO dbo.GIAOVIEN_DANGKY (MAGV, MAMH, MALOP, TRINHDO, NGAYTHI, LAN, SOCAUTHI, THOIGIAN) VALUES(@MAGV, @MAMH, @MALOP, @TRINHDO, @NGAYTHI, @LAN, @SOCAUTHI, @THOIGIAN)
		SELECT @MALOP AFFECTED_ID	-- lấy id vừa thêm 
			,@MAMH AFFECTED_MAMH, @MALOP AFFECTED_MALOP, @LAN AFFECTED_LAN
	END
	
	


GO
/****** Object:  StoredProcedure [dbo].[SP_THEM_KHOA]    Script Date: 08/04/2022 10:43:20 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_THEM_KHOA]
  @MAKH char(8),
  @TENKH nvarchar(50),
  @MACS nchar(3)
AS
	IF  exists(SELECT MAKH FROM  dbo.KHOA WHERE MAKH = @MAKH)
   		RAISERROR ('Mã khoa đã tồn tại, không thể phục hồi', 16, 1)
	ELSE 
		INSERT INTO dbo.KHOA (MAKH, TENKH, MACS) VALUES(@MAKH, @TENKH, @MACS)
	SELECT @MAKH AFFECTED_ID	-- lấy id vừa thêm 
	


GO
/****** Object:  StoredProcedure [dbo].[SP_THEM_LOP]    Script Date: 08/04/2022 10:43:20 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_THEM_LOP]
	@MALOP nchar(15),
	@TENLOP nvarchar(50),
	@MAKH nchar(8)
AS
	IF  exists(SELECT MALOP FROM  dbo.LOP WHERE MALOP = @MALOP)
   		RAISERROR ('Mã lớp đã tồn tại, không thể phục hồi', 16, 1)
	ELSE 
		INSERT INTO dbo.LOP (MALOP, TENLOP, MAKH) VALUES(@MALOP, @TENLOP, @MAKH)
	SELECT @MALOP AFFECTED_ID	-- lấy id vừa thêm 
	


GO
/****** Object:  StoredProcedure [dbo].[SP_THEM_MONHOC]    Script Date: 08/04/2022 10:43:20 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_THEM_MONHOC]
  @MAMH nchar(5),
  @TENMH nvarchar(50)
AS
	IF  exists(SELECT MAMH FROM  dbo.MONHOC WHERE MAMH = @MAMH)
   		RAISERROR ('Mã môn học đã tồn tại, vui lòng nhập mã khác', 16, 1)
	ELSE 
		INSERT INTO dbo.MONHOC (MAMH, TENMH) VALUES(@MAMH, @TENMH)
	SELECT @MAMH AFFECTED_ID	-- lấy id vừa thêm 
	


GO
/****** Object:  StoredProcedure [dbo].[SP_THEM_SINHVIEN]    Script Date: 08/04/2022 10:43:20 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_THEM_SINHVIEN]
	@MASV char(8),
	@HO nvarchar(50),
	@TEN nvarchar(10),
	@NGAYSINH date,
	@DIACHI nvarchar(100),
	@MATKHAU nchar(25),
	@MALOP nchar(15)
AS
	IF (EXISTS(SELECT MASV FROM SINHVIEN WHERE MASV=@MASV) 
				OR EXISTS (SELECT MASV FROM LINK1.TN_CSDLPT.dbo.SINHVIEN WHERE MASV=@MASV))
		RAISERROR('Mã sinh viên đã tồn tại, không thể phục hồi',16,1)
	ELSE 
		INSERT INTO dbo.SINHVIEN (MASV, HO, TEN, NGAYSINH, DIACHI, MATKHAU, MALOP) VALUES(@MASV, @HO, @TEN,@NGAYSINH,@DIACHI,@MATKHAU,@MALOP)
		SELECT @MASV AFFECTED_ID	-- lấy id vừa thêm 
	


GO
/****** Object:  StoredProcedure [dbo].[SP_TIM_MONTHI]    Script Date: 08/04/2022 10:43:20 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_TIM_MONTHI] 
	@MAMH char(5),
	@NGAYTHI datetime,
	@LAN smallint
AS
	SELECT @MAMH AS MAH, @NGAYTHI AS NGAYTHI, @LAN AS LAN, SOCAUTHI, TRINHDO, THOIGIAN
		FROM GIAOVIEN_DANGKY WHERE MAMH = @MAMH AND DATEDIFF(day, NGAYTHI, @NGAYTHI)=0 AND LAN = @LAN
	 

GO
/****** Object:  StoredProcedure [dbo].[SP_XOA_CAUHOI]    Script Date: 08/04/2022 10:43:20 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_XOA_CAUHOI]
  @idCauHoi int
AS
		DELETE FROM dbo.BODE WHERE CAUHOI=@idCauHoi
	


GO
/****** Object:  StoredProcedure [dbo].[SP_XOA_GIAOVIEN]    Script Date: 08/04/2022 10:43:20 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_XOA_GIAOVIEN]
  @MAGV char(8)
AS
		DELETE FROM dbo.GIAOVIEN WHERE MAGV=@MAGV
	


GO
/****** Object:  StoredProcedure [dbo].[SP_XOA_GIAOVIEN_DANGKY]    Script Date: 08/04/2022 10:43:20 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_XOA_GIAOVIEN_DANGKY]
  @MAMH char(5),
  @MALOP nchar(15),
  @LAN smallint
AS
--undo thêm
		DELETE FROM GIAOVIEN_DANGKY WHERE MAMH = @MAMH AND MALOP = @MALOP AND LAN = @LAN
	
	


GO
/****** Object:  StoredProcedure [dbo].[SP_XOA_KHOA]    Script Date: 08/04/2022 10:43:20 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_XOA_KHOA]
  @MAKH char(8)
AS
	--IF  exists(SELECT @MAKH FROM  dbo.KHOA WHERE MAKH = @MAKH)
   	--	RAISERROR ('Mã khoa đã tồn tại, không thể phục hồi', 16, 1)
	--ELSE 
		DELETE FROM KHOA WHERE MAKH=@MAKH
	
	


GO
/****** Object:  StoredProcedure [dbo].[SP_XOA_LOP]    Script Date: 08/04/2022 10:43:20 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_XOA_LOP]
  @MALOP nchar(15)
AS
--undo thêm
		DELETE FROM LOP WHERE MALOP=@MALOP
	
	


GO
/****** Object:  StoredProcedure [dbo].[SP_XOA_MONHOC]    Script Date: 08/04/2022 10:43:20 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_XOA_MONHOC]
  @MAMH nchar(5)
AS
	--IF  exists(SELECT MAMH FROM  dbo.MONHOC WHERE MAMH = @MAMH)
   	--	RAISERROR ('Mã môn học đã tồn tại, vui lòng nhập mã khác', 16, 1)
	--ELSE 
		DELETE FROM dbo.MONHOC WHERE MAMH=@MAMH
	


GO
/****** Object:  StoredProcedure [dbo].[SP_XOA_SINHVIEN]    Script Date: 08/04/2022 10:43:20 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_XOA_SINHVIEN]
  @MASV char(8)
AS
--undo thêm
		DELETE FROM SINHVIEN WHERE MASV=@MASV
	
	


GO
