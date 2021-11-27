module glib.TestCase;

private import glib.c.functions;
public  import glib.c.types;
private import linker.loader;


/**
 * An opaque structure representing a test case.
 */
public class TestCase
{
	/** the main Gtk struct */
	protected GTestCase* gTestCase;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public GTestCase* getTestCaseStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gTestCase;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gTestCase;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GTestCase* gTestCase, bool ownedRef = false)
	{
		this.gTestCase = gTestCase;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( Linker.isLoaded(LIBRARY_GLIB[0]) && ownedRef )
			g_test_case_free(gTestCase);
	}


	/**
	 * Free the @test_case.
	 *
	 * Since: 2.70
	 */
	public void free()
	{
		g_test_case_free(gTestCase);
		ownedRef = false;
	}
}
