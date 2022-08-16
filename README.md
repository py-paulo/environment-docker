# Environment Docker

Ambiente [Docker](https://docs.docker.com/) com pacote de ferramentas para iniciar o desenvolvimento rápido.

O [Dockerfile](./Dockerfile) contém os seguintes pacotes e ferramentas:
* [x] [NVM](https://github.com/nvm-sh/nvm)
* [x] [PYENV](https://github.com/pyenv/pyenv)
* [x] [vim](https://www.vim.org/)
* [x] [oh-my-bash](https://github.com/ohmybash/oh-my-bash)

## Ambiente

```
S.O: Ubuntu 22.04
sh:  Bash
```

## Uso básico

O Dockerfile tenta copiar as chaves da pasta `./.ssh` (a partir do root do projeto) para `/home/ubuntu/.ssh/`, facilitando o clone de projetos GIT.
