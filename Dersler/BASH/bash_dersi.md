# Bash'e giris

Asagidaki kodlari tek tek terminalinize kopyalayip yapistiracaksiniz. Sondaki noktalari unutmak, tirnak isaretlerindeki duzeltmeler hataya sebep olur. Mutlaka ayni seyi yapitirdiginiza emin olun. 

- Ilk olarak terminali acin. 
- TRUBA sunucularına bağlanmak için once Ana dizindeki truba hesaplar excel dosyasindan kendi kullanici isminizi ve sifrenizi not alin.
  
• Kullanıcı İsmi: egitimXX
• Şifre: 

- Sonra da aşağıdaki kodu terminal ekranınıza yazmanız gerekecek. Eğer, bu sunucuda ilk defa bağlanıyorsanız bir uyarı alabilirisiniz. Yes diye cevap vermeniz gerekmektedir.

Şifrenizi yazarken ekranda hiç bir imleç belirmez. Endişe etmeyin.
 ```
ssh egitimXX@levrek1.ulakbim.gov.tr
şifre: adiniza verilen şifre
``` 
- Trubaya baglaninca ilk olarak kendinize ait bir dizin olusturun. Kendi ilk isminiz kucuk harflerle ve bitisik olarak.
```
mkdir <isminiz>
cd <isminiz>
```

Home directory (konum/altdizin): bash'i baslattiginizda bulundugunuz ilk konum.

bulundugunuz konumu/altdizini gorunteleyin:
```
pwd
```
			
## Nasil bir ust dizine gidecegiz?
```
cd ../
```
			
## Listele komutu:
```
ls
```
			
Soru: komut neden acikca 'list' olarak kullanilmiyor da 'ls' olarak kullaniliyor?
Cevap: kisaltma ~ zaman

## Peki ilgili arac icin bulunan seceneklere dair nereden bilgi alabiliriz?
Man sayfasi ilgili araci calistiracak komutlar uzerine bilgi verir:

```
man ls
```
			
koseli parantez icinde verilen secenekler opsiyoneldir. Komut o secenekler olmadan da caisir. Fakat secenekler size cok faydali calismanizda yardimci olur. Secenekleri gozden gecirmeniz (man ile) cok faydali.

'man' sayfasindan ‘q’ ile cikabiliriz.

## Nasil bir altdizine gidecegiz?
```
cd <isminiz>
```
			
## Ekrani temizlemek icin:
```
clear
```

Komut satirlarinda eski yazdiklarini gormek icin, bazen eski komutlari tekrar calistirmak icin vs 'yukari & 'asagi' oklari kullanabilirsiniz.

Satir basina gitmek icin Ctrl + a ya basin, sona gitmek icin ya saga ok, ya da yukari asagi oklar.

## Yeni bir dizin olustur:
```
mkdir bash_dersi
ls
```

## Bir dizinden/konumdan 'home-directory'ye gecmenin kisa yolu:
```
cd ~
```

## Tek adimda istenilen dizine gitmek:
```
cd <isminiz>/bash_dersi/
```
/ isareti altdizin oldugunu belirtiyor & farkli altdizinleri hiyerarsiye gore diziyor – ust konumdan alt konuma dogru.		
			
# Buyuk text verileri ile calisma yontemleri (dizi verisini buyuk bir text verisi olarak dusunebilirsiniz):

Veri cok buyuk oldugundan text icin kullandiginiz grafik arayuzlu programlarin veriyi 'memory' uzerinde tutmasi cok masrafli olur. Gb buyuklugunde iki FASTA dosyasini birlestirmek isterseniz, birini acip kopyalayip-yapistirirken cok fazla memory'yi isgal etmis olursunuz, ayrica mouse ile bu islemi yaparken bir kismini silebilir, tumunu secemeyebilirsiniz vb. Sonunda yapacaginiz analiz & bulacaginiz sonuclar hatali olacaktir. Shell bu durumlarda hem memory'de yer tutmadan hem de sizden kaynaklanan hataya yol acmadan cozmenizi saglar.

## Dosyalari kopyalamak:
```
cp ../../../egitim/bash_dersi_dosyalari/tb1-protein.fasta .
cp ../../../egitim/bash_dersi_dosyalari/tga1-protein.fasta .
ls
```
			
cp kendisinden sonra yazilan tum dosyalari en sondaki dizinin icine kopyalar. Nokta isareti icinde bulundugumuz dizini isaret eder.


## Dosyanin icine bakmak:
```
cat tb1-protein.fasta
```
			
cat komutu sonrasinda yazili olan dosyanin (dosyalarin) icergini gosterir. Bir kac dosya icerigini tek bir dosya kaydetmek icin de kullanabilecegi icin ismi concatanate’ten gelir. 
Dosya ismini girerken mutlaka TAB kullanın! TAB'in zaman kazandirmasi disinda en onemli ozelligi hatalari onler.

```
cat *protein.fasta
```
yildiz isareti joker gibidir, herhangi bir harf ve harf dizisi anlamina gelir.

## Dosyalari tek bir dosyada toplamak:
```
cat *protein.fasta > proteins.fasta
```
'>' isareti oncesindeki icerigi sonrasindaki dosyaya kaydeder. - uzerine yaziyor, dikkat!

'>>' yine yonlendiriyor fakat eger o dosya ismi veri iceriyorsa sonuna ekler.

isminizi tasiyan dizinin icinde ilk_dosyam adinda bir dosya olusturduk. Icine de bu benim ilk dosyam yazdik.

Dosya isimlendirmelerinizin mantikli, anlasilabilir, birbirleri ile iliskili olmasi cok ama cok onemli!

Dosya isimlendirmelerine bosluk vermekten ve /, ‘, “, >, .  isartetlini kullanmaktan kacinalim. Bunlar komut satirinin kullandigi harfler oldugu icin dosya/dizin ismina koyarsak karisirlar.			

kaydetti mi kontrol ediyoruz:
```
cat proteins.fasta
```
			
## Dosya icinden hizlica bilgi almak:
Mesela sadece protein ismini görmek istiyoruz nasıl yapabiliriz?
```
grep protein tb1-protein.fasta
```
			
grep komutu dosyanin icinde belli bir karakteri aratmanizi saglar. Tum satiri verir.
Ya da
```
grep -v "^>" proteins.fasta
```
			
grep man ile bakabiliriz: 
Ilk is FASTA dosyasinda 'header'i iceren satirlari islem disi birakmak (-v).
" " isareti kullanarak ilgili kalibi grep'e tanittik.
 ^ isareti aranan pattern'i sadece satir basi ile sinirliyor.

Not: grep'in cok hizli olmasinin nedenlerinden biri, bir kalibi buldugunda, o satirin gerisini
arastirmayi birakmasi! -o secenegini inceleyin:
```
grep -o CRGEG proteins.fasta
```

   
Simdi de DNA fastası acalim.
```
cp ../../../egitim/bash_dersi_dosyalari/tb1.fasta .
cat tb1.fasta
```
			
Icine kısaca bakalım:

```
head tb1.fasta
```
```
tail tb1.fasta
```
```
wc tb1.fasta
```
```
wc -l tb1.fasta
```
			
COK ONEMLI UYARI: wc gibi islemlerde data formatinin duzgun oldugu sanisi uzerinden hareket ediyoruz.
Eger .txt dosyasi 3 adet bos satir iceriyorsa (whitespace) wc veriye dair 3 fazla satir bilgisi verir!
 
Bu dosyanın icinde ATCG olmayan bir nükleotitler var mi?

```
grep --color -i "[^ATCG]" tb1.fasta
```
^ sembolu [] icinde kullanilinca yaninda oldugu karakterlerin disindaki (!) karakterleri ariyor. Yani [^ATCG], A, T, C, ve T olmayan karakterler ile eslesiyor.

'-i' buyuk-kucuk harf ayrimini ortadan kaldiriyor, eger a, t, g, ve c olarak kaydedilen nukleotidler var ise onlari da dahil etmek dusuncesi ile...

grep'in --color secenegi bulunan karakterleri renkli olarak gosteriyor.

ATCG disinda bir harf var belli ki ama illa genin ismi olan satir da yaziliyor ekrana. Bundan nasil kurtulabiliriz?
   
# Pipeline'a giris:

Pipeline olusturmak Linux-bash'in en guclu ozelliklerinden birisidir. Ornegin 3 farkli program ile bir sekans datasini analiz edeceksiniz. Diyelim ki ilk adim alignment, ikinci adim filogenetik agac olusturmak, ucuncu adim ise atasal DNA dizisi olusturmak. Tek tek adimlari sira ile uygulayabilirsiniz. Veya bir pipeline olusturarak tek bir komut ile islemi hizla gerceklestirebilirsiniz! Ayrica, ornegin birinci ve ikinci islemlerin sonunda olusan ciktiyi bilgisayariniza kaydetmeden pipeline sadece son islemin ciktisini verir. Ozetle pipeline, ilk islemin ciktisini (output) '|' isaretinden sonra gelen ikinci islemde kullanilan araca girdi (input) olarak verir.


Ornek: tb1.fasta dosyasinda nukleotid disinda bulunan diger karakterleri pipeline ile arayalim.

```
grep  --color -i "[^ATCG]" tb1.fasta | grep -v "^>" 
```

oldu ama rengi kaybettik. Ne yapsak?
```
grep -v "^>" tb1.fasta |  grep --color -i "[^ATCG]"
```

'|' pipe ile ciktiyi (output) diger bir bash islemine/programina aktaran pipeline isareti.

pipeline ara-cikti (output) sonuclarini dosyaya yazdirmaz! Boylece disk'e yuk olmaz. 

```
grep -v "^>" tb1.fasta | grep --color -i "[^ATCG]" > results.txt
```


## Sutun verisi ile calismak:

Surekli sadece belli sutunlarda bulunan verilerle calisip diger sutunlari analizimiz disinda birakmamiz gereken durumlar oluyor. Sadece ilgilendigimiz sutunlari almak mumkun. 

Diyelim ki protein isimlerini elde etmek istiyoruz:

```
grep '>' proteins.fasta | cut -d ' ' -f 1
```

## Dosya silmek:
```
rm proteins.fasta
```
tum silmek istediklerimizi rm’un arkasina yazip tek tusla silebiliriz. 

## Dizin silmek:
```
cd ..
rm -r bash_dersi
```

## Cok onemli bir ozellik - komut tarihcesi (history):
```
history
```
```
history > bash_dersi_notlarim
```			

			

SON
