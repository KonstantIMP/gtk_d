module atk.ImplementorIF;

private import atk.ObjectAtk;
private import atk.c.functions;
public  import atk.c.types;
private import gobject.ObjectG;


/** */
public interface ImplementorIF{
	/** Get the main Gtk struct */
	public AtkImplementor* getImplementorStruct(bool transferOwnership = false);

	/** the main Gtk struct as a void* */
	protected void* getStruct();


	/**
	 * Gets a reference to an object's #AtkObject implementation, if
	 * the object implements #AtkObjectIface
	 *
	 * Returns: a reference to an object's #AtkObject
	 *     implementation
	 */
	public ObjectAtk refAccessible();

	/** */
	public static GType getType()
	{
		return atk_implementor_get_type();
	}
}
