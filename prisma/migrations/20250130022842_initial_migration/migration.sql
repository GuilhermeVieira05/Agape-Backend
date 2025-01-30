-- CreateEnum
CREATE TYPE "Estados" AS ENUM ('AC', 'AL', 'AP', 'AM', 'BA', 'CE', 'DF', 'ES', 'GO', 'MA', 'MT', 'MS', 'MG', 'PA', 'PB', 'PR', 'PE', 'PI', 'RJ', 'RN', 'RS', 'RO', 'RR', 'SC', 'SP', 'SE', 'TO');

-- CreateTable
CREATE TABLE "Endereco" (
    "id" SERIAL NOT NULL,
    "cep" VARCHAR(8) NOT NULL,
    "rua" VARCHAR(255) NOT NULL,
    "numero" INTEGER NOT NULL,
    "complemento" VARCHAR(255),
    "bairro" VARCHAR(255) NOT NULL,
    "estado" "Estados" NOT NULL,
    "cidade" VARCHAR(255) NOT NULL,
    "pais" VARCHAR(255) NOT NULL,
    "userId" TEXT,
    "obraId" INTEGER,

    CONSTRAINT "Endereco_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "User" (
    "cpf" VARCHAR(11) NOT NULL,
    "nome" VARCHAR(255) NOT NULL,
    "data_nascimento" DATE NOT NULL,
    "email" VARCHAR(255) NOT NULL,
    "telefone" VARCHAR(200) NOT NULL,
    "password" VARCHAR(50) NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("cpf")
);

-- CreateTable
CREATE TABLE "Obra" (
    "id" SERIAL NOT NULL,
    "nome" VARCHAR(100) NOT NULL,

    CONSTRAINT "Obra_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Servico" (
    "id" SERIAL NOT NULL,
    "nome" VARCHAR(200) NOT NULL,
    "obra_id" INTEGER NOT NULL,

    CONSTRAINT "Servico_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Serve" (
    "usuarioCpf" TEXT NOT NULL,
    "obraId" INTEGER NOT NULL,
    "servicoId" INTEGER NOT NULL,
    "cargo" VARCHAR(100) NOT NULL,

    CONSTRAINT "Serve_pkey" PRIMARY KEY ("usuarioCpf","obraId","servicoId")
);

-- CreateIndex
CREATE UNIQUE INDEX "Endereco_userId_key" ON "Endereco"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "Endereco_obraId_key" ON "Endereco"("obraId");

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Servico_obra_id_nome_key" ON "Servico"("obra_id", "nome");

-- CreateIndex
CREATE UNIQUE INDEX "Serve_usuarioCpf_key" ON "Serve"("usuarioCpf");

-- CreateIndex
CREATE UNIQUE INDEX "Serve_obraId_key" ON "Serve"("obraId");

-- CreateIndex
CREATE UNIQUE INDEX "Serve_servicoId_key" ON "Serve"("servicoId");

-- AddForeignKey
ALTER TABLE "Endereco" ADD CONSTRAINT "Endereco_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("cpf") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Endereco" ADD CONSTRAINT "Endereco_obraId_fkey" FOREIGN KEY ("obraId") REFERENCES "Obra"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Servico" ADD CONSTRAINT "Servico_obra_id_fkey" FOREIGN KEY ("obra_id") REFERENCES "Obra"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Serve" ADD CONSTRAINT "Serve_usuarioCpf_fkey" FOREIGN KEY ("usuarioCpf") REFERENCES "User"("cpf") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Serve" ADD CONSTRAINT "Serve_obraId_fkey" FOREIGN KEY ("obraId") REFERENCES "Obra"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Serve" ADD CONSTRAINT "Serve_servicoId_fkey" FOREIGN KEY ("servicoId") REFERENCES "Servico"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
