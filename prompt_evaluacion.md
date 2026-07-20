# 📊 Evaluación de Prompts y Flujo de Trabajo Agéntico

## Proyecto: webIA
## Fecha de Evaluación: 6 de julio de 2026
## Evaluador: Roberto (AI Workflow Analyst)

---

## Resumen Ejecutivo

Este informe presenta un análisis detallado y riguroso de la interacción entre el desarrollador (usuario) y el agente de IA durante el desarrollo del proyecto **webIA**. El proyecto consiste en una plataforma web (Astro + Tailwind CSS 4) alojada en una VPS para ofrecer acceso a modelos de IA a clientes en Cuba, utilizando un flujo dinámico conectado con **n8n**, bases de datos (JSON/Google Sheets) e integraciones con WhatsApp (Baileys/Green API).

A lo largo de las **77 interacciones** analizadas, se observa una evolución notable: el desarrollador comenzó solicitando explicaciones de hosting y "vibe-coding" visual de componentes frontend, y terminó estructurando automatizaciones complejas, migraciones de APIs de mensajería (Baileys con PM2) y depuración de flujos en n8n.

*   **Puntuación General:** **6.3 / 10**
*   **Fortaleza Clave:** Uso excelente de archivos de especificaciones externos (`promt_error.md`, `design_audit_and_plan.md`) y propuesta arquitectónica previa (`propuesta_arquitectura_baileys.md`) para guiar cambios estructurales.
*   **Debilidad Clave:** Tendencia al "vibe-coding" en el diseño visual, falta de especificaciones de UI previas, alta frecuencia de errores tipográficos en los prompts y cruce accidental de contextos que requirieron reversiones completas de código.

---

## Metodología

La evaluación se realizó mediante el análisis sistemático de las interacciones registradas en el archivo `transcript.jsonl` del Conversation ID `c80f5892-2505-4b31-a8e3-76d201962be8`. Se extrajeron y clasificaron todos los mensajes del tipo `USER_INPUT` y se evaluaron bajo el marco de mejores prácticas de **Desarrollo Guiado por Especificaciones (Spec-Driven Development)** y **Context Engineering** de 2025/2026.

Asimismo, se contrastó el comportamiento del usuario con las siguientes fuentes de mejores prácticas obtenidas mediante búsqueda en la Web:
1.  *Shift from Prompting to Context Engineering (Anthropic & OpenAI 2025/2026)*.
2.  *Spec-Driven Development (SDD) for Agentic Coding assistants*.
3.  *Mitigating LLM Vibe-Coding in Frontend Architectures*.

---

## Análisis del Historial de Conversaciones

El desarrollo de **webIA** pasó por las siguientes fases clave:
1.  **Fase de Concepción y Configuración de VPS (Prompts 1-16):** Definición de la infraestructura (Astro, SSG, Tailwind 4, DNS en Hostinger, Caddy).
2.  **Fase de Maquetación Frontend e Identidad Visual (Prompts 17-45):** Iteración sobre el diseño de las tarjetas de precios (Gemini, ChatGPT, Claude) aplicando pautas de marca de Carmay Outfit. Problemas constantes de ajuste y tamaño de logos. Introducción del archivo `promt_error.md`.
3.  **Fase de Lógica y Modelo de Negocio (Prompts 46-50):** Suministro de selectores de meses, preformateo de mensajes de WhatsApp y la idea de usar un archivo JSON dinámico para sincronizar precios mediante un agente en segundo plano.
4.  **Fase de Mensajería y Backend (Prompts 51-59):** Suministro de Baileys, propuesta de arquitectura (`propuesta_arquitectura_baileys.md`), uso de PM2 para el WebSocket de WhatsApp y pruebas en vivo.
5.  **Fase de Integración n8n y Corrección de Errores (Prompts 60-77):** Depuración del flujo `cVilQNdXYZAUH10M` para evitar la creación de filas duplicadas en Sheets al registrar estados "Saltado" y corrección de comportamientos lógicos del bot.

---

## Evaluación por Dimensiones

### a) Claridad y Especificidad
*   **Puntuación:** **6.0 / 10**
*   **Comentario:** El usuario es explícito en cuanto a las reglas del negocio (por ejemplo, cobrar un 25% extra redondeado hacia arriba, tipo de cambio 1 USD = 700 CUP). Sin embargo, abusa de descripciones abstractas o subjetivas al diseñar la UI, obligando al agente a adivinar ("vibe coding"). Además, la alta presencia de errores ortográficos dificulta la comprensión exacta del prompt.
*   **Ejemplos:**
    *   *Positivo (Especificidad numérica):* *"precios de sus planes y sobre todos cuales son todas sus ofertas... redondeado hacia arriba y una precio en CUP equivalemtne a 700 por un dolar"* (User Input 10).
    *   *Negativo (Subjetividad visual):* *"quiero una estilo mas moderno , y distintivo he visto cietnods de web con este estilo exacto qiero algo diferente quiero efectos de card espejo con transaprencai"* (User Input 18).

### b) Gestión del Contexto
*   **Puntuación:** **7.0 / 10**
*   **Comentario:** Excelente uso de referencias a entornos reales mediante URLs (`https://carmayn8n.cloud/workflow/...`, `https://ia.carmayn8n.cloud/`). No obstante, en la mitad del proyecto hubo una confusión grave de contexto al mezclar directivas de comunicación personales (de Álvaro/Alejandro) con el código de producción del WebSocket, obligando a revertir los cambios.
*   **Ejemplos:**
    *   *Positivo:* Uso de la guía de marca *# Brand Guidelines & Business Rules: Carmay Outfit* (User Input 17).
    *   *Negativo:* *"quiero que olvides todo lo que hemos hablado sobre las directivas sobre los mensajes de whatsapp... fue un error de mi parte y no compete a este proyecto"* (User Input 64).

### c) Control de Alcance
*   **Puntuación:** **5.5 / 10**
*   **Comentario:** El alcance fluctuó de forma descontrolada en sesiones consecutivas: se pasaba de configurar Caddy a rediseñar por completo la UI, luego a cambiar la API de WhatsApp, y de ahí a PM2 y n8n. No se establecieron hitos claros o entregas parciales, lo que extendió innecesariamente la cantidad de iteraciones en el diseño visual de los logos.
*   **Ejemplos:**
    *   *Falta de control:* Modificar los logos y contenedores circulares más de 5 veces consecutivas (User Inputs 36-41) por no definir las dimensiones de forma estructurada en un primer paso.

### d) Manejo de Errores y Recuperación
*   **Puntuación:** **7.5 / 10**
*   **Comentario:** El usuario es hábil detectando fallas funcionales y reportando trazas detalladas de error (como las de Axios ECONNREFUSED en n8n). En lugar de quejarse de manera genérica, provee los logs exactos y solicita la corrección específica.
*   **Ejemplos:**
    *   *Positivo:* Copia y pega de errores JSON exactos de n8n (User Inputs 71 y 73) y dirección de flujos erróneos: *"cuando colocas el estado saltado se lo estas aplciando no al producto sino que lo hace en una nueva fila por lo que es preciso que ajuets el nodo sheet"* (User Input 72).

### e) Enfoque Guiado por Especificaciones (Spec-Driven / Plan-First)
*   **Puntuación:** **6.5 / 10**
*   **Comentario:** Se aprecia el uso de especificaciones escritas como `promt_error.md` para canalizar revisiones. Sin embargo, este archivo fue creado *a posteriori* como una lista de quejas de diseño en lugar de ser un `SPEC.md` previo a la escritura del código. La propuesta arquitectónica para Baileys sí cumplió con el estándar Plan-First de forma ejemplar.
*   **Ejemplos:**
    *   *Positivo:* *"redacta un docuemtno detallado donde expiques con mucho detalle que vamos a hacer y porque [propuesta_arquitectura_baileys.md]"* (User Inputs 53-54).

### f) Madurez del Flujo de Trabajo Agéntico
*   **Puntuación:** **6.0 / 10**
*   **Comentario:** El usuario comprende el uso de agentes para tareas autónomas (como la búsqueda de precios para actualizar el JSON a las 12 PM). No obstante, comete el error de pedirle al agente que "visite" y "escanee" webs de competidores y copie sus estilos exactos mediante SVG, ignorando las limitaciones del agente en cuanto a la emulación visual en tiempo real.
*   **Ejemplos:**
    *   *Limitación de agente:* *"entra en cada uno de stas y escanea su pagian web vamso a copiar sus estilso apra que en esta secciones..."* (User Input 18).

### g) Comunicación Técnica
*   **Puntuación:** **7.0 / 10**
*   **Comentario:** El usuario domina la terminología (Docker Compose, PM2, Astro SSG, DNS A Records, WebSockets, JSON, n8n variables globales). La comunicación es fluida y entiende la explicación de la arquitectura de red (IPs locales 127.0.0.1 vs 172.16.1.1 en contenedores).

---

## Fortalezas Identificadas

1.  **Iteración mediante especificaciones offline:** El uso de archivos como `promt_error.md` y la lectura directa del sistema por parte del agente reduce el ruido del chat de la consola y permite correcciones en lote.
2.  **Solicitud de propuestas previas:** Pedir una propuesta de arquitectura (`propuesta_arquitectura_baileys.md`) antes de desplegar código redujo la posibilidad de romper el servidor de mensajería existente.
3.  **Provisión de trazas de depuración de calidad:** Excelente hábito de proporcionar los objetos de error JSON completos obtenidos en los fallos de n8n.

---

## Áreas de Mejora Prioritarias

1.  **Abandonar el "Vibe-Coding" visual:**
    *   *Problema:* El usuario solicita "efectos espejo", "animaciones drásticas", "líneas exteriores más fuertes" de forma subjetiva. Esto produce un bucle ineficiente de prueba y error.
    *   *Solución:* Definir un archivo `STYLE_GUIDE.md` inicial con clases de Tailwind exactas, paletas de colores hex, y reglas de márgenes/bordes antes de programar la UI.
2.  **Aislamiento de contexto y prevención de "Prompt Pollution":**
    *   *Problema:* Se introdujeron datos de contacto ajenos al proyecto que tuvieron que ser revertidos inmediatamente después de contaminar la lógica de WhatsApp.
    *   *Solución:* Utilizar prompts del sistema o archivos `.env` locales para variables de configuración en lugar de instruir al agente con nombres y números directamente en el chat.
3.  **Higiene de Prompts (Typos y Estructuración):**
    *   *Problema:* Múltiples palabras mal escritas ("isntuccion", "acutlemtne", "pedneitne") que en contextos de código estricto pueden indicar al LLM nombres de variables o estados erróneos.
    *   *Solución:* Dedicar unos segundos a revisar el texto o estructurarlo con viñetas claras antes de enviarlo.

---

## Recursos y Referencias

*   **Spec-Driven Development en Agentes de IA (2025/2026):** Tratamiento de archivos markdown como contratos ejecutables.
*   **Context Engineering:** Cómo guiar agentes limitando el alcance mediante instrucciones contextuales claras en lugar de prompts conversacionales excesivamente largos.
*   **Astro + Tailwind 4 Best Practices:** Estructura modular del frontend y paso de propiedades estables en SSG.

---

## Plan de Acción Sugerido

| Paso | Acción Concreta | Propósito |
| :--- | :--- | :--- |
| **1** | Crear un archivo `/home/carmay-dev/proyectos/webIA/CLAUDE.md` | Servir de memoria persistente para el agente con el stack tecnológico, comandos para compilar la web, y guías de estilo obligatorias. |
| **2** | Establecer un `SPEC.md` al iniciar nuevas features | Escribir los requerimientos funcionales exactos del WebSocket o base de datos antes de escribir código. |
| **3** | Usar variables de entorno (`.env`) para la mensajería | Aislar números de prueba, grupos de feedback y credenciales de los prompts del chat. |
| **4** | Validar la compilación estática localmente | Ejecutar de manera constante comandos de diagnóstico (`npm run build`) para capturar errores de tipado o rutas de logos rotas antes del despliegue en Caddy. |
