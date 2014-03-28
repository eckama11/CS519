<?php

class User
    extends GetterSetter
{

    private $_id;
    private $_username;
    private $_password;

    /**
     * Constructs a new User object.
     *
     * @param   int     $id
     * @param   string  $username
     * @param   string  $password
     */
    public function __construct(
            $id, $username, $password
        )
    {
        if (!is_numeric($id))
            throw new Exception("The \$id parameter must be an integer");
        $this->_id = (int) $id;

        $this->username = $username;
        $this->password = $password;
    } // __construct
    
    protected function getId() {
        return $this->_id;
    } // getId

    protected function getUsername() {
        return $this->_username;
    } // getUsername
    
    protected function setUsername($newUsername) {
        $newUsername = trim($newUsername);
        if (empty($newUsername))
            throw new Exception("Username cannot be empty string");
        $this->_username = $newUsername;
    } // setUsername

    protected function getPassword() {
        return $this->_password;
    } // getPassword
    
    protected function setPassword($newPassword) {
        if (empty($newPassword))
            throw new Exception("Password cannot be empty string");
        $this->_password = $newPassword;
    } // setPassword

    public function __toString() {
        return __CLASS__ ."(id=$this->id, username=$this->username, password=$this->password,)";
    } // __toString

} // class User
