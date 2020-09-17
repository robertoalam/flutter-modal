class Colega{

    int id;
    String name;

    Colega(this.id, this.name);

    static List<Colega> getColegas() {
        return <Colega>[
            Colega(1, 'Roberto'),
            Colega(2, 'Guilherme'),
            Colega(3, 'Jorge'),
            Colega(4, 'Douglas'),
            Colega(5, 'Diogo'),
            Colega(6, 'Cristiano'),
            Colega(7, 'Celia'),
            Colega(8, 'Carmen'),
            Colega(9, 'Andre Mauricio'),
            Colega(10, 'Cicero'),
        ];
    }
}