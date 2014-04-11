<?php

class Device
    extends GetterSetter
{

    private $_id;
    private $_userId;

    /**
     * Constructs a new Device object.
     *
     * @param   string	$id
     * @param   int 	$userId
     */
    public function __construct(
            $id, $userId
        )
    {
        if (!is_string($id))
            throw new Exception("The \$id parameter must be an string");
        $this->_id = (string) $id;

		if (!is_numeric($userId))
			throw new Exception("The \$userId paramater must be an int");
		$this->_userId = (int) $userId;
    } // __construct

    protected function getId() {
        return $this->_id;
    } // getId

    protected function getUserId() {
        return $this->_userId;
    } // getUserId

    public function __toString() {
        return __CLASS__ ."(id=$this->id, userId=$this->userId)";
    } // __toString

} // class Device