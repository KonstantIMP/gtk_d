module glib.Once;

private import glib.MemorySlice;
private import glib.c.functions;
public  import glib.c.types;
private import linker.loader;


/**
 * A #GOnce struct controls a one-time initialization function. Any
 * one-time initialization function must have its own unique #GOnce
 * struct.
 *
 * Since: 2.4
 */
public final class Once
{
	/** the main Gtk struct */
	protected GOnce* gOnce;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public GOnce* getOnceStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gOnce;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gOnce;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GOnce* gOnce, bool ownedRef = false)
	{
		this.gOnce = gOnce;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( Linker.isLoaded(LIBRARY_GLIB[0]) && ownedRef )
			sliceFree(gOnce);
	}


	/**
	 * the status of the #GOnce
	 */
	public @property GOnceStatus status()
	{
		return gOnce.status;
	}

	/** Ditto */
	public @property void status(GOnceStatus value)
	{
		gOnce.status = value;
	}

	/**
	 * the value returned by the call to the function, if @status
	 * is %G_ONCE_STATUS_READY
	 */
	public @property void* retval()
	{
		return gOnce.retval;
	}

	/** Ditto */
	public @property void retval(void* value)
	{
		gOnce.retval = value;
	}

	/** */
	public void* impl(GThreadFunc func, void* arg)
	{
		return g_once_impl(gOnce, func, arg);
	}

	/**
	 * Function to be called when starting a critical initialization
	 * section. The argument @location must point to a static
	 * 0-initialized variable that will be set to a value other than 0 at
	 * the end of the initialization section. In combination with
	 * g_once_init_leave() and the unique address @value_location, it can
	 * be ensured that an initialization section will be executed only once
	 * during a program's life time, and that concurrent threads are
	 * blocked until initialization completed. To be used in constructs
	 * like this:
	 *
	 * |[<!-- language="C" -->
	 * static gsize initialization_value = 0;
	 *
	 * if (g_once_init_enter (&initialization_value))
	 * {
	 * gsize setup_value = 42; // initialization code here
	 *
	 * g_once_init_leave (&initialization_value, setup_value);
	 * }
	 *
	 * // use initialization_value here
	 * ]|
	 *
	 * While @location has a `volatile` qualifier, this is a historical artifact and
	 * the pointer passed to it should not be `volatile`.
	 *
	 * Params:
	 *     location = location of a static initializable variable
	 *         containing 0
	 *
	 * Returns: %TRUE if the initialization section should be entered,
	 *     %FALSE and blocks otherwise
	 *
	 * Since: 2.14
	 */
	public static bool initEnter(void* location)
	{
		return g_once_init_enter(location) != 0;
	}

	/**
	 * Counterpart to g_once_init_enter(). Expects a location of a static
	 * 0-initialized initialization variable, and an initialization value
	 * other than 0. Sets the variable to the initialization value, and
	 * releases concurrent threads blocking in g_once_init_enter() on this
	 * initialization variable.
	 *
	 * While @location has a `volatile` qualifier, this is a historical artifact and
	 * the pointer passed to it should not be `volatile`.
	 *
	 * Params:
	 *     location = location of a static initializable variable
	 *         containing 0
	 *     result = new non-0 value for *@value_location
	 *
	 * Since: 2.14
	 */
	public static void initLeave(void* location, size_t result)
	{
		g_once_init_leave(location, result);
	}
}
