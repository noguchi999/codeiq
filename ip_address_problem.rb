require 'ipaddr'

if __FILE__ == $0

  JP_ADDRESS = [
    "1.0.16.0/20",
    "1.0.64.0/18",
    "1.1.64.0/18",
    "1.5.0.0/16",
    "1.21.0.0/16",
    "1.33.0.0/16",
    "1.66.0.0/15",
    "1.72.0.0/13",
    "1.112.0.0/14",
    "14.0.8.0/22",
    "14.1.4.0/22",
    "14.1.8.0/21",
    "14.3.0.0/16",
    "14.8.0.0/13",
    "14.101.0.0/16",
    "14.102.132.0/22",
    "14.102.164.0/22",
    "14.102.176.0/22",
    "14.102.192.0/19",
    "14.128.0.0/22",
    "14.128.16.0/20",
    "14.128.64.0/18",
    "14.132.0.0/15",
    "14.137.224.0/19",
    "14.192.32.0/20",
    "14.192.96.0/19",
    "14.193.0.0/16",
    "27.0.0.0/22",
    "27.0.16.0/20",
    "27.0.32.0/20",
    "27.34.128.0/19",
    "27.34.160.0/20",
    "27.34.192.0/19",
    "27.50.12.0/22",
    "27.50.96.0/19",
    "27.54.96.0/20",
    "27.54.112.0/22",
    "27.54.124.0/22",
    "27.80.0.0/12",
    "27.96.0.0/20",
    "27.96.16.0/21",
    "27.96.32.0/19",
    "27.96.68.0/22",
    "27.96.72.0/21",
    "27.96.80.0/22",
    "27.98.0.0/17",
    "27.98.128.0/18",
    "27.100.8.0/22",
    "27.100.28.0/22",
    "27.100.32.0/22",
    "27.100.48.0/20",
    "27.106.208.0/21",
    "27.106.224.0/19",
    "27.109.96.0/21",
    "27.109.120.0/22",
    "27.110.0.0/18",
    "27.110.96.0/20",
    "27.110.112.0/21",
    "27.111.76.0/22",
    "27.111.128.0/19",
    "27.112.104.0/21",
    "27.112.124.0/22",
    "27.113.192.0/19",
    "27.113.224.0/20",
    "27.113.248.0/22",
    "27.114.0.0/17",
    "27.116.0.0/20",
    "27.116.24.0/21",
    "27.118.0.0/20",
    "27.120.64.0/18",
    "27.120.128.0/17",
    "27.121.0.0/18",
    "27.121.92.0/22",
    "27.121.128.0/17",
    "27.122.4.0/22",
    "27.122.8.0/22",
    "27.122.32.0/20",
    "27.122.48.0/21",
    "27.122.64.0/19",
    "27.122.96.0/20",
    "27.123.8.0/21",
    "27.123.208.0/22",
    "27.123.236.0/22",
    "27.125.204.0/22",
    "27.126.64.0/18",
    "27.126.128.0/20",
    "27.126.160.0/20",
    "27.127.0.0/17",
    "27.127.128.0/18",
    "27.127.240.0/20",
    "27.131.8.0/22",
    "27.131.16.0/20",
    "27.131.192.0/20",
    "27.131.224.0/20",
    "27.131.240.0/21",
    "27.132.0.0/14",
    "27.136.0.0/13",
    "27.147.64.0/18",
    "27.228.0.0/14",
    "27.253.128.0/17",
    "36.2.0.0/15",
    "36.8.0.0/13",
    "36.52.0.0/14",
    "36.240.0.0/13",
    "36.255.36.0/22",
    "36.255.120.0/22",
    "36.255.160.0/22",
    "36.255.216.0/22",
    "36.255.236.0/22",
    "39.2.0.0/15",
    "39.110.0.0/15",
    "42.83.0.0/18",
    "42.99.128.0/17",
    "42.123.32.0/22",
    "42.124.0.0/14",
    "42.144.0.0/13",
    "42.187.124.0/22",
    "43.0.0.0/9",
    "43.128.0.0/10",
    "43.192.0.0/11",
    "43.224.32.0/22",
    "43.225.88.0/22",
    "43.228.104.0/22",
    "43.229.32.0/22",
    "43.229.240.0/21",
    "43.230.52.0/22",
    "43.231.188.0/22",
    "43.231.220.0/22",
    "43.231.244.0/22",
    "43.232.0.0/14",
    "43.239.104.0/22",
    "43.242.136.0/22",
    "43.244.0.0/16",
    "43.246.128.0/22",
    "43.246.192.0/21",
    "43.247.72.0/22",
    "43.247.168.0/22",
    "43.248.40.0/22",
    "43.248.160.0/22",
    "43.248.216.0/22",
    "43.249.44.0/22",
    "43.249.240.0/21",
    "43.250.88.0/22",
    "43.250.196.0/22",
    "43.250.228.0/22",
    "43.251.48.0/22",
    "43.251.184.0/22",
    "43.253.0.0/16",
    "43.255.40.0/22",
    "45.112.128.0/22",
    "45.113.4.0/22",
    "45.113.116.0/22",
    "45.113.172.0/22",
    "45.114.16.0/22",
    "45.114.112.0/22",
    "45.114.184.0/22",
    "45.114.208.0/22",
    "45.115.32.0/22",
    "45.115.192.0/22",
    "45.116.72.0/22",
    "45.116.92.0/22",
    "45.116.132.0/22",
    "45.116.224.0/22",
    "45.117.16.0/22",
    "45.117.140.0/22",
    "45.118.40.0/22",
    "45.118.132.0/22",
    "45.119.164.0/22",
    "45.119.204.0/22",
    "45.119.208.0/22",
    "45.120.132.0/22",
    "45.120.176.0/22",
    "45.120.192.0/21",
    "45.121.148.0/22",
    "45.121.184.0/22",
    "45.122.224.0/22",
    "45.123.208.0/22",
    "45.124.60.0/22",
    "45.124.136.0/22",
    "45.124.204.0/22",
    "45.124.216.0/21",
    "45.125.188.0/22",
    "45.125.240.0/22",
    "45.126.84.0/22",
    "45.126.156.0/22",
    "45.127.28.0/22",
    "45.251.132.0/22",
    "49.0.16.0/21",
    "49.96.0.0/12",
    "49.128.16.0/20",
    "49.128.96.0/21",
    "49.128.128.0/19",
    "49.129.0.0/16",
    "49.132.0.0/14",
    "49.143.240.0/21",
    "49.156.4.0/22",
    "49.156.8.0/21",
    "49.156.160.0/19",
    "49.156.192.0/18",
    "49.212.0.0/16",
    "49.236.224.0/20",
    "49.238.0.0/19",
    "49.239.64.0/18",
    "49.240.0.0/14",
    "49.250.0.0/15",
    "49.252.0.0/15",
    "58.0.0.0/15",
    "58.3.0.0/16",
    "58.4.0.0/15",
    "58.12.0.0/15",
    "58.65.32.0/19",
    "58.70.0.0/16",
    "58.80.0.0/15",
    "58.84.240.0/20",
    "58.85.0.0/16",
    "58.87.16.0/20",
    "58.87.128.0/17",
    "58.88.0.0/13",
    "58.98.0.0/16",
    "58.112.0.0/15",
    "58.138.0.0/17",
    "58.138.128.0/18",
    "58.145.160.0/21",
    "58.145.176.0/21",
    "58.145.192.0/19",
    "58.145.224.0/23",
    "58.145.228.0/24",
    "58.145.234.0/24",
    "58.145.240.0/20",
    "58.146.0.0/18",
    "58.146.64.0/19",
    "58.147.160.0/21",
    "58.147.192.0/18",
    "58.156.0.0/14",
    "58.183.0.0/16",
    "58.188.0.0/14",
    "59.84.0.0/15",
    "59.86.0.0/17",
    "59.86.128.0/19",
    "59.87.0.0/16",
    "59.106.0.0/16",
    "59.128.0.0/12",
    "59.146.0.0/15",
    "59.151.128.0/18",
    "59.153.40.0/21",
    "59.153.140.0/22",
    "59.153.204.0/22",
    "59.156.0.0/14",
    "59.166.0.0/16",
    "59.168.0.0/14",
    "59.190.0.0/16",
    "59.191.128.0/18",
    "60.32.0.0/12",
    "60.56.0.0/14",
    "60.60.0.0/15",
    "60.62.0.0/16",
    "60.64.0.0/10",
    "60.128.0.0/11",
    "60.192.0.0/15",
    "60.236.0.0/14",
    "60.254.192.0/18",
    "61.4.128.0/19",
    "61.4.160.0/20",
    "61.5.224.0/19",
    "61.7.0.0/17",
    "61.8.0.0/18",
    "61.8.80.0/20",
    "61.11.128.0/18",
    "61.11.192.0/20",
    "61.12.128.0/17",
    "61.14.128.0/18",
    "61.14.224.0/22",
    "61.21.0.0/16",
    "61.22.0.0/15",
    "61.24.0.0/14",
    "61.44.0.0/16",
    "61.45.0.0/17",
    "61.45.192.0/19",
    "61.45.240.0/21",
    "61.46.0.0/16",
    "61.47.0.0/24",
    "61.47.3.0/24",
    "61.47.4.0/23",
    "61.47.15.0/24",
    "61.47.17.0/24",
    "61.47.21.0/24",
    "61.47.22.0/24",
    "61.47.24.0/24",
    "61.47.27.0/24",
    "61.47.29.0/24",
    "61.47.44.0/23",
    "61.47.46.0/24",
    "61.47.49.0/24",
    "61.47.50.0/23",
    "61.47.53.0/24",
    "61.47.54.0/23",
    "61.47.56.0/24",
    "61.47.64.0/23",
    "61.47.66.0/24",
    "61.47.72.0/21",
    "61.47.88.0/21",
    "61.47.98.0/23",
    "61.47.102.0/23",
    "61.47.108.0/22",
    "61.86.0.0/16",
    "61.87.0.0/17",
    "61.87.128.0/18",
    "61.89.0.0/16",
    "61.112.0.0/12",
    "61.192.0.0/12",
    "61.208.0.0/13",
    "61.245.0.0/17",
    "61.245.192.0/19",
    "64.33.0.0/18",
    "64.56.160.0/19",
    "65.99.0.0/18",
    "65.99.64.0/19",
    "76.77.48.0/20"
  ]

  def ip_address_problem(ip_address: "")
    JP_ADDRESS.each do |jp|
      return 1 if IPAddr.new(jp).include? ip_address
    end
    0
  end

  args = $stdin.read.split("\n")
  puts ip_address_problem(ip_address: args[0])
end
