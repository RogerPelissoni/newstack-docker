## Tutorial para inicialização do projeto

### WSL

- Entre na Microsoft Store e procure por Ubuntu, efetue o download (preferencialmente a última versão LTS disponível)
- Após o download finalizado, procure por este App na barra de pesquisa e o inicialize
  - Após inicilizar irá perguntar o nome de usuário que deseja atribuir e também uma senha (importante lembrar)

### Git

- Agora vamo gerar uma chave SSH para efetuar o clone dos repositórios necessários, execute os seguintes comandos:
  - ssh-keygen -t ed25519 -C "seu-email@exemplo.com"
  - eval "$(ssh-agent -s)"
  - ssh-add ~/.ssh/id_ed25519
  - cat ~/.ssh/id_ed25519.pub
- Este último comando irá exibir a chave SSH, copie a mesma, entre no seu GitHub, clique no seu avatar de perfil, procure por Settings, acesse a aba "SSH and GPG Keys", clique em "New SSH key", escolha um Título para a chave SSH, e cole exatamente o conteúdo que foi exibido no terminal no campo Key, após pode adicionar a chave em "Add SSH key"

### Executando clone de repositórios

- Criação de pasta que irá comportar os repositórios
  - mkdir ~/dev
- Clonagem do repositório docker
  - cd ~/dev
  - git clone git@github.com:rogerpelissoni/saas-docker
- Execução de script para efetuar demais configurações necessárias
  - chmod +x ~/dev/saas-docker/entrypoint.sh
  - ~/dev/saas-docker/entrypoint.sh
    - O que esse script faz?
      - Clonagem do repositório saas-api
      - Clonagem do repositório saas-nuxt
      - Crição do .env para Docker (ajuste caso necessário)
- Configurar git
  - git config --global user.email "you@example.com"
  - git config --global user.name "Your Name"

### Instalando Docker

- Atualizar pacotes do sistema
  - sudo apt update
  - sudo apt upgrade -y
- Dependências obrigatórias
  - sudo apt install -y ca-certificates curl gnupg lsb-release
- Adicionar chave GPG oficial do Docker
  - sudo mkdir -p /etc/apt/keyrings
  - curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
  - sudo chmod a+r /etc/apt/keyrings/docker.gpg
- Adicionar repositório do Docker
  - echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
- Instalar Docker + Docker Compose
  - sudo apt update
  - sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
- Permitir usar Docker sem sudo (IMPORTANTE)
  - sudo usermod -aG docker $USER
- Fechar e abrir novamente o WSL para aplicar alterações
  - exit
  - Abra novamente o WSL Ubuntu

### Configurações inicial do projeto

- Inicializar containers
  - cd ~/dev/saas-docker
  - docker compose up -d
- Rodar migrações
  - docker compose exec api php artisan migrate
- Popular banco de dados
  - docker compose exec api php artisan db:reset

### Inicializando projeto

- Portas diponíveis
  - Nuxt
    - http://localhost:3000
      - Usuário para testes
        - Login: admin@admin.com
        - Senha: 123456
  - API
    - http://localhost:8000

### Comandos úteis
  - Limpar o Docker
    - docker system prune -a --volumes