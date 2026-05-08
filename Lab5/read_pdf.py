import sys
import pypdf

def extract():
    try:
        reader = pypdf.PdfReader(r'C:\Users\iagov\Documents\MATLAB\Processamento-Digital-De-Sinais-Pedro\Lab5\Material\Introduc807a771o_a_Imagem.pdf')
        for i, page in enumerate(reader.pages):
            print(f"--- PAGE {i+1} ---")
            print(page.extract_text())
    except Exception as e:
        print(f"Error: {e}")

if __name__ == '__main__':
    extract()
