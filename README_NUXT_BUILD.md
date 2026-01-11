## ⏱️ Nuxt – Tempo de Build por Ambiente

Abaixo estão os tempos médios de build do projeto Nuxt em diferentes ambientes de execução.

> **Referência:** Windows nativo (2m 18s / 138s)

| Ambiente                  | Tempo de Build | Ganho em relação ao Windows |
|---------------------------|---------------|-----------------------------|
| 🪟 Windows (nativo)       | 2m 18s (138s) | —                           |
| 🪟 Windows + WSL + Docker | 39s           | **≈ 71.7% mais rápido**     |
| 🐧 Linux (nativo)         | 21.5s         | **≈ 84.4% mais rápido**     |
| 🐧 Linux + Docker         | 29s           | **≈ 79.0% mais rápido**     |

### 📌 Observações Técnicas
- O **Linux nativo** apresentou o melhor desempenho geral, sendo aproximadamente **84% mais rápido** que o Windows nativo.
- A utilização de **WSL + Docker no Windows** reduz significativamente o tempo de build, com ganho de cerca de **72%**, tornando-se uma alternativa viável para desenvolvimento.
- No Linux, a execução via **Docker adiciona uma sobrecarga de aproximadamente 35%** no tempo de build quando comparado ao Linux nativo.
- Mesmo com Docker, o Linux mantém desempenho superior ao Windows nativo.

### ✅ Conclusão
O sistema operacional e o ambiente de execução impactam diretamente o tempo de build do Nuxt. Para melhor performance:
- **Produção / CI:** Linux nativo  
- **Desenvolvimento no Windows:** WSL + Docker  
- **Evitar:** Windows nativo para builds frequentes
