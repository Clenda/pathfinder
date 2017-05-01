<?php
/**
 * Created by PhpStorm.
 * User: exodus4d
 * Date: 30.03.15
 * Time: 00:04
 */

namespace Model;

use Controller\Api\User as User;
use Controller\Controller as Controller;
use DB\SQL\Schema;

class CharacterLogModel extends BasicModel {

    protected $table = 'character_log';

    protected $fieldConf = [
        'active' => [
            'type' => Schema::DT_BOOL,
            'nullable' => false,
            'default' => 1,
            'index' => true
        ],
        'characterId' => [
            'type' => Schema::DT_INT,
            'index' => true,
            'unique' => true,
            'belongs-to-one' => 'Model\CharacterModel',
            'constraint' => [
                [
                    'table' => 'character',
                    'on-delete' => 'CASCADE'
                ]
            ]
        ],
        'systemId' => [
            'type' => Schema::DT_INT,
            'index' => true
        ],
        'systemName' => [
            'type' => Schema::DT_VARCHAR128,
            'nullable' => false,
            'default' => ''
        ],
        'shipTypeId' => [
            'type' => Schema::DT_INT,
            'index' => true
        ],
        'shipTypeName' => [
            'type' => Schema::DT_VARCHAR128,
            'nullable' => false,
            'default' => ''
        ],
        'shipId' => [
            'type' => Schema::DT_BIGINT,
            'index' => true
        ],
        'shipName' => [
            'type' => Schema::DT_VARCHAR128,
            'nullable' => false,
            'default' => ''
        ],
        'stationId' => [
            'type' => Schema::DT_INT,
            'index' => true
        ],
        'stationName' => [
            'type' => Schema::DT_VARCHAR128,
            'nullable' => false,
            'default' => ''
        ]
    ];

    /**
     * set log data from array
     * @param array $logData
     */
    public function setData($logData){

        if( isset($logData['system']) ){
            $this->systemId = (int)$logData['system']['id'];
            $this->systemName = $logData['system']['name'];
        }else{
            $this->systemId = null;
            $this->systemName = '';
        }

        if( isset($logData['ship']) ){
            $this->shipTypeId = (int)$logData['ship']['typeId'];
            $this->shipTypeName = $logData['ship']['typeName'];
            $this->shipId = (int)$logData['ship']['id'];
            $this->shipName = $logData['ship']['name'];
        }else{
            $this->shipTypeId = null;
            $this->shipTypeName = '';
            $this->shipId = null;
            $this->shipName = '';
        }

        if( isset($logData['station']) ){
            $this->stationId = (int)$logData['station']['id'];
            $this->stationName = $logData['station']['name'];
        }else{
            $this->stationId = null;
            $this->stationName = '';
        }

    }

    /**
     * get all character log data
     * @return object
     */
    public function getData(){

        $logData = (object) [];
        $logData->system = (object) [];
        $logData->system->id = (int)$this->systemId;
        $logData->system->name = $this->systemName;

        $logData->ship = (object) [];
        $logData->ship->typeId = (int)$this->shipTypeId;
        $logData->ship->typeName = $this->shipTypeName;
        $logData->ship->id = $this->shipId;
        $logData->ship->name = $this->shipName;

        $logData->station = (object) [];
        $logData->station->id = (int)$this->stationId;
        $logData->station->name = $this->stationName;

        return $logData;
    }

    /**
     * @param int $systemId
     * @return int
     */
    public function set_systemId($systemId){
        if($systemId > 0){
            $this->updateCharacterSessionLocation($systemId);
        }
        return $systemId;
    }

    /**
     * Event "Hook" function
     * return false will stop any further action
     * @param self $self
     * @param $pkeys
     */
    public function afterInsertEvent($self, $pkeys){
        $self->clearCacheData();
    }

    /**
     * Event "Hook" function
     * return false will stop any further action
     * @param self $self
     * @param $pkeys
     */
    public function afterUpdateEvent($self, $pkeys){
        $self->clearCacheData();
    }

    /**
     * Event "Hook" function
     * can be overwritten
     * @param self $self
     * @param $pkeys
     */
    public function afterEraseEvent($self, $pkeys){
        $self->clearCacheData();
    }

    /**
     * see parent
     */
    public function clearCacheData(){
        // clear character "LOG" cache
        // -> character data without "LOG" has not changed!
        $this->characterId->clearCacheDataWithPrefix(CharacterModel::DATA_CACHE_KEY_LOG);
    }

    /**
     * update session data for active character
     * @param int $systemId
     */
    protected function updateCharacterSessionLocation($systemId){
        $controller = new Controller();

        if(
            !empty($sessionCharacter = $controller->getSessionCharacterData()) &&
            $sessionCharacter['ID'] === $this->get('characterId', true)
        ){
            $prevSystemId = (int)$sessionCharacter['PREV_SYSTEM_ID'];

            if($prevSystemId === 0){
                $sessionCharacter['PREV_SYSTEM_ID'] = (int)$systemId;
            }else{
                $sessionCharacter['PREV_SYSTEM_ID'] = $this->systemId;
            }

            $sessionCharacters = CharacterModel::mergeSessionCharacterData([$sessionCharacter]);
            $this->getF3()->set(User::SESSION_KEY_CHARACTERS, $sessionCharacters);
        }
    }

} 