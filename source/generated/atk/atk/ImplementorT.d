module atk.ImplementorT;

public  import atk.ObjectAtk;
public  import atk.c.functions;
public  import atk.c.types;
public  import gobject.ObjectG;


/** */
public template ImplementorT(TStruct)
{
	/** Get the main Gtk struct */
	public AtkImplementor* getImplementorStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return cast(AtkImplementor*)getStruct();
	}


	/**
	 * Gets a reference to an object's #AtkObject implementation, if
	 * the object implements #AtkObjectIface
	 *
	 * Returns: a reference to an object's #AtkObject
	 *     implementation
	 */
	public ObjectAtk refAccessible()
	{
		auto __p = atk_implementor_ref_accessible(getImplementorStruct());

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(ObjectAtk)(cast(AtkObject*) __p, true);
	}
}
