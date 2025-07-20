# SQL Injection Simulation

This project simulates SQL Injection attacks and demonstrates detection and mitigation techniques using modern security tools. It is designed for educational and research purposes, providing a controlled environment to understand vulnerabilities, attack vectors, and defense mechanisms.

<table>
  <tr>
    <td align="center"><a href="https://github.com/Vini-ara" target="_blank"><img style="border-radius: 50%;" src="https://github.com/Vini-ara.png" width="100px;" alt="Vinicius Araujo"/><br /><sub><b>Vinicius Araujo</b></sub></a><br /></td>
    <td align="center"><a href="https://github.com/lucasdbr05" target="_blank"><img style="border-radius: 50%;" src="https://github.com/lucasdbr05.png" width="100px;" alt="Lucas Lima"/><br /><sub><b>Lucas Lima</b></sub></a><br /></td>
</td>
</table>

## Features
- **Vulnerable Web Application**: Built with NestJS, exposing endpoints susceptible to SQL Injection.
- **Database Setup**: SQL scripts for schema creation and seeding test data.
- **Attack Simulation**: Scripts and tools (e.g., sqlmap) to automate SQL Injection attacks.
- **Detection**: Integration with Snort (IDS/IPS) and Wazuh for monitoring and alerting.
- **Mitigation**: Example configurations for Snort in IPS mode to block malicious traffic.
- **Infrastructure as Code**: Terraform scripts to provision attacker, web, and database instances in a cloud environment.

## Structure
- `app/`: Source code of the vulnerable application, Dockerfiles, and SQL scripts.
- `infra/`: Terraform scripts for infrastructure automation.
- `scripts/`: Shell scripts for configuring and running the environment.

## Getting Started
1. **Provision Infrastructure**
   - Edit variables in `infra/var.tf` as needed.
   - Deploy with Terraform:
     ```bash
     cd infra
     terraform init
     terraform apply
     ```
2. **Build and Run the Application**
   - Use provided Dockerfiles and scripts in `app/` and `scripts/app/`.
3. **Simulate Attacks**
   - Use `sqlmap` or scripts in `scripts/atacante/` to perform SQL Injection.
4. **Detection and Mitigation**
   - Configure Snort and Wazuh as per documentation to monitor and block attacks.

## Tools Used
- **NestJS**: Web application framework.
- **Docker**: Containerization.
- **Terraform**: Infrastructure automation.
- **Snort**: Intrusion Detection/Prevention System.
- **Wazuh**: Security monitoring and log analysis.
- **sqlmap**: Automated SQL Injection tool.

