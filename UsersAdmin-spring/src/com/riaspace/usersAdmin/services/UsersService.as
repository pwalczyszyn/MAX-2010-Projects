package com.riaspace.usersAdmin.services
{
	import com.riaspace.usersAdmin.models.domain.User;
	
	import mx.rpc.remoting.RemoteObject;
	
	import org.as3commons.lang.Assert;
	import org.springextensions.actionscript.core.operation.IOperation;
	import org.springextensions.actionscript.rpc.remoting.RemoteObjectService;

	public class UsersService extends RemoteObjectService
	{
		public function UsersService(remoteObject:RemoteObject)
		{
			Assert.notNull(remoteObject,"remoteObject argument must not be null");
			super(remoteObject);
		}
		
		public function findAllUsers():IOperation
		{
			return call("findAllUsers");
		}
		
		public function create(user:User):IOperation
		{
			return call("create", user);
		}
		
		public function update(user:User):IOperation
		{
			return null;
		}
	}
}