USE [EMS_OCTOPOD]
GO
/****** Object:  StoredProcedure [dbo].[CY_BAKIM_TOPLU_CHZSAYAC_UPDATE]    Script Date: 18.10.2019 18:02:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[CY_BAKIM_TOPLU_CHZSAYAC_UPDATE]

AS
BEGIN

DECLARE @Ekipman NVARCHAR(MAX), @GuncelDeger FLOAT, @YakitMiktari FLOAT  -- Cursor de kullanacağımız parametreleri tanımlıyoruz.
 
	DECLARE BAKIM CURSOR FOR
	
	SELECT Ekipman ,GuncelDeger, YakitMiktari FROM CY_TOPLU_KAYIT_DETAIL WITH (NOLOCK) -- Cursur de işlenecek veriler ve listeyi select sorgusu ile çekiyoruz .
 
	OPEN BAKIM -- Cursor ü açıyoruz
 
	FETCH NEXT FROM BAKIM INTO @Ekipman, @GuncelDeger,@YakitMiktari -- Select sorgusunda gelen sütunlar sırasına göre değişkenlere atanır Örn : @AD_SOYAD_C = @AdiSoyadi
 
	WHILE @@FETCH_STATUS =0
		BEGIN
			
			UPDATE  [MikroDB_V16_ÇİFTAY].[dbo].[STOK_SERINO_TANIMLARI] set chz_son_sayac_degeri=@GuncelDeger
			where chz_stok_kodu=@Ekipman




			FETCH NEXT FROM BAKIM INTO @Ekipman, @GuncelDeger,@YakitMiktari
 
		END
 
	CLOSE BAKIM -- Cursor ü kapatıyoruz.
 
	DEALLOCATE BAKIM -- Cursor ile işimiz bittiğinde sistemden tamizlememiz için DEALLOCATE etmemiz gerekmektedir.
 
 
	


END


/*
EXEC CY_BAKIM_TOPLU_CHZSAYAC_UPDATE




select chz_serino,chz_son_sayac_degeri from [MikroDB_V16_ÇİFTAY].[dbo].[STOK_SERINO_TANIMLARI] where chz_son_sayac_degeri<>0
*/



	

	

	





