require "csv" 
 puts"------------------------------"
 puts"あっち向いてホイゲームを始めます。"
 
def janken
 puts "じゃんけん・・・" 
 puts "0(グー)1(チョキ)2(パー)3(戦わない)"
 select_number = gets.to_i
  if !(select_number == 0 || select_number == 1 || select_number ==2)
   select_number = 3
  end
 random_number = rand(3)
 jankens = ["グー","チョキ","パー","戦わない"]
  puts "あなた：#{jankens[select_number]} 相手：#{jankens[random_number]}"
  puts"------------------------------" 

 if select_number ==3 || random_number == 3
   puts"じゃんけんが放棄されました。ゲームを終了します。"
   exit
 end
 number = select_number - random_number
 if number == 0
    puts "あいこです。もう一度じゃんけんをします。"
    return "aiko"
 elsif number == 1 || number == -2
    puts"じゃんけんに負けました。あっちむいて・・・"
    return "make"
 elsif number == -1 || number == 2
    puts "じゃんけんに勝ちました。あっちむいて・・・"
    return "kachi"
 end 
end

def acchimuite_hoi
 puts "0(上)1(下)2(左)3(右)"
 select_number2 = gets.to_i
 random_number2 =rand(3)
 directions = ["上","下","左","右"]
 puts"ホイ！"
 puts "あなた：#{directions[select_number2]} 相手：#{directions[random_number2]}"
 puts"------------------------------"
 if select_number2 == random_number2
  true
 else
  false
 end
end

f1 = nil
loop do
  f1 = janken # じゃんけんをし続ける
  if f1!= "aiko" # もしもあいこでなければ
    f2 = acchimuite_hoi # あっち向いてホイをする
     if f2 # 同じ方向を向いたら
       puts"勝敗がつきました"
       break
     else
       next # じゃんけんからやり直し
     end #IF文終了  
  else # じゃんけんで勝敗がつかなかったら
   next # じゃんけんからやり直し
  end # IF文終了
  break
end # ループ終了

if f1 == "kachi"
  puts "あなたの勝ちです"
elsif f1 == "make"
  puts "あなたの負けです"
end

