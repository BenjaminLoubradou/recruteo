<?php


namespace App;


use App\Kernel\DB; // ajouter avec l'auto-complétion

class Developpeur
{
    private $id;
    private $nom;
    private $bio;
    private $created_at;
    private $db; // ne pas oublier le $db avant de créer l'appel de DB dans le construteur

    // constructeur
    public function __construct()
    {
        // on appelle une nouvelle création
        $this->db = new DB();
    }

    // getterd and setters
    /**
     * @return mixed
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @param mixed $id
     * @return Developpeur
     */
    public function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    /**
     * @return mixed
     */
    public function getNom()
    {
        return $this->nom;
    }

    /**
     * @param mixed $nom
     * @return Developpeur
     */
    public function setNom($nom)
    {
        $this->nom = strtoupper($nom);
        return $this;
    }

    /**
     * @return mixed
     */
    public function getBio()
    {
        return $this->bio;
    }

    /**
     * @param mixed $bio
     * @return Developpeur
     */
    public function setBio($bio)
    {
        $this->bio = $bio;
        return $this;
    }

    /**
     * @return mixed
     */
    public function getCreatedAt()
    {
        return $this->created_at;
    }

    /**
     * @param mixed $created_at
     * @return Developpeur
     */
    public function setCreatedAt(\DateTime $created_at)
    {
        $this->created_at = $created_at->format('Y-m-d H:i:s');
        return $this;
    }

    public function findDeveloppeurEquipe($id_equipe){
        // attention lorsque l'on veut appeler un alias à la table developpeur 'd',
        // il faut préciser le meme alias sur le SELECT que l'on veut appeler.
        $sql = "SELECT d.* FROM developpeur d ";
        $sql .= "LEFT JOIN equipe_developpeur ed ON d.id = ed.id_developpeur ";
        $sql .= "LEFT JOIN equipe e ON e.id = ed.id_equipe ";
        $sql .= "WHERE e.id=:id";
        $stmt = $this->db->getPdo()->prepare($sql); // prepare la requete PDO(filtre)
        $stmt->bindParam(':id',$id_equipe,\PDO::PARAM_INT); // on lie les params
        $stmt->execute();
        $stmt->setFetchMode(\PDO::FETCH_CLASS,'App\Developpeur');
        $resultat = $stmt->fetchAll();
        return $resultat;
    }

    public function findOneDeveloppeur($id_developpeur){
        // on fait une fonction pour trouver un developpeur
        $sql = "SELECT * FROM developpeur d ";
        $sql .= "WHERE d.id=:id";
        $stmt = $this->db->getPdo()->prepare($sql);
        $stmt->bindParam(':id',$id_developpeur,\PDO::PARAM_INT);
        $stmt->execute();
        $stmt->setFetchMode(\PDO::FETCH_CLASS,'App\Developpeur');
        $resultat = $stmt->fetch(); // on recupéré les datas d'un developpeur
        return $resultat;

    }

    public function getLangages(){
        // on cible les langages pratiquer par un développeur depuis la table language_developpeur
        $sql = "SELECT * FROM langage l ";
        $sql .= "LEFT JOIN langage_developpeur ld ON l.id = ld.id_langage ";
        $sql .= "WHERE ld.id_developpeur=:id";
        $stmt = $this->db->getPdo()->prepare($sql);
        $stmt->bindValue(':id',$this->getId(),\PDO::PARAM_INT);
        $stmt->execute();
        $stmt->setFetchMode(\PDO::FETCH_CLASS,"App\Langage");
        $resultat = $stmt->fetchAll();
        return $resultat;
    }

    public function addDeveloppeur(){
        $sql = "INSERT INTO developpeur (nom,bio,created_at) VALUES (:nom,:bio,:created_at)";
        $stmt = $this->db->getPdo()->prepare($sql);
        $stmt->bindValue(':nom',$this->getNom(),\PDO::PARAM_STR);
        $stmt->bindValue(':bio',$this->getBio(),\PDO::PARAM_STR);
        $stmt->bindValue(':created_at',$this->getCreatedAt(),\PDO::PARAM_STR);
        $stmt->execute();

        //récupération de l'id du nouveau dev
        $id_dev = $this->db->getPdo()->lastInsertId();
        $this->setId($id_dev);
    }

    public function addLangages($langages){
        $sql = "INSERT INTO langage_developpeur(id_developpeur,id_langage) VALUES (:id_developpeur, :id_langage)";
        $stmt = $this->db->getPdo()->prepare($sql);
        foreach ($langages as $langage){
            if($langage != 0){
                $stmt->bindValue(':id_developpeur',$this->getId(),\PDO::PARAM_STR);
                $stmt->bindValue(':id_langage',$langage,\PDO::PARAM_STR);
                $stmt->execute();
            }

        }
    }
}