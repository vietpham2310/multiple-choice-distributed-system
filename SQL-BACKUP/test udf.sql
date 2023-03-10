USE [TN_CSDLPT]
GO
/****** Object:  StoredProcedure [dbo].[SP_REPORT_KETQUATHI]    Script Date: 08/04/2022 11:38:09 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SP_REPORT_BANGDIEM_MONHOC]
	@MALOP nchar(15),
	@MAMH char(5),
	@LAN smallint
AS
BEGIN
	-- THẮC MẮC XEM CÓ khi thi sinh viên chỉ được thi môn giáo viên đã đăng kí trong lớp mà sinh viên ở đó
	SELECT * FROM 
	(SELECT MASV, HO, TEN FROM SINHVIEN WHERE MALOP=@MALOP) AS SINHVIEN
	INNER JOIN (SELECT MASV, DIEM, DIEM_CHU = dbo.UDF_LAY_DIEMCHU_TU_DIEMSO (DIEM)  FROM BANGDIEM WHERE MAMH=@MAMH AND LAN=@LAN) AS BANGDIEM ON SINHVIEN.MASV = BANGDIEM.MASV
	ORDER BY TEN
END

DECLARE @A FLOAT=3
PRINT dbo.UDF_LAY_DIEMCHU_TU_DIEMSO (@A)
