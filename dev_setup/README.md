# How to setup

## WSL 

Run script from repo top dir
```
git clone https://github.com/svengerber/svengerber.git
cd svengerber
./dev_setup/wsl_base.sh
```

Copy personal SSH Keys 
```
cp id_* ~/.ssh
chmod 600 ~/.ssh/id_*
chmod 644 ~/.ssh/*.pub
```

Import GPG Keys and add them to git config
```
gpg --batch --import gpg_*.key
rm gpg_*.key

gpg --list-secret-keys --keyid-format=long
-->  XXXX/<GPG Key ID>
--> add key to .gitconfig.git...
```