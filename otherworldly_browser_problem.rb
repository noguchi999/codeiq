class OtherWorldlyBrowserProblem
    MamellaFiredog = /Mamella\/5\.0 \(.+?\) Lizard\/\d{8} Firedog\/\d{1,2}\.\d{1}/
    OrangeVoyage   = /\(like Lizard\) Version/
    AnachroSoftInternetTraveller_2_7  = /Mamella\/4\.0 \(compatible; ASIT/
    AnachroSoftInternetTraveller_8_10 = /Mamella\/5\.0 \(compatible; ASIT/
    AnachroSoftInternetTraveller_11   = /Quadent.+?KNOT/
    AnachroSoftInternetTraveller_12   = /Quadent.+?OrangeKit/
    KabukiBrowser_7_8 = /Mamella\/4\.0.+?Kabuki/
    KabukiBrowser_1_6 = /Mamella\/4\.0 \(compatible;.+?Kabuki/
    KabukiBrowser_9_14 = /\AKabuki/
    KabukiBrowser_15_40 = /KBK/
    GluegeMonochrome = /Monochrome(?!.*KBK)/

  def initialize(user_agent: "")
    @user_agent = user_agent
  end

  def play()
    puts check_browser
  end

private
  def check_browser()
    return "MFD" if @user_agent.match MamellaFiredog
    return "VYG" if @user_agent.match OrangeVoyage
    return "KBK" if @user_agent.match KabukiBrowser_7_8
    return "KBK" if @user_agent.match KabukiBrowser_1_6
    return "KBK" if @user_agent.match KabukiBrowser_9_14
    return "KBK" if @user_agent.match KabukiBrowser_15_40
    return "ASIT" if @user_agent.match AnachroSoftInternetTraveller_2_7
    return "ASIT" if @user_agent.match AnachroSoftInternetTraveller_8_10
    return "ASIT" if @user_agent.match AnachroSoftInternetTraveller_11
    return "ASIT" if @user_agent.match AnachroSoftInternetTraveller_12
    return "GMC" if @user_agent.match GluegeMonochrome
  end
end

if __FILE__ == $0
  args = $stdin.read.split("\n")
  OtherWorldlyBrowserProblem.new(user_agent: args[0]).play
end
