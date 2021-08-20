package jmongodb;

import java.util.Scanner;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;


public class Utils {
	
	static Scanner teclado = new Scanner(System.in);

	public static MongoCollection<Document> conectar() {
		try {
			MongoClient conn = MongoClients.create(
				MongoClientSettings.builder()
				.applyToClusterSettings(builder ->
				  builder.hosts(Arrays.asList(new ServerAddress("localhost", 27017))))
				       .build());

			MongoDatabase database = conn.getDatabase("nome do banco de dados");
			MongoCollection<Document> collection = database.getCollection("produtos"); // nome da coleção

			return collection;
		}catch(Exception e) {
			e.printStackTrace();
			return null
		}
	}

	public static void desconectar(MongoCursor<Document> cursor) {
		cursor.close();
	}
	
	public static void listar() {
		MongoCollection<Document> collection = conectar();

		if(collection.countDocument() > 0) {
			MongoCursor<Document> cursor = collection.find().iterator();

			try {
				System.out.println("Listando produtos...")
			} catch(Exception e) {
				e.printStackTrace();
			}
			desconectar(cursor);
		} else {
			System.out.println("Não existem documentos cadastrados.")
		}
	}
	
	public static void inserir() {
		System.out.println("Inserindo produtos...");
	}
	
	public static void atualizar() {
		System.out.println("Atualizando produtos...");
	}
	
	public static void deletar() {
		System.out.println("Deletando produtos...");
	}
	
	public static void menu() {
		System.out.println("==================Gerenciamento de Produtos===============");
		System.out.println("Selecione uma opção: ");
		System.out.println("1 - Listar produtos.");
		System.out.println("2 - Inserir produtos.");
		System.out.println("3 - Atualizar produtos.");
		System.out.println("4 - Deletar produtos.");
		
		int opcao = Integer.parseInt(teclado.nextLine());
		if(opcao == 1) {
			listar();
		}else if(opcao == 2) {
			inserir();
		}else if(opcao == 3) {
			atualizar();
		}else if(opcao == 4) {
			deletar();
		}else {
			System.out.println("Opção inválida.");
		}
	}
}
