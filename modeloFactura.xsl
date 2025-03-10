<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <title>Factura Telefónica</title>
                <style>
                    body { 
                        font-family: 'Helvetica', sans-serif; 
                        background-color: #fffaf0; 
                        margin: 0; 
                        padding: 20px; 
                        display: flex; 
                        justify-content: center;
                        color: #000000;
                    }
                    .invoice-container { 
                        max-width: 800px; 
                        background: #ffeb3b; 
                        border: 2px solid #000000; 
                        border-radius: 8px; 
                        padding: 20px; 
                    }
                    .header { 
                        text-align: center; 
                        font-size: 26px; 
                        color: #000000;
                        padding-bottom: 10px; 
                        margin-bottom: 15px; 
                        border-bottom: 2px solid #000000; 
                    }
                    .section {
                        background-color: #fffbe6;
                        padding: 12px;
                        margin-bottom: 10px;
                        border-radius: 5px;
                    }
                    .section__title {
                        font-size: 18px;
                        color: #000000;
                        margin-bottom: 8px;
                        text-transform: uppercase;
                    }
                    .table {
                        width: 100%;
                        border-collapse: collapse;
                        margin-top: 10px;
                    }
                    .table th {
                        background: #000000;
                        color: #ffeb3b;
                        padding: 8px;
                        text-transform: uppercase;
                    }
                    .table td {
                        padding: 8px;
                        border-bottom: 1px solid #000000;
                    }
                    .total {
                        text-align: right;
                        margin-top: 15px;
                        font-weight: bold;
                        color: #000000;
                    }
                </style>
            </head>
            <body>
                <div class="invoice-container">
                    <div class="header">Factura Telefónica</div>
                    <div class="section">
                        <h2 class="section__title">Datos del Cliente</h2>
                        <p><strong>Nombre:</strong> <xsl:value-of select="//BuyerParty/Individual/Name" /> <xsl:value-of select="//BuyerParty/Individual/FirstSurname" /></p>
                        <p><strong>Dirección:</strong> <xsl:value-of select="//BuyerParty/Individual/OverseasAddress/Address" />, <xsl:value-of select="//BuyerParty/Individual/OverseasAddress/PostCodeAndTown" /></p>
                        <p><strong>Teléfono:</strong> <xsl:value-of select="//BuyerParty/Individual/ContactDetails/Telephone" /></p>
                    </div>
                    <div class="section">
                        <h2 class="section__title">Detalles de la Factura</h2>
                        <table class="table">
                            <tr>
                                <th>Fecha</th>
                                <th>Descripción</th>
                                <th>Cantidad</th>
                                <th>Precio</th>
                            </tr>
                            <xsl:for-each select="//Invoice/Items/InvoiceLine">
                                <tr>
                                    <td><xsl:value-of select="../../InvoiceIssueData/IssueDate" /></td>
                                    <td><xsl:value-of select="ItemDescription" /></td>
                                    <td><xsl:value-of select="Quantity" /></td>
                                    <td><xsl:value-of select="UnitPriceWithoutTax" /> €</td>
                                </tr>
                            </xsl:for-each>
                        </table>
                        <div class="total">
                            <p><strong>Total: </strong> <xsl:value-of select="//InvoiceTotals/InvoiceTotal" /> €</p>
                        </div>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>