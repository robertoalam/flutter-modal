class ProfissaoModel{
    int id;
    String nome;

    ProfissaoModel(this.id, this.nome){
        this.id = id;
        this.nome = nome;
    }

    static List<ProfissaoModel> getProfissoes() {
        return <ProfissaoModel>[
            ProfissaoModel(1, 'TeleInformacao'),
            ProfissaoModel(2, 'Digital Influencer'),
            ProfissaoModel(3, 'Empresariado'),
            ProfissaoModel(4, 'Enfermagem'),
            ProfissaoModel(5, 'Médico'),
            ProfissaoModel(6, 'Eletricista'),
        ];
    }    
}