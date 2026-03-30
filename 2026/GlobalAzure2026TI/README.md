# Events — SQL Toolbox Dev AI

## Setup

1. Clone the `Events-SQLToolboxDevAI` repository
2. Set SSMS theme to **Dark** and enable **tabs on the right**
3. Restore the **AdventureWorks2017** database
4. Restore the **WideWorldImportersDW** database
5. Launch **ZoomIt** inside the VM

## Demo 1 — SSMS Features

- Open **Visual Studio Installer** and show that SSMS is managed from there
- Open **SSMS**
- Switch the theme to **Light**
- Demonstrate the **Zoom** feature
- Show **vertical tabs**, pinning, and renaming
- Create a **database solution**, add a table (demonstrating code completion), and compile

## Demo 2 — GitHub Copilot in SSMS

1. Connect to **WideWorldImporters**
2. Open a **new Copilot thread** — model: `Claude Sonnet 4.6`
3. Open a **new query window**
4. Run the following prompts one by one:

   ```
   Which tables are connected to fact.order?
   How can I check the statistics of the fact.sale table?
   Which cities are from Arizona?
   List the row count for all tables in the database.
   ```

5. Switch connection to **AdventureWorks2017**
6. Run this prompt:

   ```
   Give me the list of fields used in sales.vIndividualCustomer, grouped per source table.
   ```

7. Update the table name returned by Copilot, then run:

   ```
   For each table in "Base Table", generate T-SQL to create a view selecting only the fields listed in "Column used".
   Follow this pattern:
     CREATE VIEW etl.vw_<source_table_schema><source_table_name>
     AS SELECT <list of fields>
     FROM AdventureWorks2017.<source_table_schema>.<source_table_name> AS t
   Use aliases for all field references. Place the comma at the beginning of each line.
   Return everything in a single script.
   ```

## Demo 3 — MCP + Microsoft Docs in SSMS

1. Clear the Copilot Chat in SSMS
2. Run the following prompt:

   ```
   You have access to MCP tools called microsoft_docs_search and microsoft_docs_fetch.
   These tools let you search and fetch Microsoft's latest official documentation,
   which may be more detailed or newer than your training data.

   When a question involves a Microsoft product, service, or technology, use these
   tools to search for an answer and fetch content for deep research.

   Question: What does the "Default globbing pattern for .sql files in the project"
   setting mean in an SDK-style database project?
   ```

## Demo 4 — Data API Builder (DAB) + MCP Security

1. Review the `00_setup_sqlserver.sql` script to understand the initial setup
2. Open a terminal in the project folder and run:

   ```bash
   dab start
   ```

3. Open **VS Code** and launch **GitHub Copilot Chat**
4. Select model: `Claude Sonnet 4.6`
5. **Disable** the MSSQL MCP Server
6. Run the following prompts to demonstrate DAB security boundaries:

   ```
   How many people are named Ken? You can use an MCP server to answer.
   Can you give me their phone numbers?
   Can you give me their sales figures?
   Can you give me their password hashes?
   ```
