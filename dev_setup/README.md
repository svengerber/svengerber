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

```