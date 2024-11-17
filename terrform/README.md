# Infra as code repository template

Template de repositório que tem o objetivo de escalar e melhorar a qualidade da entrega de infraestrutura como código.



## O que esse repositório faz?

Ao criar um repositório a partir do template, é triggado uma action que faz a criação de um workspace no [Terraform Cloud](https://app.terraform.io/app/KXC/workspaces). Esse workspace detecta pull requests para executa um plan,e após aprovação manual, executa o apply.
Com isso, a equipe pode centralizar o state no Terraform Cloud, permitindo que os técnicos trabalhem em equipe para desenvolver o código da infra estrutura. O repositório também possui uma pipeline que verifica a formatação do terraform, para garantir a qualidade do código. Issues criadas nos repositórios geram cards no Github Projects.


## Como utilizar esse repositório

### Criando um repositório a partir de um template

 * Selecionar o repositório: [kxc-tecnologia/iac-repo-template](https://github.com/kxc-tecnologia/iac-repo-template).
 
 * Clicar em **Use this Template** e selecionar **Create new repository**.
![image](https://github.com/kxc-tecnologia/demo-tfc/assets/84737230/2e178e99-027f-4801-b66d-4eb2e93c0968)

 * Selecionar a organization como Owner, marcar a opção **Private**, dar um nome ao repositório(O nome do repositório deve ser no formato infra-cliente-dev ) e clicar no botão **Create repository**.
![image](https://github.com/kxc-tecnologia/demo-tfc/assets/84737230/e7561aa6-63e7-41e8-8576-2d6cb259eeaa)


 * Em caso de dúvidas, consultar a [documentação](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template) oficial

### Configurando o repositório 
 * Ao ser criado o novo repositório, Vá em Settings, depois selecione Actions dentro de Secrets and variables.

![image](https://github.com/kxc-tecnologia/iac-repo-template/assets/84737230/1e505f40-f581-4443-b085-7f7d4d416fc1)


 * Configurar as credenciais da AWS por meio de **Secrets**, cadastrando as secrets **AWS_AK**, **AWS_REGION** e **AWS_SK**.

   
   ![image](https://github.com/kxc-tecnologia/iac-repo-template/assets/84737230/21dd66c0-ceb0-41f8-bee0-6be0d7f6a4c0)


   ![image](https://github.com/kxc-tecnologia/iac-repo-template/assets/84737230/05dc5ea0-5161-45e2-818f-54f16fdbde5e)



 * Após isso, basta abrir um pull request para validar se o plan está ocorrendo corretamente.

![image](https://github.com/kxc-tecnologia/iac-repo-template/assets/84737230/cb413a3b-dbba-481c-9908-14a8b4ca6899)

## Requisito

Dentro do arquivo backend.tf, obrigatoriamente deve ser utilizado o bloco de backend S3 para armazenar o .tfstate do cliente na AWS e permitir que o fluxo remoto aconteça.

```
terraform {
  backend "s3" {
    bucket = "kxc-github-terraform"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
```

## Entendendo o fluxo de terraform

Ao abrir um pull request e criando commits no pull request existente, automaticamente será triggado uma verificação de lint do código e um ```terraform plan``` no folder root do projeto. (temporariamente uma limitação)

O output do terraform plan será comentado no pull request criado pelo usuário suporteKXC.

![image](https://github.com/kxc-tecnologia/iac-repo-template/assets/84737230/89d385be-8892-4ea4-9f38-7005a4e317d6)

Após a verificação do plan, caso o usuário deseje aplicar as alterações, basta comentar ```terraform apply``` no pull request. 
**Porém, é preciso no mínimo 1 aprovação para que o comando seja aplicado. O criador do pull request não pode aprovar o próprio PR aberto. O fluxo está funcionando dessa forma para garantir que o código aplicado seja revisado por mais uma pessoa ou que seja revisado com maior atenção pelo mesmo usuário.(Caso esteja sozinho em um projeto, use a conta suporteKXC para aprovação)**

Exemplo de fluxo sem aprovação:

![image](https://github.com/kxc-tecnologia/iac-repo-template/assets/84737230/f0eb263e-df65-4c69-8594-2d21841822a4)


Exemplo de fluxo com aprovação:



![image](https://github.com/kxc-tecnologia/iac-repo-template/assets/84737230/ee8dd132-0798-4b44-aaf6-d98ad0fe8d57)


Para melhor visualização do fluxo, clique em Actions dentro do repositório.

![image](https://github.com/kxc-tecnologia/iac-repo-template/assets/84737230/17b9913c-f056-4d9a-a89d-7f8a0fa39b44)




## issues

Issues criadas nos repositórios geram card no Github Projects, facilitando a visualização das tarefas relacionadas ao github.

![image](https://github.com/kxc-tecnologia/demo-tfc/assets/84737230/58b1ad80-18ff-424c-aab8-3494a463dedb)


# terraform-konsi-eks
