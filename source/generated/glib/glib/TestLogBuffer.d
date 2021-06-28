module glib.TestLogBuffer;

private import glib.ConstructionException;
private import glib.TestLogMsg;
private import glib.c.functions;
public  import glib.c.types;
private import linker.loader;


/** */
public class TestLogBuffer
{
	/** the main Gtk struct */
	protected GTestLogBuffer* gTestLogBuffer;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public GTestLogBuffer* getTestLogBufferStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gTestLogBuffer;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gTestLogBuffer;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GTestLogBuffer* gTestLogBuffer, bool ownedRef = false)
	{
		this.gTestLogBuffer = gTestLogBuffer;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( Linker.isLoaded(LIBRARY_GLIB[0]) && ownedRef )
			g_test_log_buffer_free(gTestLogBuffer);
	}


	/**
	 * Internal function for gtester to free test log messages, no ABI guarantees provided.
	 */
	public void free()
	{
		g_test_log_buffer_free(gTestLogBuffer);
		ownedRef = false;
	}

	/**
	 * Internal function for gtester to retrieve test log messages, no ABI guarantees provided.
	 */
	public TestLogMsg pop()
	{
		auto __p = g_test_log_buffer_pop(gTestLogBuffer);

		if(__p is null)
		{
			return null;
		}

		return new TestLogMsg(cast(GTestLogMsg*) __p);
	}

	/**
	 * Internal function for gtester to decode test log messages, no ABI guarantees provided.
	 */
	public void push(uint nBytes, ubyte* bytes)
	{
		g_test_log_buffer_push(gTestLogBuffer, nBytes, bytes);
	}

	/**
	 * Internal function for gtester to decode test log messages, no ABI guarantees provided.
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto __p = g_test_log_buffer_new();

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GTestLogBuffer*) __p);
	}
}
