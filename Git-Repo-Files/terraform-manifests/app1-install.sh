#! /bin/bash
sudo yum update -y
sudo yum install -y httpd
sudo systemctl enable httpd
sudo service httpd start  

# Create index.html for root path
sudo tee /var/www/html/index.html > /dev/null <<EOF
<!DOCTYPE html>
<html>
  <head>
    <title>Sarang DevOps Blog</title>
    <style>
      body {
        font-family: Arial, sans-serif;
        background-color: #f0f4f8;
        padding: 40px;
        line-height: 1.6;
      }
      h1 {
        color: #2c3e50;
        font-size: 36px;
      }
      h2 {
        color: #34495e;
        font-size: 28px;
        margin-top: 40px;
      }
      p, li {
        color: #555;
        font-size: 18px;
      }
    </style>
  </head>
  <body>
    <h1>Sarang DevOps</h1>
    <h1>DEMO WEBSITE</h1>

    <h2>AWS VPC Explained</h2>
    <p>A Virtual Private Cloud (VPC) is a logically isolated section of the AWS Cloud where you can launch AWS resources in a virtual network that you define.</p>

    <p>With a VPC, you can define a custom IP address range, create subnets, configure route tables, and set up network gateways.</p>

    <p>Key components of a VPC include:</p>
    <ul>
      <li><strong>Subnets</strong>: Isolated sections of your VPC for organizing resources</li>
      <li><strong>Route Tables</strong>: Control traffic routing within and outside the VPC</li>
      <li><strong>Internet Gateway (IGW)</strong>: Enables internet access for public subnets</li>
      <li><strong>NAT Gateway</strong>: Allows instances in private subnets to access the internet</li>
      <li><strong>Security Groups</strong>: Act as virtual firewalls for your instances</li>
    </ul>

    <p>This setup allows you to securely and efficiently manage cloud infrastructure with complete control over networking.</p>
  </body>
</html>
EOF

# Create /app1 directory and additional page
sudo mkdir -p /var/www/html/app1
sudo echo '<h1>Welcome to Sarang DevOps Blog - APP-1</h1>' | sudo tee /var/www/html/app1/index.html

# Add EC2 instance metadata to metadata.html
TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")
sudo curl -H "X-aws-ec2-metadata-token: $TOKEN" \
  http://169.254.169.254/latest/dynamic/instance-identity/document \
  -o /var/www/html/app1/metadata.html
