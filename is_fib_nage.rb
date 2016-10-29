=begin
【概要】
数列を与えます。
与えられた数列が以下のいずれの数列（の、途中の連続した5項）なのかを判別するプログラムを書いてください。
記号  名称
G 等比数列
A 等差数列
F フィボナッチ数
x G, A, F のいずれにも該当しない
【入出力】
入力は
1 2 4 8 16
こんな感じです。
スペース区切りで 5個の10 進数が並んでいます。
出力は、
G
のように、G, A, F, x のいずれかを出力してください。
末尾の改行はあってもなくても構いません。
【例】
入力  出力
1 2 4 8 16  G
1 2 3 4 5 A
3 5 8 13 21 F
1 2 123 1234 9999 x
【補足】
入力に含まれる値は、1以上、100億以下の整数です。
入力は、全て狭義単調増加列になっています。
不正な入力に対処する必要はありません。
G, A, F は大文字ですが、 x は小文字です。
1, 4, 5, 9, 14, 23, … という数列はフィボナッチではありません。
=end

if $0 == __FILE__
  def is_g(nums)
    nums.each_cons(2).map{ |x,y| x.to_r/y }.uniq.size==1
  end

  def is_a(nums)
    nums.each_cons(2).map{ |x,y| y-x }.uniq.size==1
  end

  def is_f(nums)
    fibs = [ 0, 1, 1, 2, 3 ]
    while fibs[0]<nums[0] do
      fibs = fibs[1,4]+[fibs[-1]+fibs[-2]]
    end
    return fibs==nums
  end

  def solve(src)
    nums = src.split(/\s+/).map(&:to_i)
    return "G" if is_g(nums)
    return "A" if is_a(nums)
    return "F" if is_f(nums)
    return "x"
  end

  puts solve(gets)
end