module gio.NativeSocketAddress;

private import gio.SocketAddress;
private import gio.c.functions;
public  import gio.c.types;
private import glib.ConstructionException;
private import gobject.ObjectG;


/**
 * A socket address of some unknown native type.
 */
public class NativeSocketAddress : SocketAddress
{
	/** the main Gtk struct */
	protected GNativeSocketAddress* gNativeSocketAddress;

	/** Get the main Gtk struct */
	public GNativeSocketAddress* getNativeSocketAddressStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gNativeSocketAddress;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gNativeSocketAddress;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GNativeSocketAddress* gNativeSocketAddress, bool ownedRef = false)
	{
		this.gNativeSocketAddress = gNativeSocketAddress;
		super(cast(GSocketAddress*)gNativeSocketAddress, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return g_native_socket_address_get_type();
	}

	/**
	 * Creates a new #GNativeSocketAddress for @native and @len.
	 *
	 * Params:
	 *     native = a native address object
	 *     len = the length of @native, in bytes
	 *
	 * Returns: a new #GNativeSocketAddress
	 *
	 * Since: 2.46
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(void* native, size_t len)
	{
		auto __p = g_native_socket_address_new(native, len);

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GNativeSocketAddress*) __p, true);
	}
}
