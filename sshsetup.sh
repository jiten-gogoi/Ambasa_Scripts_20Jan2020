su - grid
cd /softwares/11.2.0.4.0/grid/sshsetup
./sshUserSetup.sh -user grid -hosts "racnode1 racnode2 racnode5 racnode6" -noPromptPassphrase -confirm -advanced
su - oracle
./sshUserSetup.sh -user oracle -hosts "racnode1 racnode2 racnode5 racnode6" -noPromptPassphrase -confirm -advanced
