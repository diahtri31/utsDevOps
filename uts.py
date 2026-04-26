import pandas as pd

data = {
    'produk': ['Baju', 'Sepatu', 'Tas', 'Jam', 'Topi'],
    'harga': [150000, 300000, 200000, 500000, 75000],
    'qty': [5, 2, 3, 1, 4]
}
df = pd.DataFrame(data)
df['total'] = df['harga'] * df['qty']

print('--- Analisis Penjualan ---')
print(df)
print("Total Penjualan:", df['total'].sum())
print("Produk Terlaris:", df.loc[df['total'].idxmax(), 'produk'])
print('--- Selesai ---')
