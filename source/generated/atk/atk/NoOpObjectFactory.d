module atk.NoOpObjectFactory;

private import atk.ObjectFactory;
private import atk.c.functions;
public  import atk.c.types;
private import glib.ConstructionException;
private import gobject.ObjectG;


/**
 * The AtkObjectFactory which creates an AtkNoOpObject. An instance of
 * this is created by an AtkRegistry if no factory type has not been
 * specified to create an accessible object of a particular type.
 */
public class NoOpObjectFactory : ObjectFactory
{
	/** the main Gtk struct */
	protected AtkNoOpObjectFactory* atkNoOpObjectFactory;

	/** Get the main Gtk struct */
	public AtkNoOpObjectFactory* getNoOpObjectFactoryStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return atkNoOpObjectFactory;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)atkNoOpObjectFactory;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (AtkNoOpObjectFactory* atkNoOpObjectFactory, bool ownedRef = false)
	{
		this.atkNoOpObjectFactory = atkNoOpObjectFactory;
		super(cast(AtkObjectFactory*)atkNoOpObjectFactory, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return atk_no_op_object_factory_get_type();
	}

	/**
	 * Creates an instance of an #AtkObjectFactory which generates primitive
	 * (non-functioning) #AtkObjects.
	 *
	 * Returns: an instance of an #AtkObjectFactory
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto __p = atk_no_op_object_factory_new();

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(AtkNoOpObjectFactory*) __p, true);
	}
}
